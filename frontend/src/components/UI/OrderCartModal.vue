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
            <v-card class="d-flex flex-row pa-4" height="136" :class="{'flex-column': display === 'xs'}">
              <div class="d-flex justify-start align-start flex-row h-100 w-50">
                <div class="w-auto red">
                  <v-img width="70" :src="product.product.image"/>
                </div>
                <v-card-title class="text-wrap" :style="display === 'xs' ? 'font-size: 12px; padding:0; padding-left: 5px; width: 29vh; word-wrap: break-word;' : null">
                  {{ product.product.name }}
                </v-card-title>
              </div>
              <div class="d-flex justify-end align-end flex-row h-100" :class="display === 'xs' ? 'w-100' : 'w-50'">
                <v-card-actions :class="{'w-75 d-flex justify-end': display !== 'xs'}">
                  <v-btn color="error" variant="outlined" @click="removeProduct(index)">Delete Item</v-btn>
                  <div class="d-flex ml-8 justify-center align-center">
                    <v-btn @click="product.quantity === 1 ? product.quantity = 1 : product.quantity--"  color="info" variant="outlined">-</v-btn>
                    <p class="ma-2">{{product.quantity}}</p>
                    <v-btn @click="product.quantity++" class="ma-0 pa-0" color="success" variant="outlined">+</v-btn>
                  </div>
                </v-card-actions>
                <v-card-text class="text-h6 w-25">{{product.product.price}} €</v-card-text>
              </div>
            </v-card>
          </v-col>
        </v-row>
      <v-col>
        <v-card-actions style="height: 120px" class="d-flex mt-4 justify-space-between align-center">
          <div class="d-flex" :class="{'v-col-5': display === 'xs' }">
            <v-btn
                color="blue-darken-1"
                variant="outlined"
                class="d-flex align-center justify-center"
                @click="toggleIsCartModal(false)"
            >
              <v-card-text :style="display === 'xs' ? 'font-size: 10px' : null">Continue shopping</v-card-text>
            </v-btn>
          </div>
          <div style="border: 1px solid #4caf50; border-radius: 6px;" :class="{'v-col-7 flex-column': display === 'xs' }" class="d-flex bg-green-lighten-5 flex-row justify-center align-center pa-6">
            <p class="text-h4" :class="{'pr-4': display !== 'xs' }">{{ calculatedPrice }} €</p>
            <v-btn
                class="bg-green-lighten-1"
                @click="createOrder(user.id, productCart,{ total: productCart.length, date: new Date()})"
            >
              Make Order
            </v-btn>
          </div>
        </v-card-actions>
      </v-col>
    </v-card>
  </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import Notiflix from "notiflix";

export default {
  name: "OrderCartModal.vue",
  data: () => ({}),
  methods: {
    createOrder(userId, products, order) {
      if(products.length === 0) {
        Notiflix.Notify.failure("You can't create order without products");
        return;
      }
      this.makeOrder({ userId, products, order })
    },
    ...mapMutations(['toggleIsCartModal', 'removeProduct']),
    ...mapActions(['makeOrder']),
  },
  computed: {
    calculatedPrice() {
      let price = 0;
      for(let i = 0; i < this.productCart.length; i++) {
        price += this.productCart[i].product.price * this.productCart[i].quantity
      }
      return price;
    },
    ...mapGetters(['isCartModal', 'productCart', 'user'])
  },
  props: {
    display: String
  }
}
</script>

<style scoped>

</style>