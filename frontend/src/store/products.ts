import axios from "axios";
import {Commit} from "vuex";
import Cookies from "js-cookie";
import {toRaw} from "vue";
import Notiflix from "notiflix";

export interface Product {
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
        selectedCategoryId: 0 as number,
    },
    mutations: {
        GET_PRODUCTS(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.products = [...response.result];
        },
        GET_PRODUCTS_BY_PAGE(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.products = [...state.products, ...response.result];
        },
        GET_PRODUCTS_BY_CATEGORY(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.products = [...response.result];
        },
        SEARCH_PRODUCTS(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.products = [...response.result];
        },
        clearProducts(state:any) {
            state.products = []
        },
        setCategoryId(state:any, id: number) {
            state.selectedCategoryId = id;
        },
    },
    getters: {
        products: (state: any) => state.products,
        selectedCategoryId: (state: any) => state.selectedCategoryId,
    },
    actions: {
        async getProducts(context?: { commit: Commit}, page = 1) {
            try {
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { page });
                context?.commit("GET_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        },
        async getProductsByPage(context?: { commit: Commit}, page = 1) {
            try {
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { page });
                context?.commit("GET_PRODUCTS_BY_PAGE", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        },
        // @ts-ignore
        async getProductsByNameAndCategory(context?: { commit: Commit}, { query = '', categoryId = 0, page = 1 }) {
            try {
                if(categoryId === 0) {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { name: { contains: query }}, page });
                    context?.commit("SEARCH_PRODUCTS", data);
                } else {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { name: { contains: query }, category_id: categoryId}, page });
                    context?.commit("SEARCH_PRODUCTS", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e);
                }
            }
        },
        // @ts-ignore
        async getProductsByCategory(context?: { commit: Commit}, categoryId, page = 1) {
            try {
                if(categoryId === 0) {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { page });
                    context?.commit("GET_PRODUCTS_BY_CATEGORY", data);
                } else {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { category_id: categoryId }, page });
                    context?.commit("GET_PRODUCTS_BY_CATEGORY", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        },
    }
};