<template>
  <div class="v-container--fluid notFoundContainer w-100 mt-16 d-flex flex-column justify-center align-center">
    <div class="imageContainer border-sm pa-2">
      <img class="w-100 h-100" src="https://www.meme-arsenal.com/memes/6e1cbe2c9866d399a1c6634ea486be1a.jpg" alt="notFound"/>
    </div>
    <h1 class="text-center">404 Not Found</h1>
    <div class="content">
      <p>The page you are looking for cannot be found.</p>
      <p>Please check the URL and try again, or visit our <router-link to="/">homepage</router-link>.</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "NotFoundView"
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
  width: 50vh;
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