<template>
  <v-dialog
      v-model="isCartModal"
      scrollable
      @update:modelValue="toggleIsCartModal(false)"
      width="1040"
  >
    <v-card>
      <v-card-title>Shopping Cart</v-card-title>
      <v-divider></v-divider>
        <v-row class="d-flex justify-center align-center flex-column">
          <v-col class="pa-5 border-b" v-for="(product, index) in productCart" :key="product.id">
            <v-card class="d-flex flex-row pa-4" height="136" >
              <div class="d-flex justify-start align-start flex-row h-100 w-50">
                <div class="w-auto red">
                  <v-img width="70" :src="product.product.image"/>
                </div>
                <v-card-title class="text-sm-subtitle-1 text-wrap">
                  {{ product.product.name }}
                </v-card-title>
              </div>
              <div class="d-flex justify-start align-end flex-row h-100 w-50">
                <v-card-actions>
                  <v-btn color="error" variant="outlined" @click="removeProduct(index)">Delete Item</v-btn>
                </v-card-actions>
                <v-card-text class="text-h6">{{product.product.price}} €</v-card-text>
              </div>
            </v-card>
          </v-col>
        </v-row>
      <v-card-actions style="height: 120px" class="d-flex mt-4 justify-space-between align-center">
        <v-btn
            color="blue-darken-1"
            variant="outlined"
            @click="toggleIsCartModal(false)"
        >
          Continue shopping
        </v-btn>
        <div style="border: 1px solid #4caf50; border-radius: 6px;" class="d-flex bg-green-lighten-5 flex-row justify-center align-center pa-6">
          <p class="pr-4 text-h4">{{ calculatedPrice }} €</p>
          <v-btn
              class="bg-green-lighten-1"
              @click="makeOrder({ userId: user.id, products: null, order: { total: productCart.length, date: new Date() } })"
          >
            Make Order
          </v-btn>
        </div>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
  name: "OrderCartModal.vue",
  data: () => ({

  }),
  methods: {
    ...mapMutations(['toggleIsCartModal', 'removeProduct']),
    ...mapActions(['makeOrder']),
  },
  computed: {
    calculatedPrice() {
      let price = 0;
      for(let i = 0; i < this.productCart.length; i++) {
        price += this.productCart[i].product.price
      }
      return price;
    },
    ...mapGetters(['isCartModal', 'productCart', 'user'])
  }
}
</script>

<style scoped>

</style>