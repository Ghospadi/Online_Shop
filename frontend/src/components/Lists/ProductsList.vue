<template>
  <div>
    <div v-for="product in products" :key="product.id">
      <product-card/>
    </div>
  </div>
</template>

<script>

export default {
  name: "ProductsList",
  components: [],
  props: {
    products: {
      type: Array,
      required: true,
    }
  }
}
</script>

<style scoped>

</style>