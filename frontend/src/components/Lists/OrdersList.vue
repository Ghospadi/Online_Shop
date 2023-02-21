<template>
  <v-card class="d-flex v-col-3 align-center flex-column ma-1 mt-0 pa-2 orderCard border" :class="{'v-col-10': display === 'xs'}" v-for="(order, index) in orderItems" :key="order.id">
    <v-col>
      <v-card-text class="pa-0 text-h5"> Order № {{order.id + 1}}</v-card-text>
    </v-col>
    <order-list :display="display" :order="order.result"/>
    <v-col class="d-flex w-100 h-100 justify-end align-end" style="width: 50vh">
      <v-card-text class="d-flex justify-end align-end text-h6 pa-0 pr-3">Total: {{calculatedPrice[index]}} €</v-card-text>
    </v-col>
  </v-card>
</template>

<script>
import OrderList from "./OrderList.vue";
export default {
  name: "OrdersList",
  components: {OrderList},
  computed: {
    calculatedPrice() {
      return this.orderItems.map(items => items.result.reduce((acc, item) => acc + item.price * item.quantity, 0));
    },
  },
  props: {
    display: {
      type: String,
      required: true
    },
    orderItems: {
      type: Array,
      required: true,
    },
  }
}
</script>

<style scoped>

.orderCard {
  width: 44vh;
  height: 24vh;
  margin-top: 20px;
  overflow: auto;
  border-radius: 5px;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}

.orderCard::-webkit-scrollbar {
  background: #000;
  width: 5px;
}

/* Track */
.orderCard::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
.orderCard::-webkit-scrollbar-thumb {
  background: #888;
}

/* Handle on hover */
.orderCard::-webkit-scrollbar-thumb:hover {
  background: #555;
}

.orderCard::-webkit-scrollbar:horizontal {
  display: none;
}

</style>