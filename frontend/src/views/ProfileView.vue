<template>
  <div class="v-container-fluid w-100 mt-16">
    <v-row>
      <profile-section :user="user"/>
      <v-col class="d-flex flex-column justify-start v-col-sm-8">
        <v-tabs
            align-tabs="center"
            fixed-tabs
            background-color="indigo"
            dark
            v-model="tab"
            @update:modelValue="getUserOrdersAndReviewsAndUsers(tab, true)"
        >
          <v-tab :value="1">
            Orders
          </v-tab>
          <v-tab :value="2">
            Reviews
          </v-tab>
          <v-tab v-if="user.role_id === 1" :value="3">
            Users
          </v-tab>
        </v-tabs>
        <v-window v-model="tab">
          <v-window-item
              v-for="n in 3"
              :key="n"
              :value="n"
          >
            <div v-show="n === 3" :class="inputLengthCount()" class="wrap">
              <input type="text" class="input" v-model.trim="query" @keyup.enter="searchItems(this.query)" :class="inputLengthCount()" placeholder="Поиск...  ">
              <button class="fa text-black" @click="toggleClass"><v-icon icon="mdi-magnify"></v-icon></button>
            </div>
            <div class="d-flex justify-center mb-10 mt-4">
              <h2>{{ n === 1 ? 'Orders' : null }} {{ n === 2 ? 'Reviews' : null }} {{ n === 3 ? 'Users' : null  }}</h2>
            </div>
            <v-row v-if="n === 1 && orderItems.length !== 0" :style="display !== 'xs' ? 'height: 73vh': null" class="d-flex flex-row flex-wrap justify-center">
              <order-list :display="display" :order-items="orderItems" />
            </v-row>
            <v-row class="d-flex flex-column justify-center align-center" :style="display !== 'xs' ? 'height: 72vh': null" v-else-if="n === 2 && reviews.length !== 0">
              <reviews-list :display="display" :reviews="reviews" :onDeleteReview="deleteUserReview"/>
            </v-row>
            <v-row class="d-flex flex-column justify-center align-center" :style="display !== 'xs' ? 'height: 72vh': null" v-else-if="n === 3 && users.length !== 0">
              <users-list :display="display" :users="users" />
            </v-row>
            <v-col v-else cols="12" class="d-flex flex-column justify-center align-center">
              <img src="https://cdn-icons-png.flaticon.com/512/6134/6134116.png" width="150" height="150" alt="NotFoundPicture"/>
              <p class="mt-4 text-h4">No data...</p>
            </v-col>
            <div class="mt-2">
              <v-pagination :total-visible="5" v-model="page" :length="totalPages" @update:modelValue="getUserOrdersAndReviewsAndUsers(n, false)"></v-pagination>
            </div>
          </v-window-item>
        </v-window>
      </v-col>
    </v-row>
    <review-modal :edit="true" />
    <user-modal :current-users-page="page" />
  </div>
</template>

<script>
import Cookies from "js-cookie";
import {mapActions, mapGetters, mapMutations} from "vuex";
import ReviewModal from "../components/UI/ReviewModal.vue"
import UserModal from "../components/UI/UserModal.vue"
import ProfileSection from "../components/UI/ProfileSection.vue";
import OrderList from "../components/Lists/OrdersList.vue";
import ReviewsList from "../components/Lists/ReviewsList.vue";
import UsersList from "../components/Lists/UsersList.vue";

export default {
  name: "ProfileView.vue",
  components: {UsersList, ReviewsList, OrderList, ProfileSection, UserModal, ReviewModal},
  data: () => ({
    userId: 0,
    reviewId: 0,
    productId: null,
    page: 1,
    valid: false,
    tab: null,
    query: '',
  }),
  created() {
    const user = Cookies.get('user')
    if(user) {
      const { id } = JSON.parse(user)
      this.userId = +id;
      this.getOrderItems({ userId: this.userId, page: 1 })
    }
  },
  methods: {
    inputLengthCount() {
      if(this.display === 'xs') return { activeAndroid: this.isSearchActive, wrapAndroid: true }
      return { active: this.isSearchActive }
    },
    toggleClass() {
      this.toggleSearchActive(!this.isSearchActive);
    },
    searchItems(searchQuery) {
      if(!searchQuery) return;
      this.page = 1
      this.setSearchQuery(searchQuery);
      this.searchUsers({ email: { contains: this.searchQuery } })
      this.query = '';
    },
    async deleteUserReview(reviewId) {
      await this.deleteReview(reviewId)
      await this.getReviewsByPageAndUserIdAndSortType({ page: this.page, userId: +this.userId, sortType: null })
      if(this.page > this.totalReviewsPages) {
        this.page = this.page - 1;
        await this.getReviewsByPageAndUserIdAndSortType({ page: this.page, userId: +this.userId, sortType: null })
      }
    },
    getUserOrdersAndReviewsAndUsers(panelId, flag) {
      if(flag) {
        this.page = 1;
        this.setSearchQuery(null)
        this.toggleSearchActive(false)
      }
      if(panelId === 1) {
        this.getOrderItems({ userId: +this.userId, page: this.page })
      } else if(panelId === 2) {
        this.getReviewsByPageAndUserIdAndSortType({ page: this.page, userId: +this.userId, sortType: null })
      } else if(panelId === 3) {
        this.getUsersByPageAndSortType({ page: this.page, where: { email: { contains: this.searchQuery } }, sortType: null })
      }
    },
    ...mapActions(['getOrderItems', 'getReviewsByPageAndUserIdAndSortType', 'getReviewById', 'getUsers', 'getUsersByPageAndSortType', 'searchUsers', 'deleteReview', 'getUserById']),
    ...mapMutations(['toggleSearchActive', 'setSearchQuery', 'toggleIsUser'])
  },
  computed: {
    totalPages() {
      if(this.tab === 1) {
        return this.ordersPages
      } else if (this.tab === 2) {
        return this.totalReviewsPages
      } else if (this.tab === 3) {
        return this.totalUsersPages
      }
    },
    ...mapGetters(['user', 'orderItems', 'ordersPages', 'totalReviewsPages', 'reviews', 'users', 'totalUsersPages', 'isSearchActive', 'searchQuery', 'isUser']),
  },
  props: {
    display: String,
  }
}
</script>

<style scoped>

input:invalid {
  border: 1px solid red;
}

.wrap{
  position: absolute;
  top: 1.25em;
  right: 15em;
  width: 0;
  height: 55px;
  line-height: 55px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0,0,0,0.5);
  transition: all 0.5s ease;
}

.wrap.wrapAndroid {
  position: absolute;
  top: 1.25em;
  right: 1em;
  width: 0;
  height: 55px;
  line-height: 55px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0,0,0,0.5);
  transition: all 0.5s ease;
}

.input{
  border: 0;
  background: transparent;
  width: 0%;
  outline: none;
  font-family: sans-serif;
  font-size: 18px;
  color: black;
  font-style: italic;
  transition: all 0.3s ease;
  position: relative;
}

.wrap .fa{
  color: #fff;
  position: absolute;
  right: 10px;
  font-size: 22px;
  cursor: pointer;
}

.wrap.active{
  width: 250px;
  padding-left: 25px;
  transition: all 0.5s ease;
}

.wrap.activeAndroid{
  width: 150px;
  padding-left: 25px;
  transition: all 0.5s ease;
}

.input.active{
  width: 98%;
  padding-left: 5px;
  transition: all 0.5s 0.8s ease;
}

.input.activeAndroid{
  width: 98%;
  padding-left: 5px;
  transition: all 0.5s 0.8s ease;
}

.input::placeholder {
  color: #fff;
}

</style>