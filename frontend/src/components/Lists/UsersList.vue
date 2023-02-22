<template>
  <v-card v-for="user in users" :key="user.id" class="rounded-lg mb-2 pa-4" :class="{'users': display !== 'xs', 'phone-users': display === 'xs', 'blocked': user.banned, 'border': !user.banned}">
    <v-col cols="12" class="d-flex justify-space-between align-center pa-2">
      <h4 class="text-center">{{ user.id }}</h4>
      <h5 class="text-center">{{ user.name }} ({{user.email}}) </h5>
      <p class="text-center">{{ user.country }}</p>
    </v-col>
    <v-divider></v-divider>
    <v-col cols="12" class="pa-0">
      <h5 style="word-wrap: break-word;" class="pt-4">{{ user.city }} {{ user.address }}</h5>
    </v-col>
    <v-col class="d-flex justify-end pa-0">
      <v-btn @click.stop="selectUser(user.id)" color="warning">
        Manage User
      </v-btn>
    </v-col>
  </v-card>
</template>

<script>
import {mapActions, mapMutations} from "vuex";

export default {
  name: "UsersList",
  methods: {
    async selectUser(userId) {
      await this.getUserById(userId)
      this.toggleIsUser(true)
    },
    ...mapActions(['getUserById']),
    ...mapMutations(['toggleIsUser'])
  },
  props: {
    users: {
      type: Array,
      required: true,
    },
    display: {
      Type: String,
      required: true
    }
  },
}
</script>

<style scoped>

.users {
  width: 85vh;
  margin-bottom: 10px;
}

.phone-users {
  width: 44vh;
  margin-bottom: 10px;
}

.blocked {
  border: 1px solid red;
}

</style>