<template>
  <main>
    <aside>
      <div>
        <span v-for="category in categories" :key="category.id">
          {{ category.name }}
        </span>
      </div>
    </aside>
    <section>
      <h5>Products</h5>
      <products-list :products="products"/>
    </section>
  </main>
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