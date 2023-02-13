import {Product} from "./products";
import Cookies from "js-cookie";
import Notiflix from "notiflix";
import {Commit} from "vuex";
import axios from "axios";

interface ProductCart {
    product: Product,
    quantity: number,
}

interface OrderItems {
        id: number,
        order_id: number,
        product_id: number,
        quantity: number,
        price: number,
        products: Product,
}

interface Order {
    currentPage: number,
    result: [],
    totalPages: number,
    totalResults: number
}

export const useOrders = {
    state: {
        orders: [] as OrderItems[],
        productCart: [] as ProductCart[],
        isCartModal: false as boolean,
        totalPages: 0 as number,
        currentOrderPage: 1 as number,
    },
    mutations: {
        ADD_ORDERS(state: any, orders: { orderItems: [], order: Order }) {
            state.orders = orders.orderItems;
            state.totalPages = orders.order.totalPages;
        },
        getProductCart(state: any) {
            const data = Cookies.get(`ProductCard`);
            let parsedData = [];
            if (typeof data === "string") {
                data ? parsedData = JSON.parse(data) : parsedData = [];
            }
            state.productCart = parsedData;
        },
        addProduct(state: any, product: { id: number, name: string, price: number, image: string, stock: number }) {
            let contains = false;

            if(product.stock === 0) {
                Notiflix.Notify.failure(`" ${product.name} " - This product out of stock`);
                return;
            }

            for (let i = 0; i < state.productCart.length; i++) {
                if (state.productCart[i].product.id === product.id) {
                    contains = true;
                }
            }
            if (!contains) {
                state.productCart.push({product, quantity: 1})
                Cookies.set(`ProductCard`, JSON.stringify(state.productCart), {expires: 1});
                Notiflix.Notify.success('You successfully add new item');
            } else {
                Notiflix.Notify.failure(`" ${product.name} " - You already add this item`)
            }
        },
        removeProduct(state: any, CartItemIndexId: number) {
            const filtered = state.productCart.filter((el: ProductCart, index: number) => index !== CartItemIndexId)
            Cookies.set(`ProductCard`, JSON.stringify(filtered), {expires: 1});
            state.productCart = filtered;
            Notiflix.Notify.success('You remove item');
        },
        toggleIsCartModal(state: any, flag: boolean) {
            state.isCartModal = flag;
        },
        clearBucket(state: any) {
            state.productCart = [];
            Cookies.set(`ProductCard`, '', {expires: 1});
        },
        clearOrders(state: any) {
            state.orders = [];
        }
    },
    getters: {
        productCart: (state: any) => state.productCart,
        isCartModal: (state: any) => state.isCartModal,
        orderItems: (state: any) => state.orders,
        ordersPages: (state: any) => state.totalPages
    },
    actions: {
        // @ts-ignore
        async makeOrder(context?: { commit: Commit, state: any }, {userId, products, order}: any) {
            const token = Cookies.get('jwtToken')
            try {
                const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/orders/create`, {
                    total: order.total,
                    order_date: order.date,
                    user_id: userId
                }, {headers: {"Authorization": `bearer ${token}`}});
                const array = products.map(((el: any) => ({
                    quantity: el.quantity,
                    price: el.product.price,
                    product_id: el.product.id,
                    order_id: data.id
                })));
                await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/order-items/create`, array, {headers: {"Authorization": `bearer ${token}`}})
                context?.commit('clearBucket')
                context?.commit('toggleIsCartModal', false)
                Notiflix.Notify.success('You create a new order')
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    console.log(e);
                    Notiflix.Notify.failure(e.response.data.error)
                }
            }
        },
        // @ts-ignore
        async getOrderItems(context?: { commit: Commit, state: any }, payload: { userId: number, page: number }) {
            const orderItems: any[] = []
            try {
                const {data} = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/orders/all`, {
                    page: payload.page,
                    where: {user_id: payload.userId}
                });
                for (let i = 0; i < data.result.length; i++) {
                    const result = await axios.post(`${import.meta.env.VITE_MYIP}:8080/api/order-items/all`, {where: {order_id: data.result[i].id}});
                    orderItems.push({result: result.data.result, id: data.result[i].id});
                }
                context?.commit('ADD_ORDERS', {orderItems, order: data});
            } catch (e) {
                if (axios.isAxiosError(e)) {
                    Notiflix.Notify.failure(e.message)
                }
            }
        },
    }
}