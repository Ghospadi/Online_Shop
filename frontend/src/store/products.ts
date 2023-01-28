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

interface Products {
    currentPage: number,
    result: Product[],
    totalResults: number,
    totalPages: number,
}

interface SortProductsPayload {
    page: number;
    orderBy: { price: any };
    where?: { name?: { contains: string }, category_id?: number }
}

interface GetProductsByPagePayload {
    page: number;
    orderBy?: { price?: string, rating?: string };
    where?: { name?: { contains: string }, category_id?: number}
}

interface GetProductsByNameAndCategoryAndFilterTypePayload {
    page: number;
    orderBy?: { price?: string, rating?: string };
    where: { name?: { contains: string }, category_id?: number}
}

interface getProductsByCategoryPayload {
    page: number;
    orderBy?: { price?: string, rating?: string };
    where?: { name?: { contains: string }, category_id?: number}
}

export const useProducts = {
    state: {
        products: [] as Product[],
        totalProducts: 0 as number,
        totalPages: 0 as number,
        currentPage: 1 as number,
        selectedCategoryId: 0 as number,
        priceSortType: null,
        searchQuery: '',
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
            state.totalPages = response.totalPages;
            state.totalProducts = response.totalResults;
            state.products = [...state.products, ...response.result];
        },
        GET_PRODUCTS_BY_CATEGORY(state: any, response: Products) {
            state.currentPage = response.currentPage;
            state.totalProducts = response.totalResults;
            state.totalPages = response.totalPages;
            state.products = [...response.result];
        },
        SEARCH_PRODUCTS(state: any, response: Products) {
            state.currentPage = response.currentPage;
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
        setSearchQuery(state: any, query: string) {
            state.searchQuery = query;
        },
        clearSearchQuery(state: any) {
            state.searchQuery = '';
        }
    },
    getters: {
        products: (state: any) => state.products,
        selectedCategoryId: (state: any) => state.selectedCategoryId,
        currentPage: (state: any) => state.currentPage,
        totalPages: (state: any) => state.totalPages,
        priceSortType: (state: any) => state.priceSortType,
        searchQuery: (state: any) => state.searchQuery,
    },
    actions: {
        async getProducts(context?: { commit: Commit}, page = 1) {
            try {
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, { orderBy: { rating: 'desc' },page });
                context?.commit("GET_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getSortedProducts(context?: { commit: Commit}, { price, categoryId, query }) {
            let payload: SortProductsPayload = { page: 1, orderBy: { price } }
            if(categoryId) {
                if(query) {
                    payload.where = { name: { contains: query }, category_id: categoryId }
                } else {
                    payload.where = { category_id: categoryId }
                }
            }
            if(query && !categoryId) {
                payload.where = { name: { contains: query } }
            }
            try {
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, payload);
                context?.commit("GET_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getProductsByPage(context?: { commit: Commit}, { query = '', categoryId = 0, price, page = 1 }) {
            let payload: GetProductsByPagePayload = { page };
            if (categoryId !== 0) {
                payload = { ...payload, where: { category_id: categoryId } };
            }
            if (query) {
                payload = { ...payload, where: { ...payload.where, name: { contains: query } } };
            }
            if (price) {
                payload = { ...payload, orderBy: { price } };
            } else {
                payload = { ...payload, orderBy: { rating: 'desc' } };
            }
            try {
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, payload);
                context?.commit("GET_PRODUCTS_BY_PAGE_AND_CATEGORY_AND_QUERY_AND_SORTED_TYPE", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getProductsByNameAndCategoryAndFilterType(context = { commit }, { query = '', categoryId = 0, price, page = 1 } = {}) {
            try {
                let params: GetProductsByNameAndCategoryAndFilterTypePayload = {
                    where: { name: { contains: query }},
                    page
                };
                if(categoryId !== 0) {
                    params.where.category_id = categoryId;
                }
                if(price) {
                    params.orderBy = { price };
                }
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, params);
                context.commit("SEARCH_PRODUCTS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getProductsByCategory(context?: { commit: Commit}, { categoryId, price, page = 1 }) {
            try {
                let queryParams: getProductsByCategoryPayload = { page };

                if (categoryId === 0 && !price) {
                    // do nothing
                } else if (categoryId === 0 && price) {
                    queryParams = { ...queryParams, orderBy: { price } };
                } else if (!price) {
                    queryParams = { ...queryParams, where: { category_id: categoryId } };
                } else {
                    queryParams = { ...queryParams, where: { category_id: categoryId }, orderBy: { price } };
                }
                const { data } = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/products/all`, queryParams);
                context?.commit("GET_PRODUCTS_BY_CATEGORY", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
    }
};