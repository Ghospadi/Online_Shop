import { createStore } from 'vuex'
import {useCategories} from "./categories.js";
import {useProducts} from "./products";
import {useAuth} from "./auth";
import {useOrders} from "./orders";
import {useProduct} from "./product";
import {useReviews} from "./reviews";
import {useUsers} from "./users";

export default createStore({
  state: {
    mainTitle: 'Popular products',
    isSearchActive: false,
    isFilter: false,
    isReview: false,
  },
  getters: {
    isSearchActive: (state) => state.isSearchActive,
    isReview: (state) => state.isReview,
    isFilter: (state) => state.isFilter,
    mainTitle: (state) => state.mainTitle,
  },
  mutations: {
    toggleSearchActive(state: any, flag: boolean) {
      state.isSearchActive = flag;
    },
    changeTitle(state: any, name: string) {
      state.mainTitle = name;
    },
    toggleIsFilter(state: any, flag: boolean) {
      state.isFilter = flag;
    },
    toggleIsReview(state: any, flag: boolean) {
      state.isReview = flag;
    },
  },
  modules: {
    useProduct,
    useProducts,
    useCategories,
    useAuth,
    useOrders,
    useReviews,
    useUsers,
  }
})
