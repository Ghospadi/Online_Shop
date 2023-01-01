<template>
  <div class="v-container d-flex flex-row">
    <div class="w-25">
      <div>
        <span v-for="category in categories" :key="category.id">
          {{ category.name }}
        </span>
      </div>
    </div>
    <div class="v-container--fluid w-100 d-flex flex-column justify-center align-center">
      <h2>Products</h2>
      <products-list :products="products"/>
    </div>
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import ProductsList from "../components/Lists/ProductsList.vue";

export default {
  name: "HomeView",
  components: {ProductsList},
  created() {
    this.getProductsByPage(1);
    this.getCategories();
  },
  methods: {
    ...mapActions(["getProductsByPage", "getCategories"])
  },
  computed: {
    ...mapGetters(["products", "categories"])
  }
}
</script>

<style scoped>

</style>