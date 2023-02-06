import {createRouter, createWebHistory, RouterOptions} from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ProfileView from '../views/ProfileView.vue'
import ItemView from '../views/ItemView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    props: true
  },
  {
    path: '/profile',
    name: 'profile',
    component: ProfileView,
    props: true
  },
  {
   path: '/item/:id',
   name: 'ItemView',
   component: ItemView,
   props: true
  }
]

export default createRouter({
  history: createWebHistory(),
  // @ts-ignore
  routes
})
