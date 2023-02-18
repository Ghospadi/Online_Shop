<template>
  <v-dialog :model-value="isReview" @update:modelValue="toggleIsReview(false)" max-width="500px">
    1
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
export default {
  name: "UserModal.vue",
}
</script>

<style scoped>

</style>