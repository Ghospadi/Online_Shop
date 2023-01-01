import axios from "axios";

export const useProducts = {
    state: {
        products: [],
        totalProducts: 0
    },
    mutations: {
        GET_PRODUCTS(state, response) {
            state.totalProducts = response.totalResults;
            state.products = [...state.products, ...response.result];
        }
    },
    getters: {
        products: (state) => state.products
    },
    actions: {
        async getProductsByPage(context, page = 1) {
            try {
                const { data } = await axios.post("http://localhost:8080/api/products/all", { page });
                context.commit("GET_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        }
    }
};