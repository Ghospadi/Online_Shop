import axios, {AxiosError} from "axios";
import {Commit} from "vuex";
import Notiflix from "notiflix";
import Cookies from "js-cookie";

export interface Review {
    id: number,
    rating: number,
    review: string,
    timestamp: string,
    users: {
        name: string
    }
}

export interface ReviewData {
    currentPage: number,
    result: Review[],
    totalPages: number,
    totalResults: number
}

export const useReviews = {
    state: {
        reviews: [] as Review[],
        currentPage: 1 as number,
        totalReviewsPages: 0 as number,
        totalReviewsResults: 0 as number,
    },
    mutations: {
        GET_REVIEWS(state: any, data: ReviewData) {
            state.reviews = data.result;
            state.currentPage = data.currentPage;
            state.totalReviewsPages = data.totalPages;
            state.totalReviewsResults = data.totalResults;
        }
    },
    getters: {
        reviews: (state: any) => state.reviews,
        totalReviewsPages: (state: any) => state.totalReviewsPages,
    },
    actions: {
        // @ts-ignore
        async getReviews(context?: { commit: Commit }, id: number) {
            try {
                const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: id }, page: 1 });
                context?.commit("GET_REVIEWS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getReviewItemsByPage(context?: { commit: Commit }, { id, page, sortType }) {
            try {
                if(sortType) {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: id }, page, orderBy: { ...sortType } });
                    context?.commit("GET_REVIEWS", data);
                } else {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: id }, page });
                    context?.commit("GET_REVIEWS", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getReviewItemsBySortType(context?: { commit: Commit }, { id, sortType }) {
            try {
                const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: id }, page: 1, orderBy: { ...sortType } });
                context?.commit("GET_REVIEWS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async addReview(context?: { commit: Commit }, reviewData) {
            const token = Cookies.get('jwtToken')
            try {
                await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/create`, reviewData, { headers: { "Authorization" : `bearer ${token}` }});
                Notiflix.Notify.success('You create new review')
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.response.data.error)
                }
            }
        }
    }
};