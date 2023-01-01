<template>
  <v-container fluid>
    <v-row>
      <v-card class="mt-8 mr-8 bg-grey-lighten-1" v-for="product in products" :key="product.id" :width="319">
        <v-img height="200" :src="product.image" cover></v-img>
        <v-card-title>{{product.name}}</v-card-title>
        <v-card-text>{{product.description}}</v-card-text>
      </v-card>
    </v-row>
  </v-container>
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