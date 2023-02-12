<template>
    <v-dialog :model-value="isReview" @update:modelValue="toggleIsReview(false)" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="headline">{{edit ? `Edit Review #${review.id}`: 'Add Review'}}</span>
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
                  required
              ></v-rating>
            </v-col>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="toggleIsReview(false)">Cancel</v-btn>
          <v-btn color="blue darken-1" text @click.prevent="submit">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import Notiflix from "notiflix";

export default {
  name: 'ReviewModal.vue',
  data: () => ({
      valid: false,
      text: null,
      rating: null,
      textRules: [
        v => !!v || "Text is required",
        v => v.length <= 200 || "Text must be less than 200 characters"
      ],
  }),
  methods: {
    async submit() {
      if(this.rating === null) {
        Notiflix.Notify.info('Rating must be more than zero')
        return;
      }
      if (this.edit) {
        await this.editReview({
          ...this.review,
          review: this.text ? this.text : this.review.review,
          rating: this.rating ? this.rating : this.review.rating,
          timestamp: new Date()
        })
        this.text = null;
        this.rating = null;
        await this.getReviewsByPageAndUserIdAndSortType({
          page: this.currentReviewsPage,
          userId: +this.user.id,
          sortType: null
        })
        this.toggleIsReview(false);
        return;
      }
      this.$refs.form.validate().then(async valid => {
        if (valid.valid) {
          if (!this.user.id) {
            this.setAuthModal(true);
            return;
          }
          await this.addReview({
            user_id: this.user.id,
            product_id: +this.$route.params.id,
            review: this.text,
            rating: this.rating,
            timestamp: new Date()
          })
          this.toggleIsReview(false);
        }
      });
    },
    ...mapMutations(['toggleIsReview', 'setAuthModal']),
    ...mapActions(['addReview', 'editReview', 'getReviewsByPageAndUserIdAndSortType']),
  },
  computed: {
    ...mapGetters(['isReview', 'user', 'review', 'currentReviewsPage'])
  },
  props: {
    edit: {
      type: Boolean,
      default: false,
    },
  }
};
</script>

<style>

</style>