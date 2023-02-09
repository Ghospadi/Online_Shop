<template>
    <v-dialog :model-value="isReview" @update:modelValue="toggleIsReview(false)" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="headline">Add Review</span>
        </v-card-title>
        <v-card-text>
          <v-form class="d-flex flex-column justify-center align-center" ref="form" v-model="valid">
            <v-textarea
                class="review-input-field"
                v-model="text"
                height="100"
                :rules="textRules"
                required
            ></v-textarea>
            <v-rating
                v-model="rating"
                :length="5"
                :rules="ratingRules"
                required
            ></v-rating>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="toggleIsReview(false)">Cancel</v-btn>
          <v-btn color="blue darken-1" text @click="submit">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
  name: 'ReviewModal.vue',
  data: () => ({
      valid: false,
      text: "",
      rating: 0,
      textRules: [
        v => !!v || "Text is required",
        v => v.length <= 200 || "Text must be less than 200 characters"
      ],
      ratingRules: [
        v => !!v || "Rating is required"
      ]
  }),
  methods: {
    submit() {
      this.$refs.form.validate().then(valid => {
        if (valid.valid) {
          if(!this.user.id) {
            this.setAuthModal(true);
            return;
          }
          this.addReview({ user_id: this.user.id, product_id: +this.$route.params.id, review: this.text, rating: this.rating, timestamp: new Date()})
          this.toggleIsReview(false);
        }
      });
    },
    ...mapMutations(['toggleIsReview', 'setAuthModal']),
    ...mapActions(['addReview'])
  },
  computed: {
    ...mapGetters(['isReview', 'user'])
  }
};
</script>

<style>

.review-input-field {
  width: 50vh;
}

</style>