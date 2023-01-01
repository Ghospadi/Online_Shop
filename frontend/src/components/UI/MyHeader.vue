<template>
  <nav class="MyHeader__nav">
    <div class="nav__route" v-for="route in routes" :key="route.path">
      <router-link class="route__text" :to="route.path">{{ route.name }}</router-link>
    </div>
    <div></div>
  </nav>
</template>

<script>

export default {
  name: "MyHeader",
  data: () => ({
    routes: [
      { path: '/', name: 'Home' },
    ]
  }),
}
</script>

<style scoped>
.MyHeader__nav {
  display: flex;
  background-color: #bdbdbd;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  height: 75px;
}

.nav__route {
  padding-left: 20px;
}

.route__text {
  color: white;
  font-size: 24px;
  text-decoration: none;
}

.route__text:hover {
  color: khaki;
}
</style>