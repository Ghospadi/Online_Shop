import axios, {AxiosError} from "axios";
import {Commit} from "vuex";
import Cookies from 'js-cookie';
import Notiflix from 'notiflix';

interface UserLoginInterface {
    email: string,
    password: string
}

interface UserRegisterInterface {
    name: string,
    email: string,
    password: string,
    address: string,
    age: string,
    city: string,
    country: string
}

interface User {
    id: number,
    name: string,
    age: number,
    email: string,
    password: string,
    country: string,
    city: string,
    address: string,
    role_id: number
}

export const useAuth = {
    state: {
        user: {} as object,
        authToken: '' as string,
        isAuthModal: false as boolean,
        isRegisterModal: false as boolean,
    },
    mutations: {
        SET_AUTH_DATA(state: any, token: string) {
            state.authToken = token;
        },
        SET_USER_DATA(state: any, user: User) {
            state.user = user;
        },
        setAuthModal(state: any, flag: boolean) {
            state.isAuthModal = flag;
        },
        setRegisterModal(state: any, flag: boolean) {
            state.isRegisterModal = flag;
        },
        setToken(state: any) {
            state.authToken = Cookies.get('jwtToken');
        },
        clearUserData(state: any) {
            state.user = {};
        }
    },
    getters: {
        isAuthModal: (state: any) => state.isAuthModal,
        authToken: (state: any) => state.authToken,
        isRegisterModal: (state: any) => state.isRegisterModal,
        user: (state: any) => state.user,
        fullName: (state: any) => state.user.name ? state.user.name.split(' ') : []
    },
    actions: {
        // @ts-ignore
        async userLogin (context?: { commit: Commit}, { email, password }: UserLoginInterface) {
            let finish = false
            try {
                finish = false;
                const token = await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/auth/login`, { email, password });
                Cookies.set('jwtToken', token.data.access_token, { expires: 7 })
                context?.commit('SET_AUTH_DATA', token.data.access_token);
                Notiflix.Notify.success('You successfully logged in')
                finish = true
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
            return finish;
        },
        // @ts-ignore
        async userRegister (context?: { commit: Commit }, { name, email, password, address, age, city, country }: UserRegisterInterface) {
            let finish = false
            try {
                finish = false;
                await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/auth/register`, { name, email, password, address, age, city, country })
                Notiflix.Notify.success('You successfully registered');
                finish = true
            } catch (error) {
                const e = error as AxiosError;
                Notiflix.Notify.failure(`${e.response?.data?.message}`);
            }
            return finish;
        },

        async me (context?: { commit: Commit, state: any }) {
            try {
                const user = await axios.get(`${ import.meta.env.VITE_MYIP }:8080/api/auth/me`, { headers: { "Authorization" : `bearer ${context?.state.authToken}` }})
                const { data } = await axios.get(`${ import.meta.env.VITE_MYIP }:8080/api/users/${user.data.id}`, { headers: { "Authorization" : `bearer ${context?.state.authToken}` }})
                Cookies.set('user', JSON.stringify(data));
                context?.commit('SET_USER_DATA', data)
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },

        // @ts-ignore
        async updateProfile(context?: { state: any }, body: User) {
            try {
                await axios.patch(`${ import.meta.env.VITE_MYIP }:8080/api/users/${body.id}`, body, { headers: { "Authorization" : `bearer ${context?.state.authToken}` }})
                Notiflix.Notify.success(`Profile successfully changed`);
            }catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        }
    }
};