import { createStore } from 'vuex'
import {useProducts} from "@/store/products";
import {useCategories} from "@/store/categories";

export default createStore({
  modules: {
    useProducts,
    useCategories,
  }
})
