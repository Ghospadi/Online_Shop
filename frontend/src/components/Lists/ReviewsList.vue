<template>
  <v-card v-for="review in reviews" :key="review.id" @click.stop="$router.push({ path: `/item/${review.products.id}`, query: { descriptionLength: review.products.description } })" class="border rounded-lg mb-2 pa-0" :class="{'review': display !== 'xs', 'phone-review': display === 'xs'}">
    <v-col cols="12" class="d-flex justify-space-between align-center pa-4">
      <h4 class="text-center">{{ review.users.name }}</h4>
      <h5 class="text-center" style="width: 55vh">{{ review.products.name }} </h5>
      <p class="text-center">{{ review.timestamp.split('T')[0] }}</p>
    </v-col>
    <v-divider></v-divider>
    <v-col cols="12" class="pa-0">
      <h5 style="word-wrap: break-word;" class="pt-4 pl-4">{{ review.review }}</h5>
      <v-rating
          readonly
          class="d-flex justify-center align-center"
          empty-icon="mdi-star-outline"
          full-icon="mdi-star"
          half-icon="mdi-star-half-full"
          length="5"
          size="48"
          v-model="review.rating"
      ></v-rating>
    </v-col>
    <v-col class="d-flex pa-0 mb-2" :class="{'justify-center': display === 'xs', 'justify-end': display !== 'xs'}">
      <v-btn class="mr-2" @click.stop="onDeleteReview(review.id)" color="error">
        Delete Review
      </v-btn>
      <v-btn class="mr-2" @click.stop="editReview(review.id)" color="warning">
        Edit Review
      </v-btn>
    </v-col>
  </v-card>
</template>

<script>
import {mapActions, mapMutations} from "vuex";

export default {
  name: "ReviewsList",
  methods: {
    async editReview(reviewId) {
      await this.getReviewById(reviewId)
      this.toggleIsReview(true)
    },
    ...mapMutations(['toggleIsReview']),
    ...mapActions(['getReviewById']),
  },
  props: {
    reviews: {
      type: Array,
      required: true,
    },
    display: {
      type: String,
      required: true,
    },
    onDeleteReview: {
      type: Function,
      required: true,
    }
  }
}
</script>

<style scoped>

.review {
  width: 85vh;
  margin-bottom: 10px;
}

.phone-review {
  width: 44vh;
  margin-bottom: 10px;
}

</style>