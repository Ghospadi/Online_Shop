<template>
  <div class="v-container-fluid w-100 mt-16">
    <v-row>
      <v-col class="border-e v-col-sm-4">
          <div class="d-flex flex-column align-center text-center pa-3 py-5">
            <img class="rounded-circle" width="150" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="avatar"/>
            <span class="font-weight-bold">{{ user.name }}</span><span class="text-black-50">{{ user.email }}</span><span></span>
          </div>
          <form class="pa-3 py-5" @submit.stop.prevent="changeData({ name: `${this.name ? this.name : fullName[0]} ${this.surname ? this.surname : fullName[1]}`, email, age, country, city, address })">
            <div class="d-flex justify-center align-center mb-3">
              <h4 class="text-right">Profile Settings</h4>
            </div>
            <v-row class="v-row mt-2">
              <v-col class="v-col-md-6"><label class="labels">Name</label><input type="text" class="form-control" v-model="name" :placeholder="fullName[0]"></v-col>
              <v-col class="v-col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" v-model="surname" :placeholder="fullName[1]"></v-col>
            </v-row>
            <v-row class="v-row mt-3">
              <v-col class="v-col-md-12"><label class="labels">Email</label><input type="text" class="form-control" minlength="1" maxlength="254" :placeholder="this.user.email" v-model="email"></v-col>
              <v-col class="v-col-md-12"><label class="labels">Age</label><input type="number" min="8" max="99" class="form-control" :placeholder="this.user.age" v-model="age"></v-col>
            </v-row>
            <v-row class="v-row">
              <v-col class="v-col-md-6"><label class="labels">Country</label><input type="text" class="form-control" minlength="3" maxlength="254" :placeholder="this.user.country" v-model="country"></v-col>
              <v-col class="v-col-md-6 ma-0"><label class="labels">City</label><input type="text" class="form-control" minlength="1" maxlength="254" :placeholder="this.user.city" v-model="city"></v-col>
            </v-row>
            <v-row class="v-row">
              <v-col class="v-col-md-12"><label class="labels">Address</label><input type="text" class="form-control" minlength="1" maxlength="254" :placeholder="this.user.address" v-model="address"></v-col>
            </v-row>
            <div class="mt-5 d-flex align-center justify-center text-center"><input type="submit" value="Change Profile" class="floating-button"/><button class="floating-button" @click.stop.prevent="logout()">Logout</button></div>
          </form>
      </v-col>
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
              <div class="d-flex justify-center mb-10 mt-4">
                <h2>{{ n === 1 ? 'Orders' : null }} {{ n === 2 ? 'Reviews' : null }} {{ n === 3 ? 'Users' : null  }}</h2>
                <div v-show="n === 3" :class="inputLengthCount()" class="wrap">
                  <input type="text" class="input" v-model.trim="query" @keyup.enter="searchItems(this.query, this.selectedCategoryId, this.priceSortType)" :class="inputLengthCount()" placeholder="Поиск...  ">
                  <button class="fa text-black" @click="toggleClass"><v-icon icon="mdi-magnify"></v-icon></button>
                </div>
              </div>
              <v-row v-if="n === 1 && orderItems.length !== 0" :style="display !== 'xs' ? 'height: 73vh': null" class="d-flex flex-row flex-wrap justify-center">
                <v-col class="d-flex v-col-3 align-center flex-column ma-1 mt-0 pa-2 orderCard border" :class="{'v-col-10': display === 'xs'}" v-for="(order, index) in orderItems" :key="order.id">
                  <div>
                    <v-card-text class="pa-0 text-h5"> Order № {{order.id + 1}}</v-card-text>
                  </div>
                  <div class="d-flex orderItem border w-100 ma-2" :data-quantity="item.quantity" v-for="item in order.result" :key="item.id">
                    <div class="d-flex w-100">
                      <div class="d-flex">
                        <img :width="display === 'xs' ? 75 : 85" :height="display === 'xs' ? 75 : 85" :src="item.products.image" :alt="item.products.name"/>
                      </div>
                      <div class="d-flex align-center text text-wrap pl-3">
                        {{ item.products.name }}
                      </div>
                    </div>
                    <div class="d-flex justify-center text-no-wrap align-center w-25">
                      <v-card-text class="d-flex pa-1">{{ item.products.price }} €</v-card-text>
                    </div>
                  </div>
                  <div class="d-flex w-100 h-100 justify-end align-end" style="width: 50vh">
                    <v-card-text class="d-flex justify-end align-end text-h6 pa-0 pr-3">Total: {{calculatedPrice[index]}} €</v-card-text>
                  </div>
                </v-col>
              </v-row>
              <v-row class="d-flex flex-column justify-center align-center" :style="display !== 'xs' ? 'height: 76vh': null" v-else-if="n === 2 && reviews.length !== 0">
                <v-card v-for="review in reviews" :key="review.id" class="border rounded-lg mb-2 pa-0" :class="{'review': display !== 'xs', 'phone-review': display === 'xs'}">
                  <v-col cols="12" class="d-flex justify-space-between align-center pa-4">
                    <h4 class="text-center">{{ review.users.name }}</h4>
                    <h5 class="text-center" style="width: 55vh">{{ review.products.name }} </h5>
                    <p class="text-center">{{ review.timestamp.split('T')[0] }}</p>
                  </v-col>
                  <v-divider></v-divider>
                  <v-col cols="12" class="pa-0">
                    <h5 style="word-wrap: break-word;" class="pt-4 pl-4">{{ review.review }}</h5>
                    <v-rating
                        readonly
                        class="d-flex justify-center align-center"
                        empty-icon="mdi-star-outline"
                        full-icon="mdi-star"
                        half-icon="mdi-star-half-full"
                        length="5"
                        size="48"
                        v-model="review.rating"
                    ></v-rating>
                  </v-col>
                  <v-col class="d-flex pa-0 mb-2" :class="{'justify-center': display === 'xs', 'justify-end': display !== 'xs'}">
                    <v-btn class="mr-2" @click.stop="deleteUserReview(review.id)" color="error">
                      Delete Review
                    </v-btn>
                    <v-btn class="mr-2" @click.stop="editReview(review.id)" color="warning">
                      Edit Review
                    </v-btn>
                  </v-col>
                </v-card>
              </v-row>
              <v-row class="d-flex flex-column justify-center align-center" :style="display !== 'xs' ? 'height: 76vh': null" v-else-if="n === 3 && users.length !== 0">
                <v-col v-for="user in users" :key="user.id" class="border rounded-lg mb-2" :class="{'users': display !== 'xs', 'phone-users': display === 'xs'}">
                  <v-col cols="12" class="d-flex justify-space-between align-center pa-4">
                    <h4 class="text-center">{{ user.id }}</h4>
                    <h5 class="text-center">{{ user.name }} ({{user.email}}) </h5>
                    <p class="text-center">{{ user.country }}</p>
                  </v-col>
                  <v-divider></v-divider>
                  <v-col cols="12" class="pa-0">
                    <h5 style="word-wrap: break-word;" class="pt-4">{{ user.city }} {{ user.address }}</h5>
                  </v-col>
                  <v-col class="d-flex justify-end pa-0">
                    <v-btn @click.stop="editReview(user.id)" color="warning">
                      Manage User
                    </v-btn>
                  </v-col>
                </v-col>
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
  </div>
</template>

<script>
import Cookies from "js-cookie";
import {mapActions, mapGetters, mapMutations} from "vuex";
import Notiflix from "notiflix";
import ReviewModal from "../components/UI/ReviewModal.vue"

export default {
  name: "ProfileView.vue",
  components: {ReviewModal},
  data: () => ({
    userId: 0,
    reviewId: 0,
    productId: null,
    page: 1,
    valid: false,
    tab: null,
    name: '',
    surname: '',
    email: '',
    age: '',
    country: '',
    city: '',
    address: '',
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
    logout() {
      Cookies.remove('jwtToken');
      Cookies.remove('user');
      this.clearOrders()
      this.clearUserData()
      this.$router.push('/').catch((error) => console.log(error));
    },
    async changeData(data) {
      if(data.name === '' && data.email === '' && data.age === '' && data.country === '' && data.city === '' && data.address === '') {
        Notiflix.Notify.warning('You don\'t input any fields')
        return;
      }
      for(let d in data) {
        if(!data[d]) {
          delete data[d];
        }
      }
      const result = {...this.user, ...data}
      await this.updateProfile(result);
      await this.me();
    },
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
    editReview(reviewId) {
      this.getReviewById(reviewId)
      this.toggleIsReview(true)
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
    async deleteUserReview(reviewId) {
      await this.deleteReview(reviewId)
      await this.getReviewsByPageAndUserIdAndSortType({ page: 1, userId: +this.userId, sortType: null })
      this.page = 1;
    },
    ...mapActions(['me', 'updateProfile', 'getOrderItems', 'getReviewsByPageAndUserIdAndSortType', 'getReviewById', 'getUsers', 'getUsersByPageAndSortType', 'searchUsers', 'deleteReview']),
    ...mapMutations(['clearOrders', 'clearUserData', 'toggleIsReview', 'toggleSearchActive', 'setSearchQuery'])
  },
  computed: {
    calculatedPrice() {
      return this.orderItems.map(items => items.result.reduce((acc, item) => acc + item.price * item.quantity, 0));
    },
    totalPages() {
      if(this.tab === 1) {
        return this.ordersPages
      } else if (this.tab === 2) {
        return this.totalReviewsPages
      } else if (this.tab === 3) {
        return this.totalUsersPages
      }
    },
    ...mapGetters(['user', 'fullName', 'orderItems', 'ordersPages', 'totalReviewsPages', 'reviews', 'users', 'totalUsersPages', 'isSearchActive', 'searchQuery']),
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

.orderCard {
  width: 44vh;
  height: 24vh;
  margin-top: 20px;
  overflow: auto;
  border-radius: 5px;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}

.orderCard::-webkit-scrollbar {
  background: #000;
  width: 5px;
}

/* Track */
.orderCard::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
.orderCard::-webkit-scrollbar-thumb {
  background: #888;
}

/* Handle on hover */
.orderCard::-webkit-scrollbar-thumb:hover {
  background: #555;
}

.orderCard::-webkit-scrollbar:horizontal {
  display: none;
}

.orderItem {
  width: 80vh;
  border-radius: 5px;
  box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
}

.orderItem:before {
  content: attr(data-quantity);
  font-size:12px;
  font-weight:600;
  position: relative;
  top: -10px;
  right: 8px;
  background: #92B4EC;
  line-height:24px;
  padding:0 5px;
  height:24px;
  min-width:24px;
  color:white;
  opacity: 0;
  text-align:center;
  border-radius:24px;
  transition: opacity 0.5s;
}

.orderItem:hover:before {
  opacity: 1;
}

.labels {
  font-size: 11px
}

.text {
  font-size: 12px;
  overflow: hidden;
  text-overflow: ellipsis;
}

.form-control:focus {
  box-shadow: none;
  border: 1px solid #92B4EC;
}
.form-control{
  display: block;
  width: 100%;
  padding: .375rem .75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #212529;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border-radius: .25rem;
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
  outline: none;
}
.floating-button {
  text-decoration: none;
  display: inline-block;
  width: 140px;
  height: 45px;
  line-height: 45px;
  border-radius: 45px;
  margin: 10px 20px;
  font-family: 'Montserrat', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  text-align: center;
  font-weight: 600;
  color: #524f4e;
  background: white;
  box-shadow: 0 8px 15px rgba(0, 0, 0, .1);
  transition: .25s;
}
.floating-button:hover {
  background: #92B4EC;
  box-shadow: 0 15px 20px rgba(146,180,236, .4);
  color: white;
  transform: translateY(-7px);
}
.floating-button:active {
  transform: translateY(0px);
}

.review {
  width: 85vh;
  margin-bottom: 10px;
}

.phone-review {
  width: 44vh;
  margin-bottom: 10px;
}

.users {
  width: 85vh;
  margin-bottom: 10px;
}

.phone-users {
  width: 44vh;
  margin-bottom: 10px;
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