import { createStore } from 'vuex'
import {useCategories} from "./categories.js";
import {useProducts} from "./products";
import {useAuth} from "./auth";
import {useOrders} from "./orders";
import {useProduct} from "./product";

export default createStore({
  state: {
    mainTitle: 'Popular products',
    isSearchActive: false,
    isFilter: false
  },
  getters: {
    isSearchActive: (state) => state.isSearchActive,
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
  },
  modules: {
    useProduct,
    useProducts,
    useCategories,
    useAuth,
    useOrders,
  }
})
