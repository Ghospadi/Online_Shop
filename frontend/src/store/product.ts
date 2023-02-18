import axios from "axios";
import {Commit} from "vuex";
import Notiflix from "notiflix";

export interface Product {
    name: string,
    description: string,
    price: number,
    image: string,
    stock: number,
    category_id: number
}

export const useProduct = {
    state: {
        product: {} as Product,
    },
    mutations: {
        GET_PRODUCT(state: any, data: Product) {
            state.product = data;
        }
    },
    getters: {
        product: (state: any) => state.product
    },
    actions: {
        async getProduct(context?: { commit: Commit }, id: number) {
            try {
                const {data} = await axios.get(`${import.meta.env.VITE_MYIP}:8080/api/products/${+id}`);
                context?.commit("GET_PRODUCT", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        async checkProduct(context?: { commit: Commit }, id: number) {
            try {
                await axios.get(`${import.meta.env.VITE_MYIP}:8080/api/products/${+id}`);
                return true;
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        }
    }
};