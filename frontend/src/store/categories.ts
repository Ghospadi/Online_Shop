import axios from "axios";
import {Commit} from "vuex";
import {reactive} from "vue";

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
            response.unshift({ id: 0, name: 'All', description: 'Основные характеристики, стоимость и возможности' })
            state.categories = response;
        }
    },
    getters: {
        categories: (state: any) => {
            return state.categories
        }
    },
    actions: {
        async getCategories(context?: { commit: Commit}) {
            try {
                const { data } = await axios.get(`${ import.meta.env.VITE_MYIP }:8080/api/categories/all`);
                context?.commit("GET_CATEGORIES", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        }
    }
};