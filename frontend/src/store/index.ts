import { createStore } from 'vuex'
import {useCategories} from "./categories.js";
import {useProducts} from "./products";

export default createStore({
  modules: {
    useProducts,
    useCategories,
  }
})
