import axios from "axios";
import {Commit} from "vuex";

interface Category {
    id: number,
    name: string,
    description: string,
}

export const useCategories = {
    state: {
        categories: [] as Category[]
    },
    mutations: {
        GET_CATEGORIES(state: any, response: Category[]) {
            state.categories = response;
        }
    },
    getters: {
        categories: (state: any) => state.categories
    },
    actions: {
        async getCategories(context?: { commit: Commit}) {
            try {
                const { data } = await axios.get("http://localhost:8080/api/categories/all");
                context?.commit("GET_CATEGORIES", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        }
    }
};