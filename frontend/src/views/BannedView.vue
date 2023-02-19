<template>
  <div class="v-container--fluid notFoundContainer w-100 mt-16 d-flex flex-column justify-center align-center">
    <div class="imageContainer border-sm pa-2">
      <img class="w-100 h-100" src="https://mobimg.b-cdn.net/v3/fetch/85/85a95543d8ae78ab24e748def5530683.jpeg" alt="notFound"/>
    </div>
    <h1 class="text-center">You are banned</h1>
    <div class="content">
      <p>You can file an appeal about this at this <a href="mailto:online-shop@gmail.com">e-mail address</a>.</p>
    </div>
    <div>
      <v-btn color="info" @click.stop.prevent="logout()">Logout</v-btn>
    </div>
  </div>
</template>

<script>
import Cookies from "js-cookie";
import {mapMutations} from "vuex";

export default {
  name: "BannedView.vue",
  methods: {
    logout() {
      Cookies.remove('jwtToken');
      Cookies.remove('user');
      this.clearOrders()
      this.clearUserData()
      this.$router.push({ name: 'home' }).catch((error) => console.log(error));
    },
    ...mapMutations(['clearOrders', 'clearUserData'])
  }
}
</script>

<style scoped>
body {
  background-color: #f2f2f2;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  color: #3d3d3d;
  margin: 0;
  padding: 0;
}

/* Header Styles */
header {
  background-color: #0072c6;
  color: #fff;
  text-align: center;
  padding: 20px 0;
}

h1 {
  margin: 0;
  font-size: 3em;
  font-weight: 700;
  text-transform: uppercase;
}

/* Content Styles */

.notFoundContainer {
  height: 90vh;
}

.imageContainer {
  width: 100vh;
  height: 50vh;
}

.content {
  text-align: center;
  margin-top: 50px;
}

p {
  font-size: 1.5em;
  margin-bottom: 20px;
}

a {
  color: #0072c6;
  text-decoration: none;
  font-weight: 700;
}
</style>