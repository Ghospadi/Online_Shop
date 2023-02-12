import axios from "axios";
import {Commit} from "vuex";
import Notiflix from "notiflix";
import Cookies from "js-cookie";

export interface User {
    id: number,
    name: string,
    email: string,
    country: string,
    city: string,
    address: string,
    banned: number
}

interface Users {
    currentPage: number,
    result: User[],
    totalPages: number,
    totalResults: number
}

export const useUsers = {
    state: {
        users: [] as User[],
        currentPage: 1 as number,
        totalUsersPages: 0 as number,
        totalUsersResults: 0 as number,
    },
    mutations: {
        GET_USERS(state: any, data: Users) {
            state.users = data.result;
            state.currentPage = data.currentPage;
            state.totalUsersPages = data.totalPages;
            state.totalUsersResults = data.totalResults;
        }
    },
    getters: {
        users: (state: any) => state.users,
        totalUsersPages: (state: any) => state.totalUsersPages,
    },
    actions: {
        // @ts-ignore
        async getUsers(context?: { commit: Commit }, { orderBy = undefined, page = 1 }): Users {
            const token = Cookies.get('jwtToken')
            try {
                const { data } = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/users/all`, { orderBy, page }, { headers: {'Authorization': `Bearer ${token}`}});
                context?.commit("GET_USERS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async searchUsers(context?: { commit: Commit }, where) {
            const token = Cookies.get('jwtToken')
            try {
                const { data } = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/users/all`, { where }, { headers: {'Authorization': `Bearer ${token}`}});
                context?.commit("GET_USERS", data);
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
        // @ts-ignore
        async getUsersByPageAndSortType(context?: { commit: Commit }, { page, where, sortType }) {
            const token = Cookies.get('jwtToken')
            try {
                if(sortType && where.email.contains) {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/users/all`, { page, orderBy: { ...sortType }, where }, { headers: {'Authorization': `Bearer ${token}`}});
                    context?.commit("GET_USERS", data);
                } else if(sortType) {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/users/all`, { page, orderBy: { ...sortType } }, { headers: {'Authorization': `Bearer ${token}`}});
                    context?.commit("GET_USERS", data);
                } else if (where.email.contains) {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/users/all`, { page, where }, { headers: {'Authorization': `Bearer ${token}`}});
                    context?.commit("GET_USERS", data);
                } else {
                    const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/users/all`, { orderBy: { id: 'asc' }, page }, { headers: {'Authorization': `Bearer ${token}`}});
                    console.log(data);
                    context?.commit("GET_USERS", data);
                }
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
    }
};