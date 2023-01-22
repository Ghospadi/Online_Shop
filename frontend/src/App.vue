<script>
import MyHeader from "./components/UI/MyHeader.vue";
import {mapActions, mapGetters, mapMutations} from "vuex";
import {useDisplay} from "vuetify";
import Cookies from "js-cookie";
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
  computed: {
    ...mapGetters(['authToken'])
  },
  created() {
    this.setToken();
    this.getProductCart()
    this.display = useDisplay();
    if(this.authToken){
      this.me();
    }
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
