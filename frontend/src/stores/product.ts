import {defineStore} from "pinia";
import {ref} from "vue";

interface Products {

}

export const useProducts = defineStore('products', () => {
    const products = ref({})
    const page = ref(1)

    return { products, page }
})