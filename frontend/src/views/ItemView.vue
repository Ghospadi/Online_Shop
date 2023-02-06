<template>
  <div class="v-container h-100 w-100 mt-16 d-flex flex-row">
    <div>{{product}}</div>
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "ItemView.vue",
  mounted() {
    this.getProduct(+this.$route.params.id);
  },
  methods: {
    ...mapActions(['getProduct'])
  },
  computed: {
    ...mapGetters(['product'])
  }
}
</script>

<style scoped>

</style>