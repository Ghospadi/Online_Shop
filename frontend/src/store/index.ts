import { createStore } from 'vuex'
import {useCategories} from "./categories.js";
import {useProducts} from "./products";
import {useAuth} from "./auth";
import {useOrders} from "./orders";

export default createStore({
  state: {
    mainTitle: 'Popular products',
    isSearchActive: false,
  },
  getters: {
    isSearchActive: (state) => state.isSearchActive,
    mainTitle: (state) => state.mainTitle,
  },
  mutations: {
    toggleSearchActive(state: any, flag: boolean) {
      state.isSearchActive = flag;
    },
    changeTitle(state: any, name: string) {
      state.mainTitle = name;
    }
  },
  modules: {
    useProducts,
    useCategories,
    useAuth,
    useOrders,
  }
})
