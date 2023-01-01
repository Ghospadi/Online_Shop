import axios from "axios";
import {Commit} from "vuex";

interface Product {
    name: string,
    description: string,
    price: number,
    image: string,
    stock: number,
    category_id: number
}

interface Products {
    currentPage: number,
    result: Product[],
    totalResults: number,
    totalPages: number,
}

export const useProducts = {
    state: {
        products: [] as Product[],
        totalProducts: 0 as number,
    },
    mutations: {
        GET_PRODUCTS(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.products = [...state.products, ...response.result];
        }
    },
    getters: {
        products: (state: any) => state.products
    },
    actions: {
        async getProductsByPage(context?: { commit: Commit}, page = 1) {
            try {
                const { data } = await axios.post("http://localhost:8080/api/products/all", { page });
                context?.commit("GET_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        }
    }
};