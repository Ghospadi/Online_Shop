<template>
  <v-container fluid>
    <v-row :class="{'d-flex justify-center align-center':display === 'xs'}">
      <v-card @click="redirectToItem(product.id, product.description)" class="mt-4 mr-4 border-s bg-shades-transparent" :class="product.stock === 0 ? '' : 'card-scale'"  v-for="product in products" :key="product.id" :width="display !== 'xs' ? 310 : 250">
        <v-img height="200" :src="product.image" cover></v-img>
        <v-card-title>{{product.name}}</v-card-title>
        <div class="d-flex flex-column">
          <div class="d-flex">
            <v-card-text class="mb-2" :class="{'text-h4': display !== 'xs', 'text-h5': display === 'xs'}">{{product.price}} €</v-card-text>
            <v-btn @click.prevent.stop="addProduct({ id: product.id, name: product.name, description: product.description, price: product.price, image: product.image, stock: product.stock })" class="float-right mr-2 mt-2" :border="false" :elevation="0">
              <v-icon size="large" icon="mdi-cart-variant" />
            </v-btn>
          </div>
          <v-rating
              readonly
              class="d-flex justify-center align-center"
              empty-icon="mdi-star-outline"
              full-icon="mdi-star"
              half-icon="mdi-star-half-full"
              length="5"
              size="48"
              v-model="product.rating"
          ></v-rating>
        </div>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>

import {mapMutations} from "vuex";

export default {
  name: "ProductsList",
  components: [],
  props: {
    products: {
      type: Array,
      required: true,
    },
    display: {
      type: String,
      required: true,
    }
  },
  methods: {
    redirectToItem(id, productDescription) {
      this.$router.push({ path: `/item/${id}`, query: { descriptionLength: productDescription.length } });
      this.toggleSearchActive(false);
      this.toggleIsFilter(false);
    },
    ...mapMutations(['toggleSearchActive', 'toggleIsFilter', 'addProduct']),
  }
}
</script>

<style scoped>
.card-scale {
  transition: all 0.2s;
}
.card-scale:hover {
  cursor: pointer;
  scale: 1.05;
}
</style>