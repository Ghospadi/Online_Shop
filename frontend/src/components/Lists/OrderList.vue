<template>
  <v-col class="d-flex orderItem border w-100 ma-2" :data-quantity="item.quantity" @click.stop="$router.push({ path: `/item/${item.products.id}`, query: { descriptionLength: item.products.description } })" v-for="item in order" :key="item.id">
    <div class="d-flex w-100">
      <div class="d-flex">
        <img :width="display === 'xs' ? 75 : 85" :height="display === 'xs' ? 75 : 85" :src="item.products.image" :alt="item.products.name"/>
      </div>
      <div class="d-flex align-center text text-wrap pl-3">
        {{ item.products.name }}
      </div>
    </div>
    <div class="d-flex justify-center text-no-wrap align-center w-25">
      <v-card-text class="d-flex pa-1">{{ item.products.price }} €</v-card-text>
    </div>
  </v-col>
</template>

<script>
export default {
  name: "OrderList",
  props: {
    display: {
      type: String,
      required: true
    },
    order: {
      type: Array,
      required: true,
    }
  },
}
</script>

<style scoped>

.orderItem {
  width: 80vh;
  border-radius: 5px;
  box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
  transition: all 0.5s;
}

.orderItem:before {
  content: attr(data-quantity);
  font-size:12px;
  font-weight:600;
  position: relative;
  top: -20px;
  right: 20px;
  background: #92B4EC;
  line-height:24px;
  padding:0 5px;
  height:24px;
  min-width:24px;
  color:white;
  opacity: 0;
  text-align:center;
  border-radius:24px;
  transition: all 0.5s;
}

.orderItem:hover:before {
  opacity: 1;
}

.orderItem:hover {
  cursor: pointer;
  scale: 1.02
}

.text {
  font-size: 12px;
  overflow: hidden;
  text-overflow: ellipsis;
}

</style>