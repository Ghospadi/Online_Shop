import { createRouter, createWebHistory, RouteRecordRaw, Router, NavigationGuardNext } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ProfileView from '../views/ProfileView.vue'
import ItemView from '../views/ItemView.vue'
import NotFoundView from '../views/NotFoundView.vue'
import BannedView from '../views/BannedView.vue'
import store from "../store";
import Cookies from "js-cookie";

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        name: 'home',
        component: HomeView,
        props: true,
        meta: { requiresBanCheck: true } // Add meta field to indicate authentication requirement
    },
    {
        path: '/profile',
        name: 'profile',
        component: ProfileView,
        props: true,
        meta: { requiresAuth: true, requiresBanCheck: true } // Add meta field to indicate authentication requirement
    },
    {
        path: '/item/:id',
        name: 'ItemView',
        component: ItemView,
        props: true,
        meta: { requiresBanCheck: true }
    },
    {
        path: '/banned',
        name: 'BannedView',
        component: BannedView,
        props: true,
    },
    {
        path: '/:catchAll(.*)', // Add catch-all route for 404 page
        name: 'not-found',
        component: NotFoundView
    }
]

const router: Router = createRouter({
    history: createWebHistory(),
    routes
})

router.beforeEach(async (to, from, next: NavigationGuardNext) => {
    const token = Cookies.get('jwtToken')
    let bannedType = 0
    if(token) {
        const user = Cookies.get('user')
        const { banned } = JSON.parse(user ? user : "");
        bannedType = banned;
    }
    if (to.meta.requiresAuth && !token) { // Check if authentication is required and user is not logged in
        next('/') // Redirect to login page
        store.commit('setAuthModal', true);
    } else {
        if (to.meta.requiresBanCheck && bannedType) {
            next('/banned'); // Redirect to banned page if user banned
        } else {
            if (to.params.id && !await store.dispatch('checkProduct', to.params.id)) {
                next('/') // Redirect to not-found page if :id parameter is invalid
            } else {
                // Check if requested route exists
                if (routes.some((route: RouteRecordRaw) => route.name === to.name)) {
                    next() // Proceed to requested route
                } else {
                    next({ name: 'not-found' }) // Redirect to 404 page if requested route does not exist
                }
            }
        }
    }
})

export default router