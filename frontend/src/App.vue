<script>
import MyHeader from "./components/UI/MyHeader.vue";
import {mapActions, mapMutations} from "vuex";
import {useDisplay} from "vuetify";
export default {
  name: "App",
  components: {MyHeader},
  data: () => ({
    display: {}
  }),
  methods: {
    ...mapMutations(['setToken', 'getProductCart']),
    ...mapActions(['me'])
  },
  created() {
    this.setToken();
    this.getProductCart()
    this.display = useDisplay();
    this.me();
  }
}
</script>

<template>
  <v-sheet
      class="overflow-hidden"
      style="position: relative;"
  >
    <v-layout>
      <MyHeader :display="display.name" />
      <router-view :display="display.name"></router-view>
    </v-layout>
  </v-sheet>
</template>

<style scoped>

</style>
