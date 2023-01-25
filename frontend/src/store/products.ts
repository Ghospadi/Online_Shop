import axios from "axios";
import {Commit} from "vuex";

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
        totalPages: 0 as number,
        currentPage: 1 as number,
        selectedCategoryId: 0 as number,
        priceSortType: 'asc'
    },
    mutations: {
        GET_PRODUCTS(state: any, response: Products) {
            state.currentPage = response.currentPage;
            state.totalProducts = response.totalResults;
            state.totalPages = response.totalPages;
            state.products = [...response.result];
        },
        GET_PRODUCTS_BY_PAGE_AND_CATEGORY_AND_QUERY_AND_SORTED_TYPE(state: any, response: Products) {
            state.currentPage = response.currentPage;
            state.totalProducts = response.totalResults;
            state.products = [...state.products, ...response.result];
        },
        GET_PRODUCTS_BY_CATEGORY(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.totalPages = response.totalPages;
            state.products = [...response.result];
        },
        SEARCH_PRODUCTS(state: any, response: Products) {
            state.totalProducts = response.totalResults;
            state.totalPages = response.totalPages;
            state.products = [...response.result];
        },
        clearProducts(state:any) {
            state.products = []
        },
        setCategoryId(state:any, id: number) {
            state.selectedCategoryId = id;
        },
        setPage(state: any, page: number) {
            state.currentPage = page;
        },
        addPage(state: any, page: number) {
            state.currentPage += page;
        },
        setPriceSortType(state: any, type: string) {
            state.priceSortType = type;
        },
    },
    getters: {
        products: (state: any) => state.products,
        selectedCategoryId: (state: any) => state.selectedCategoryId,
        currentPage: (state: any) => state.currentPage,
        totalPages: (state: any) => state.totalPages,
        priceSortType: (state: any) => state.priceSortType,
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
        // @ts-ignore
        async getSortedProducts(context?: { commit: Commit}, { price = 'asc', categoryId }) {
            try {
                if(categoryId) {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, {  where: { category_id: categoryId }, page: 1, orderBy: { price } });
                    context?.commit("GET_PRODUCTS", data);
                    return;
                }
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { page: 1, orderBy: { price } });
                context?.commit("GET_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        },
        // @ts-ignore
        async getProductsByPage(context?: { commit: Commit}, { query = '', categoryId = 0, price = 'asc' , page = 1 }) {
            try {
                if(categoryId === 0 && query === '') {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { orderBy: { price }, page });
                    context?.commit("GET_PRODUCTS_BY_PAGE_AND_CATEGORY_AND_QUERY_AND_SORTED_TYPE", data);
                    return;
                }
                if(query === '') {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { category_id: categoryId }, orderBy: { price }, page });
                    context?.commit("GET_PRODUCTS_BY_PAGE_AND_CATEGORY_AND_QUERY_AND_SORTED_TYPE", data);
                    return;
                }
                if(categoryId === 0) {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { name: { contains: query }}, orderBy: { price }, page });
                    context?.commit("GET_PRODUCTS_BY_PAGE_AND_CATEGORY_AND_QUERY_AND_SORTED_TYPE", data);
                    return;
                } else {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { name: { contains: query }, orderBy: { price }, category_id: categoryId}, page });
                    context?.commit("GET_PRODUCTS_BY_PAGE_AND_CATEGORY_AND_QUERY_AND_SORTED_TYPE", data);
                    return;
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        },
        // @ts-ignore
        async getProductsByNameAndCategoryAndFilterType(context?: { commit: Commit}, { query = '', categoryId = 0, price = 'asc', page = 1 }) {
            try {
                if(categoryId === 0) {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { name: { contains: query }}, orderBy: { price }, page });
                    context?.commit("SEARCH_PRODUCTS", data);
                } else {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { name: { contains: query }, category_id: categoryId}, orderBy: {price}, page });
                    context?.commit("SEARCH_PRODUCTS", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e);
                }
            }
        },
        // @ts-ignore
        async getProductsByCategory(context?: { commit: Commit}, { categoryId, price = 'asc', page = 1 }) {
            console.log(price);
            try {
                if(categoryId === 0) {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { page, orderBy: { price } });
                    context?.commit("GET_PRODUCTS_BY_CATEGORY", data);
                } else {
                    const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { where: { category_id: categoryId }, orderBy: { price }, page });
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