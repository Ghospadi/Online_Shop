<script>
import MyHeader from "./components/UI/MyHeader.vue";
import {mapActions, mapGetters, mapMutations} from "vuex";
import {useDisplay} from "vuetify";
export default {
  name: "App",
  components: {MyHeader},
  data: () => ({
    display: {},
    query: '',
  }),
  methods: {
    ...mapMutations(['setToken', 'getProductCart']),
    ...mapActions(['me']),
    handleData(data) {
      this.query = data
    }
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
      <MyHeader @query-data="handleData" :display="display.name" />
      <router-view :query="query" :display="display.name"></router-view>
    </v-layout>
  </v-sheet>
</template>

<style scoped>

</style>
