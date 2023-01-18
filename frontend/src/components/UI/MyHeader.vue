<template>

    <v-app-bar
        :color="'#92B4EC'"
        prominent
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" v-show="display === 'xs'" class="text-white"></v-app-bar-nav-icon>

      <div :class="{ 'nav__routeAndroid': display === 'xs', 'nav__route': display !== 'xs' }"  v-for="route in routes" :key="route.path">
        <router-link class="route__text" :to="route.path" @click="homeRedirect()">{{ route.name }}</router-link>
      </div>

      <v-spacer></v-spacer>

      <div v-show="$route.path === '/'" :class="inputLengthCount()" class="wrap">
        <input type="text" class="input" v-model="searchQuery" @keyup.enter="getProductsByNameAndCategory({ query: searchQuery, id: selectedCategoryId })" :class="inputLengthCount()" placeholder="Поиск...  ">
        <button class="fa" @click="toggleClass"><v-icon icon="mdi-magnify"></v-icon></button>
      </div>

      <div v-show="$route.path === '/'">
        <v-btn variant="text" class="text-white" icon="mdi-filter"></v-btn>
      </div>

      <v-btn v-show="!authToken" variant="text" @click.stop="setAuthModal(true)" class="text-white" icon="mdi-account"></v-btn>
      <v-btn v-show="authToken" variant="text" @click.stop="navigateTo('profile')" class="text-white" icon="mdi-account"></v-btn>
    </v-app-bar>
  <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
      v-if="this.display === 'xs'"
  >
    <div class="d-flex flex-column pa-1 text-no-wrap justify-start">
      <button class="btn collaps text-decoration-none pt-2 pb-2" @click.prevent="selectCategory(category.id, category.name)" v-for="(category, index) in categories" :key="category.id">
        <v-icon
            start
            :icon="getIcon(icons, index)"
        ></v-icon>
        {{ category.name }}
      </button>
    </div>
  </v-navigation-drawer>
</template>

<script>

import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
  name: "MyHeader",
  data: () => ({
    drawer: false,
    isActive: false,
    searchQuery: '',
    routes: [
      { path: '/', name: 'Home' },
    ],
    icons: [
      'monitor',
      'laptop',
      'cellphone',
      'washing-machine',
      'hammer-wrench',
      'sofa',
      'pipe-leak',
      'tshirt-crew',
      'pinwheel',
      'paw',
      'paperclip',
      'controller'
    ],
  }),
  methods: {
    toggleClass() {
      this.toggleSearchActive(!this.isSearchActive);
    },
    navigateTo(route) {
        this.$router.push({ name: route }).catch((error) => console.log(error));
        this.searchQuery = '';
        this.setCategoryId(0);
    },
    homeRedirect() {
      this.searchQuery = '';
      if(this.$route.path === '/profile') {
        this.changeTitle('Products')
        this.getProducts(1);
        this.setCategoryId(0)
      }
      if(this.$route.path === '/') {
        this.changeTitle('Products')
        this.getProducts(1);
        this.toggleSearchActive(false)
        this.setCategoryId(0)
        return;
      }
    },
    inputLengthCount() {
      if(this.display === 'xs') return { activeAndroid: this.isSearchActive }
      return { active: this.isSearchActive }
    },
    getIcon(icons, index) {
      return `mdi-${this.icons[index]}`
    },
    selectCategory(categoryId, categoryName) {
      this.searchQuery = '';
      this.setCategoryId(categoryId);
      this.getProductsByCategory(categoryId, 1);
      this.$router.push('/')
      this.changeTitle(categoryName);
      this.drawer = false;
    },
    ...mapActions(['getProductsByNameAndCategory', 'getProducts', 'getProductsByCategory']),
    ...mapMutations(['setAuthModal', 'clearProducts', 'toggleSearchActive', 'changeTitle', 'setCategoryId']),
  },
  computed: {
    ...mapGetters(['isAuthModal', 'authToken', 'products', 'isSearchActive', 'categories', 'selectedCategoryId']),
  },
  props: {
    display: {
      type: String,
      required: true,
    }
  },
}
</script>

<style scoped>
.nav__route {
  padding-left: 20px;
}

.btn {
  width: 75vh;
  text-align: left;
  color: #FFD24C;
  cursor: pointer;
}

.nav__routeAndroid {
  padding-left: 5px;
}

.route__text {
  color: white;
  font-size: 24px;
  text-decoration: none;
}

.route__text:hover {
  color: #134982;
}

.wrap{
  position: absolute;
  top: 0.25em;
  right: 6.75em;
  width: 0px;
  height: 55px;
  line-height: 55px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0,0,0,0.5);
  transition: all 0.5s ease;
}

.input{
  border: 0;
  background: transparent;
  width: 0%;
  outline: none;
  font-family: sans-serif;
  font-size: 18px;
  color: #fff;
  font-style: italic;
  transition: all 0.3s ease;
  position: relative;
}

.wrap .fa{
  color: #fff;
  position: absolute;
  right: 10px;
  font-size: 22px;
  cursor: pointer;
}

.wrap.active{
  width: 250px;
  padding-left: 25px;
  transition: all 0.5s ease;
}

.wrap.activeAndroid{
  width: 150px;
  padding-left: 25px;
  transition: all 0.5s ease;
}

.input.active{
  width: 98%;
  padding-left: 5px;
  transition: all 0.5s 0.8s ease;
}

.input.activeAndroid{
  width: 98%;
  padding-left: 5px;
  transition: all 0.5s 0.8s ease;
}

.input::placeholder {
  color: #fff;
}
</style>