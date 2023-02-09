<template>
  <div class="v-container d-flex flex-column w-100 mt-16">
    <div class="product-container">
      <div class="product-left">
        <img class="product-image" :src="product.image" alt="product image">
      </div>
      <div class="product-right">
        <h1 class="product-name">{{product.name}} </h1>
        <div class="d-flex border w-100 mt-6 rounded-lg pa-4 justify-space-between align-center">
          <h3 class="ml-3 product-price">{{ product.price }} €</h3>
          <v-rating
              readonly
              class="d-flex justify-center align-center"
              empty-icon="mdi-star-outline"
              full-icon="mdi-star"
              half-icon="mdi-star-half-full"
              length="5"
              size="48"
              v-model="product.rating"
          ></v-rating>
          <v-btn @click.prevent.stop="addProduct({ id: product.id, name: product.name, price: product.price, image: product.image })" class="float-right mr-2" :border="false" :elevation="0">
            <v-icon size="large" icon="mdi-cart-variant" />
          </v-btn>
        </div>
        <div class="product-description">
          <h2 class="product-description-header mt-6 mb-2">Description</h2>
          <p class="product-description-text">{{product.description}}</p>
        </div>
      </div>
    </div>
    <div class="d-flex flex-column product-reviews mt-10">
      <div class="d-flex ml-auto mr-auto align-center justify-space-between w-50">
        <h2 class="review-article">Reviews:</h2>
        <v-btn
            color="#92B4EC"
            class="mt-2 mb-2"
            @click="toggleIsReview(true)"
        >
          Add New Review
        </v-btn>
      </div>
      <div v-if="reviews.length !== 0" class="existing-reviews d-flex flex-column align-center justify-center">
        <v-col
            align-self="center"
            cols="3"
            sm="2"
        >
          <v-select
              :items="sortOptions"
              v-model="sortType"
              item-value="value"
              item-title="text"
              item-disabled="disabled"
              label="Order By"
              @update:modelValue="selectSortType()"
          ></v-select>
        </v-col>
        <div v-for="review in reviews" class="review border">
          <div class="d-flex justify-space-between pa-4">
            <h4>{{ review.users.name }}</h4>
            <p>{{ review.timestamp.split('T')[0] }}</p>
          </div>
          <v-divider/>
          <h5 class="text-center mt-6">{{ review.review }}</h5>
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
        </div>
        <div class="mt-2">
          <v-pagination :total-visible="5" v-model="page" :length="totalReviewsPages" @update:modelValue="this.getReviewItemsByPage({ id: +$route.params.id, page, sortType })"></v-pagination>
        </div>
      </div>
      <div class="d-flex flex-column justify-center align-center" v-else>
        <img src="https://cdn-icons-png.flaticon.com/512/6134/6134116.png" width="150" height="150" alt="NotFoundPicture"/>
        <p class="mt-4 text-h4">No review...</p>
      </div>
    </div>
    <div class="cart" :data-totalitems="productCart.length">
      <button @click="toggleIsCartModal(true)" class="cart-button"><img width="25" src="../assets/shopping-cart.svg" alt="cart"/></button>
    </div>
    <auth-modal />
    <register-modal />
    <order-cart-modal :display="display" />
    <review-modal />
  </div>
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
      this.getReviewItemsBySortType({ id: +this.$route.params.id, sortType: this.sortType })
    },
    ...mapActions(['getProduct', 'getReviews', 'getReviewItemsByPage', 'addReview', 'getReviewItemsBySortType']),
    ...mapMutations(['toggleIsCartModal', 'addProduct', 'toggleIsReview']),
  },
  computed: {
    ...mapGetters(['product', 'productCart', 'reviews', 'totalReviewsPages'])
  },
  props: {
    display: String,
  }
}
</script>

<style scoped>
.product-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: black;
  height: 90vh;
}

.product-left {
  display: flex;
  justify-content: center;
  align-items: start;
  width: 50%;
}

.product-right {
  display: flex;
  align-items: center;
  flex-direction: column;
  height: 100%;
  width: 50%;
}

.product-image {
  width: 80%;
}

.product-name {
  text-align: center;
  font-size: 36px;
}

.product-price {
  font-size: 28px;
}

.product-description {
  display: flex;
  flex-direction: column;
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