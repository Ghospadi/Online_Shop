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
        id: number,
        name: string,
    },
    products: {
        id: number,
        name: string,
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
        review: {} as Review,
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
        },

        GET_REVIEW(state: any, data: Review) {
            state.review = data;
        },
    },
    getters: {
        reviews: (state: any) => state.reviews,
        review: (state: any) => state.review,
        totalReviewsPages: (state: any) => state.totalReviewsPages,
        currentReviewsPage: (state: any) => state.currentPage,
    },
    actions: {
        // @ts-ignore
        async getReviews(context?: { commit: Commit }, productId: number) {
            try {
                const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: productId }, page: 1 });
                context?.commit("GET_REVIEWS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getReviewById(context?: { commit: Commit }, id: number) {
            try {
                const {data} = await axios.get(`${import.meta.env.VITE_MYIP}:8080/api/reviews/${id}`);
                context?.commit("GET_REVIEW", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getReviewItemsByPage(context?: { commit: Commit }, { productId, page, sortType }) {
            try {
                if(sortType) {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: productId }, page, orderBy: { ...sortType } });
                    context?.commit("GET_REVIEWS", data);
                } else {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: productId }, page });
                    context?.commit("GET_REVIEWS", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getReviewsByPageAndUserIdAndSortType(context?: { commit: Commit }, { page, userId, sortType }) {
            try {
                if(sortType) {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { user_id: userId }, page, orderBy: { ...sortType } });
                    context?.commit("GET_REVIEWS", data);
                } else {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { user_id: userId }, orderBy: { timestamp: 'desc' }, page });
                    console.log(data);
                    context?.commit("GET_REVIEWS", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getReviewItemsBySortType(context?: { commit: Commit }, { productId, sortType }) {
            try {
                const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/reviews/all`, { where: { product_id: productId }, page: 1, orderBy: { ...sortType } });
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
        },
        // @ts-ignore
        async editReview(context?: { commit: Commit }, reviewData) {
            const token = Cookies.get('jwtToken')
            try {
                await axios.patch(`${import.meta.env.VITE_MYIP}:8080/api/reviews/${reviewData.id}`, { product_id: reviewData.product_id, user_id: reviewData.user_id, review: reviewData.review, rating: reviewData.rating, timestamp: reviewData.timestamp }, { headers: { "Authorization" : `bearer ${token}` }});
                Notiflix.Notify.success(`You edit review #${reviewData.id}`)
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.response.data.error)
                }
            }
        }
    }
};