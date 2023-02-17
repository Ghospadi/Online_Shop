<template>
  <v-container :class="{ 'pa-16': display !== 'xs' }" fluid>
    <v-row :class="{ 'product-container': (display !== 'xs' && +$route.query.descriptionLength < 1702) }" class="mt-16">
      <v-col :class="{'d-flex justify-center': display === 'xs'}" cols="12" md="6">
        <img class="product-image" :src="product.image" alt="product image">
      </v-col>
      <v-col cols="12" md="6">
        <h1 class="product-name">{{product.name}} </h1>
        <v-row class="d-flex mt-6">
          <v-col cols="12" class="d-flex border rounded-lg align-center justify-space-between">
            <h3 class="ml-3 product-price">{{ product.price }} €</h3>
            <v-rating
                readonly
                class="d-flex justify-center align-center"
                empty-icon="mdi-star-outline"
                full-icon="mdi-star"
                half-icon="mdi-star-half-full"
                length="5"
                :size="display === 'xs' ? 28 : 48"
                v-model="product.rating"
            ></v-rating>
            <v-btn @click.prevent.stop="addProduct({ id: product.id, name: product.name, price: product.price, image: product.image })" class="ml-2" :border="false" :elevation="0">
              <v-icon size="large" icon="mdi-cart-variant" />
            </v-btn>
          </v-col>
        </v-row>
        <v-row class="d-flex flex-column">
          <h2 class="product-description-header mt-6 mb-2">Stock</h2>
          <p class="text-center text-h4">{{product.stock}}</p>
        </v-row>
        <v-row class="d-flex flex-column">
          <h2 class="product-description-header mt-2 mb-2">Description</h2>
          <p class="product-description-text">{{product.description}}</p>
        </v-row>
      </v-col>
    </v-row>
    <v-row class="mt-10">
      <v-col cols="12" class="d-flex flex-row justify-center align-center">
        <h2 class="review-article" :class="{'mr-8 ml-8': display === 'xs', 'mr-16 ml-16': display !== 'xs'}">Reviews:</h2>
        <v-btn
            color="#92B4EC"
            class="mt-2 mb-2"
            :class="{'mr-8 ml-8': display === 'xs', 'mr-16 ml-16': display !== 'xs'}"
            @click="toggleIsReview(true)"
        >
          Add New Review
        </v-btn>
      </v-col>
      <v-col v-if="reviews.length !== 0" cols="12" class="existing-reviews d-flex flex-column align-center">
        <v-select
            :items="sortOptions"
            v-model="sortType"
            item-value="value"
            item-title="text"
            item-disabled="disabled"
            label="Order By"
            class="sort-field"
            @update:modelValue="selectSortType()"
        ></v-select>
        <v-row v-for="review in reviews" class="border mt-6" :class="{'review': display !== 'xs', 'phone-review': display === 'xs'}">
          <v-col cols="12" class="d-flex justify-space-between align-center pa-4">
            <h4>{{ review.users.name }}</h4>
            <p>{{ review.timestamp.split('T')[0] }}</p>
          </v-col>
          <v-divider></v-divider>
          <v-col cols="12">
            <h5 style="word-wrap: break-word;">{{ review.review }}</h5>
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
          <button class="hasDeleteMark" @click="deleteUserReview(review.id, +$route.params.id)" :class="{'mobileMark': display === 'xs'}" v-if="review.users.id === user.id">
                X
          </button>
        </v-row>
        <v-col class="mt-2" cols="12">
          <v-pagination :total-visible="5" v-model="page" :length="totalReviewsPages" @update:modelValue="this.getReviewItemsByPage({ productId: +$route.params.id, page, sortType })"></v-pagination>
        </v-col>
      </v-col>
      <v-col v-else cols="12" class="d-flex flex-column justify-center align-center">
        <img src="https://cdn-icons-png.flaticon.com/512/6134/6134116.png" width="150" height="150" alt="NotFoundPicture"/>
        <p class="mt-4 text-h4">No review...</p>
      </v-col>
    </v-row>
    <div class="cart" :data-totalitems="productCart.length">
      <button @click="toggleIsCartModal(true)" class="cart-button"><img width="25" src="../assets/shopping-cart.svg" alt="cart"/></button>
    </div>
    <auth-modal />
    <register-modal />
    <order-cart-modal :display="display" />
    <review-modal />
  </v-container>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import OrderCartModal from "../components/UI/OrderCartModal.vue";
import RegisterModal from "../components/UI/RegisterModal.vue";
import AuthModal from "../components/UI/AuthModal.vue";
import ReviewModal from "../components/UI/ReviewModal.vue";

export default {
  name: "ItemView.vue",
  data: () => ({
    sortType: '',
    page: 1,
    sortOptions: [
      { text: 'From latest to earliest', value: { timestamp: 'desc' }, disabled: false },
      { text: 'From earliest to latest', value: { timestamp: 'asc' }, disabled: false },
      { text: 'From high rated to low rated', value: { rating: 'desc' }, disabled: false },
      { text: 'From low rated to high rated', value: { rating: 'asc' }, disabled: false }
    ],
  }),
  components: {ReviewModal, OrderCartModal, RegisterModal, AuthModal},
  mounted() {
    this.getProduct(+this.$route.params.id);
    this.getReviews(+this.$route.params.id);
  },
  methods: {
    selectSortType() {
      this.page = 1;
      this.getReviewsItemsBySortType({ productId: +this.$route.params.id, sortType: this.sortType })
    },
    async deleteUserReview(reviewId, productId) {
      await this.deleteReview(reviewId)
      await this.getReviews(productId)
      this.page = 1;
    },
    ...mapActions(['getProduct', 'getReviews', 'getReviewItemsByPage', 'addReview', 'getReviewsItemsBySortType', 'deleteReview']),
    ...mapMutations(['toggleIsCartModal', 'addProduct', 'toggleIsReview']),
  },
  computed: {
    ...mapGetters(['product', 'productCart', 'reviews', 'totalReviewsPages', 'user'])
  },
  props: {
    display: String,
  }
}
</script>

<style scoped>

.product-container {
  height: 88vh
}

.product-image {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 90%;
}

.product-name {
  text-align: center;
  font-size: 36px;
}

.product-price {
  font-size: 28px;
}

.product-description-header {
  text-align: center;
  font-size: 32px;
}

.product-description-text {
  font-size: 20px;
  text-align: justify;
}

.review-article {
  font-size: 32px;
  margin-bottom: 10px;
}

.review {
  width: 65vh;
  margin-bottom: 10px;
}

.hasDeleteMark {
  font-size:12px;
  font-weight:600;
  position: relative;
  left: 98%;
  bottom: 90%;
  background: #92B4EC;
  line-height:24px;
  padding:0 5px;
  height:24px;
  min-width:24px;
  color: white;
  text-align:center;
  border-radius:24px;
  transition: background-color 0.5s ease;
}

.hasDeleteMark:hover {
  background: black;
  color: white;
}

.hasDeleteMark.mobileMark {
  font-size:12px;
  font-weight:600;
  position: relative;
  left: 96%;
  bottom: 90%;
  background: #92B4EC;
  line-height:24px;
  padding:0 5px;
  height:24px;
  min-width:24px;
  color: white;
  text-align:center;
  border-radius:24px;
}

.phone-review {
  width: 45vh;
  margin-bottom: 10px;
}

.sort-field {
  width: 30vh
}

.cart {
  position: fixed;
  top: 100px;
  right: 20px;
  z-index: 1;
}
.cart::after {
  content: attr(data-totalitems);
  font-size:12px;
  font-weight:600;
  position:absolute;
  top:-12px;
  right:-12px;
  background: #92B4EC;
  line-height:24px;
  padding:0 5px;
  height:24px;
  min-width:24px;
  color:white;
  text-align:center;
  border-radius:24px;
}
.cart-button {
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}
.cart-button:hover {
  border: 1px solid #92B4EC;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
}
</style>