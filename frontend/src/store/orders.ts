import {Product} from "./products";
import Cookies from "js-cookie";
import Notiflix from "notiflix";
import {Commit} from "vuex";
import axios from "axios";

interface ProductCart {
    product: Product,
    quantity: number,
}

export const useOrders = {
    state: {
        productCart: [] as ProductCart[],
        isCartModal: false as boolean,
    },
    mutations: {
        getProductCart(state: any) {
            const data = Cookies.get(`ProductCard`);
            let parsedData = [];
            if (typeof data === "string") {
                parsedData = JSON.parse(data);
            }
            state.productCart = parsedData;
        },
        addProduct(state: any, product: { id: number, name: string, price: number, image: string }) {
            let contains = false;
            for(let i = 0; i < state.productCart.length; i++) {
                if (state.productCart[i].product.name === product.name) {
                    contains = true;
                }
            }
            if(!contains) {
                state.productCart.push({ product, quantity: 1 })
                Cookies.set(`ProductCard`, JSON.stringify(state.productCart), { expires: 1 });
                Notiflix.Notify.success('You successfully add new item');
            } else {
                Notiflix.Notify.failure(`" ${product.name} " - You already add this item`)
            }
        },
        removeProduct(state: any, CartItemIndexId: number) {
            const filtered = state.productCart.filter((el: ProductCart, index: number) => index !== CartItemIndexId)
            Cookies.set(`ProductCard`, JSON.stringify(filtered), { expires: 1 });
            state.productCart = filtered;
            Notiflix.Notify.success('You remove item');
        },
        toggleIsCartModal(state: any, flag: boolean) {
            state.isCartModal = flag;
        },
        clearBucket(state: any) {
            state.productCart = [];
            Cookies.set(`ProductCard`, '', { expires: 1 });
        }
    },
    getters: {
        productCart: (state: any) => state.productCart,
        isCartModal: (state: any) => state.isCartModal,
    },
    actions: {
        async makeOrder(context?: { commit: Commit, state: any }, { userId, products, order }) {
            const token = Cookies.get('jwtToken')
            console.log(token)
            try {
                await axios.post(`${ import.meta.env.VITE_MYIP }:8080/api/orders/create`, { total: order.total, order_date: order.date, user_id: userId }, { headers: { "Authorization" : `bearer ${token}` }});
                context?.commit('clearBucket')
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e.message);
                }
            }
        },
    }
}