<template>
  <div class="v-container h-100 w-100 mt-16 d-flex flex-row" :class="{ 'h-screen': products.length === 0, 'h-100': products.length !== 0 }">
    <div v-show="display !== 'xs'" class="border-e w-25">
      <div class="d-flex flex-column pa-1 text-no-wrap justify-start">
        <button class="btn text-decoration-none pt-2 pb-2" @click.prevent="selectedCategory(category.id, category.name, priceSortType)" v-for="(category, index) in categories" :key="category.id">
          <v-icon
              start
              :icon="getIcon(icons, index)"
          ></v-icon>
          {{ category.name }}
        </button>
      </div>
    </div>
    <div class="v-container--fluid w-100 d-flex flex-column" :class="screenClassObject">
      <div class="cart" :data-totalitems="productCart.length">
        <button @click="toggleIsCartModal(true)" class="cart-button"><img width="25" src="src/assets/shopping-cart.svg"/></button>
      </div>
      <h2 class="title" ref="title">{{ mainTitle === 'All' ? 'All products' : mainTitle }}</h2>
      <div v-if="products.length === 0" class="d-flex justify-center align-center flex-column h-100 w-100">
        <img src="https://cdn-icons-png.flaticon.com/512/6134/6134116.png" width="150" height="150" alt="NotFoundPicture"/>
        <p class="mt-4">No products found with this name or category...</p>
      </div>
      <div class="d-flex flex-column" :class="display === 'xs' ? (products.length < 2 ? 'h-screen' : null) : null">
        <products-list :display="display" :products="products" v-show="products.length !== 0"/>
        <v-divider class="mt-2 mb-2"></v-divider>
        <button v-if="totalPages !== currentPage && totalPages !== 0" @click="additionalItemsHandler()" class="moreButton text-h3"> <v-icon>mdi-all-inclusive</v-icon> More items...</button>
      </div>
      <auth-modal />
      <register-modal />
      <order-cart-modal :display="display" />
    </div>
  </div>
</template>

<script>
import {mapActions, mapGetters, mapMutations, mapState} from "vuex";
import ProductsList from "../components/Lists/ProductsList.vue";
import AuthModal from "../components/UI/AuthModal.vue";
import RegisterModal from "../components/UI/RegisterModal.vue";
import OrderCartModal from '../components/UI/OrderCartModal.vue'

export default {
  name: "HomeView",
  data: () => ({
    icons: [
        'all-inclusive',
        'monitor',
        'laptop',
        'cellphone',
        'washing-machine',
        'hammer-wrench',
        'sofa',
        'pipe-leak',
        'tshirt-crew',
        'pinwheel',
        'paw',
        'paperclip',
        'controller'
    ],
  }),
  components: {OrderCartModal, RegisterModal, AuthModal, ProductsList},
  created() {
    if(this.categories.length === 0) {
      this.getProducts();
      this.getCategories();
    }
  },
  mounted() {
    this.setToken();
  },
  methods: {
    getIcon(icons, index) {
      return `mdi-${this.icons[index]}`
    },
    selectedCategory(categoryId, categoryName, price) {
      if(categoryId === this.selectedCategoryId) return;
      this.setCategoryId(categoryId);
      this.setPage(1);
      this.getProductsByCategory({ categoryId, price, page: 1 });
      this.changeTitle(categoryName);
    },
    additionalItemsHandler() {
      if( this.currentPage === this.totalPages ) {
        return
      }
      this.addPage(1);
      this.getProductsByPage({ query: this.query, categoryId: this.selectedCategoryId, page: this.currentPage, price: this.priceSortType })
    },
    ...mapActions(['getProducts', 'getCategories', 'userLogin', 'getProductsByCategory', 'getProductsByPage']),
    ...mapMutations(['setAuthModal', 'setToken', 'clearProducts', 'changeTitle', 'setCategoryId', 'toggleIsCartModal', 'setPage', 'addPage'])
  },
  computed: {
    ...mapGetters(['products', 'categories', 'isAuthModal', 'mainTitle', 'selectedCategoryId', 'productCart', 'user', 'currentPage', 'totalPages', 'priceSortType']),
    screenClassObject() {
      return {
        'justify-center align-center ml-2': this.display === 'xs',
        'justify-start align-center ml-2': this.display !== 'xs',
      }
    },
  },
  props: {
    display: String,
    query: {
      type: String,
      default: '',
    }
  }
}
</script>

<style scoped>
.moreButton:hover {
  color: #92B4EC;
}

.btn {
  width: 75vh;
  text-align: left;
  color: black;
  cursor: pointer;
}

.btn:hover {
  color: #92B4EC;
}

.title {
  color: black;
}

.h-screen {
  height: 85.5vh !important;
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