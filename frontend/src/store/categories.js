import axios from "axios";
export const useCategories = {
    state: {
        categories: []
    },
    mutations: {
        GET_CATEGORIES(state, response) {
            state.categories = response;
        }
    },
    getters: {
        categories: (state) => state.categories
    },
    actions: {
        async getCategories(context) {
            try {
                const { data } = await axios.get("http://localhost:8080/api/categories/all");
                context.commit("GET_CATEGORIES", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        }
    }
};