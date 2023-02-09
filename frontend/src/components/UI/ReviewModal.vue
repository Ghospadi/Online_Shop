<template>
    <v-dialog :model-value="isReview" @update:modelValue="toggleIsReview(false)" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="headline">Add Review</span>
        </v-card-title>
        <v-card-text>
          <v-form ref="form" v-model="valid">
            <v-col class="d-flex flex-column" cols="12" sm="12">
              <v-textarea
                  clearable
                  rows="5"
                  v-model="text"
                  :rules="textRules"
                  required
              ></v-textarea>
              <v-rating
                  v-model="rating"
                  :length="5"
                  :size="55"
                  :rules="ratingRules"
                  required
              ></v-rating>
            </v-col>
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

.review-input-field-phone {
  width: 40vh;
}

</style>