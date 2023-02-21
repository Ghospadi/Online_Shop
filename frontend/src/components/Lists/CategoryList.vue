<template>
  <div class="d-flex flex-column pa-1 text-no-wrap justify-start">
    <button class="btn text-decoration-none pt-2 pb-2" @click.prevent="onClick(category.id, category.name, priceSortType)" v-for="(category, index) in categories" :key="category.id">
      <v-icon
          start
          :icon="getIcon(icons, index)"
      ></v-icon>
      {{ category.name }}
    </button>
  </div>
</template>

<script>
export default {
  name: "CategoryList.vue",
  data: () => ({
    icons: [
      'all-inclusive',
      'monitor',
      'laptop',
      'cellphone',
      'washing-machine',
      'hammer-wrench',
      'sofa',
      'pipe-leak',
      'tshirt-crew',
      'pinwheel',
      'paw',
      'paperclip',
      'controller'
    ],
  }),
  methods: {
    getIcon(icons, index) {
      return `mdi-${this.icons[index]}`
    },
  },
  props: {
    onClick: {
      type: Function,
      required: true
    },
    categories: {
      type: Array,
      required: true
    },
    priceSortType: {
      type: String,
      required: true
    }
  },
}
</script>

<style scoped>
.btn {
  width: 75vh;
  text-align: left;
  color: black;
  cursor: pointer;
}

.btn:hover {
  color: #92B4EC;
}
</style>