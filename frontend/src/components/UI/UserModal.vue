<template>
  <v-dialog :model-value="isUser" @update:modelValue="toggleIsUser(false)" max-width="500px">
    <v-card>
      <v-row class="d-flex flex-column justify-center align-center">
          <div class="d-flex flex-column align-center text-center pa-3 py-5">
            <img class="rounded-circle" width="150" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="avatar"/>
            <span class="font-weight-bold">{{ selectedUser.name }}</span><span class="text-black-50">{{ selectedUser.email }}</span><span></span>
          </div>
          <div class=" w-75 pa-3 py-5">
            <div class="d-flex justify-center align-center mb-3">
              <h4 class="text-right">Profile User #{{selectedUser.id}}</h4>
            </div>
            <v-row class="v-row mt-2">
              <v-col class="v-col-md-6"><label class="labels">Name</label><h2>{{selectedUserFullName[0]}}</h2></v-col>
              <v-col class="v-col-md-6"><label class="labels">Surname</label><h2>{{selectedUserFullName[1]}}</h2></v-col>
            </v-row>
            <v-row class="v-row mt-3">
              <v-col class="v-col-md-12"><label class="labels">Email</label><h2>{{selectedUser.email}}</h2></v-col>
              <v-col class="v-col-md-12"><label class="labels">Age</label><h2>{{selectedUser.age}}</h2></v-col>
            </v-row>
            <v-row class="v-row">
              <v-col class="v-col-md-6"><label class="labels">Country</label><h2>{{selectedUser.country}}</h2></v-col>
              <v-col class="v-col-md-6 ma-0"><label class="labels">City</label><h2>{{selectedUser.city}}</h2></v-col>
            </v-row>
            <v-row class="v-row">
              <v-col class="v-col-md-12"><label class="labels">Address</label><h2>{{selectedUser.address}}</h2></v-col>
            </v-row>
          </div>
      </v-row>
      <v-row class="d-flex justify-end ma-2">
        <v-btn @click.stop="banOrUnbanUser(selectedUser.banned, selectedUser.id)" :color="selectedUser.banned ? 'info' : 'error'">{{selectedUser.banned ? 'Unblock User' : 'Block User'}}</v-btn>
      </v-row>
    </v-card>
  </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
  name: "UserModal.vue",
  methods: {
    ...mapMutations(['toggleIsUser']),
    ...mapActions(['banUser', 'unBanUser', 'getUsers']),
    async banOrUnbanUser(banned, userId) {
      if(banned) {
        await this.unBanUser(userId);
      } else {
        await this.banUser(userId)
      }
      await this.getUsers({ page: this.currentUsersPage })
      this.toggleIsUser(false);
    },
  },
  computed: {
    ...mapGetters(['selectedUser', 'selectedUserFullName', 'isUser'])
  },
  props: {
    currentUsersPage: {
      type: Number,
      default: 1,
    }
  }
}
</script>

<style scoped>

</style>