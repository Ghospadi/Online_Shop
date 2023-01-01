<script>
import MyHeader from "./components/UI/MyHeader.vue";
export default {
  name: "App",
  components: {MyHeader},
}
</script>

<template>
  <MyHeader />
  <router-view></router-view>
</template>

<style scoped>

</style>
