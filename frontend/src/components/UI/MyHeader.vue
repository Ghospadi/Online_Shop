<template>
  <v-app-bar
      :color="'#92B4EC'"
      prominent
  >
    <v-app-bar-nav-icon @click.stop="this.drawer = !this.drawer" v-show="display === 'xs'"></v-app-bar-nav-icon>

    <div :class="{ 'nav__routeAndroid': display === 'xs', 'nav__route': display !== 'xs' }" v-for="route in routes" :key="route.path">
      <router-link class="route__text" :to="route.path" @click="homeRedirect()">{{ route.name }}</router-link>
    </div>

    <v-spacer></v-spacer>

    <div v-show="$route.path === '/'" :class="inputLengthCount()" class="wrap">
      <input type="text" class="input" v-model.trim="query" @keyup.enter="searchItems(this.query, this.selectedCategoryId, this.sortType)" :class="inputLengthCount()" placeholder="Поиск...  ">
      <button class="fa text-black" @click="toggleClass"><v-icon icon="mdi-magnify"></v-icon></button>
    </div>

    <div v-show="$route.path === '/'">
      <v-btn  @click.stop="toggleIsFilter(!this.isFilter)" variant="text" icon="mdi-filter"></v-btn>
    </div>

    <v-btn v-show="!authToken" variant="text" @click.stop="setAuthModal(true)" icon="mdi-account"></v-btn>
    <v-btn v-show="authToken" variant="text" @click.stop="navigateTo('profile')" icon="mdi-account"></v-btn>
  </v-app-bar>
  <v-navigation-drawer
      v-model="drawer"
      v-if="this.display === 'xs'"
  >
    <category-list :onClick="selectCategory" :categories="categories" :sort-type="sortType" />
  </v-navigation-drawer>
  <v-navigation-drawer
      :model-value="isFilter"
      @update:modelValue="toggleIsFilter(false)"
      location="right"
      width="300"
  >
    <div class="d-flex flex-column pa-1 justify-start">
      <label class="label" for="standard-select">Sort by:</label>
      <v-col
          cols="12"
          sm="12"
      >
        <v-select
            :items="sortOptions"
            v-model="sortType"
            item-value="value"
            item-title="text"
            item-disabled="disabled"
            label="Order By"
            @update:modelValue="filterHandler(sortType)"
        ></v-select>
      </v-col>
    </div>
  </v-navigation-drawer>
</template>

<script>

import {mapActions, mapGetters, mapMutations} from "vuex";
import CategoryList from '../Lists/CategoryList.vue';

export default {
  name: "MyHeader",
  components: {CategoryList},
  data: () => ({
    drawer: false,
    isActive: false,
    query: '',
    sortType: '',
    routes: [
      { path: '/', name: 'Home' },
    ],
    sortOptions: [
      { text: 'From in stock to out of stock', value: { stock: 'desc' }, disabled: false },
      { text: 'From out of stock to in stock', value: { stock: 'asc' }, disabled: false },
      { text: 'From expensive to cheap', value: { price: 'desc' }, disabled: false },
      { text: 'From cheap to expensive', value: { price: 'asc' }, disabled: false },
      { text: 'From high rated to low rated', value: { rating: 'desc' }, disabled: false },
      { text: 'From low rated to high rated', value: { rating: 'asc' }, disabled: false }
    ],
  }),
  methods: {
    toggleClass() {
      this.toggleSearchActive(!this.isSearchActive);
    },
    async navigateTo(route) {
      if(route === 'profile') {
        this.toggleIsFilter(false);
      }
      this.$router.push({ name: route }).catch((error) => console.log(error));
      this.query = '';
      this.clearSearchQuery();
      await this.me();
      this.setCategoryId(0);
    },
    homeRedirect() {
      this.query = '';
      this.clearSearchQuery();
      if(this.$route.path === '/profile') {
        this.changeTitle('Popular products')
        this.getProducts(1);
        this.setCategoryId(0);
        return
      }
      this.changeTitle('Popular products')
      this.setPage(1);
      this.getProducts(1);
      this.toggleSearchActive(false)
      this.setCategoryId(0)
    },
    filterHandler(sortType) {
      this.setSortType(sortType);
      this.getSortedProducts({ sortType: this.sortType, categoryId: this.selectedCategoryId, query: this.searchQuery })
      this.sortType = '';
      this.toggleIsFilter(false);
    },
    inputLengthCount() {
      if(this.display === 'xs') return { activeAndroid: this.isSearchActive }
      return { active: this.isSearchActive }
    },
    getIcon(icons, index) {
      return `mdi-${this.icons[index]}`
    },
    selectCategory(categoryId, categoryName, sortType) {
      if(categoryId === this.selectedCategoryId && categoryName === 'all') return;
      if(this.$route.name === 'profile' || this.$route.name === 'ItemView') {
        this.navigateTo('home')
      }
      this.clearSearchQuery();
      this.setCategoryId(categoryId);
      this.toggleSearchActive(false);
      this.setPage(1);
      this.getProductsByCategory({ categoryId, sortType, page: 1 });
      this.changeTitle(categoryName);
      this.drawer = false;
    },
    searchItems(searchQuery, selectedCategoryId, sortType) {
      if(!searchQuery) return;
      this.setSearchQuery(searchQuery);
      this.setPage(1);
      this.getProductsByNameAndCategoryAndFilterType({ query: searchQuery, categoryId: selectedCategoryId, sortType })
      this.query = '';
    },
    ...mapActions(['getProductsByNameAndCategoryAndFilterType', 'getProducts', 'getProductsByCategory', 'me', 'getSortedProducts']),
    ...mapMutations(['setAuthModal', 'clearProducts', 'toggleSearchActive', 'changeTitle', 'setCategoryId', 'setPage', 'setSortType', 'setSearchQuery', 'clearSearchQuery', 'toggleIsFilter']),
  },
  computed: {
    ...mapGetters(['isAuthModal', 'authToken', 'products', 'isSearchActive', 'categories', 'selectedCategoryId', 'user', 'currentPage', 'searchQuery', 'isFilter']),
  },
  props: {
    display: {
      type: String,
      required: true,
    }
  }
}
</script>

<style scoped>
select {
  appearance: none;
  background-color: transparent;
  margin: 0;
  width: 100%;
  font-family: inherit;
  font-size: inherit;
  cursor: inherit;
  line-height: inherit;
  outline: 0;
  border: 1px solid black;
  border-radius: 10px;
  padding: 10px;
}

:root {
  --select-border: #777;
  --select-focus: blue;
  --select-arrow: var(--select-border);
}

.label {
  font-size: 32px;
  text-align: center;
}

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
  color: black;
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