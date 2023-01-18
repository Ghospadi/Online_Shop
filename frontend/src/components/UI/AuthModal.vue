<template>
  <v-dialog
      ref="form"
      v-model="isAuthModal"
      @update:modelValue="setAuthModal(false)"
  >
    <v-card class="pa-6">
      <v-form
          ref="form"
          v-model="valid"
          lazy-validation
          @keydown.enter="login(email, password)"
      >

        <v-text-field
            v-model="email"
            :rules="emailRules"
            label="E-mail"
            required
            class="pa-2"
        ></v-text-field>

        <v-text-field
            v-model="password"
            :counter="16"
            :rules="passwordRules"
            label="Password"
            type="password"
            class="pa-2"
            required
        ></v-text-field>

        <v-btn
            color="success"
            class="mr-4 ml-2"
            @click="login(email, password)"
        >
          Login
        </v-btn>

        <v-btn
            color="warning"
            class="mr-4"
            @click="setRegisterModal(true)"
        >
          Register
        </v-btn>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
  name: "AuthModal",
  data: () => ({
    valid: false,
    email: '',
    password: '',
    emailRules: [
      v => !!v || 'E-mail is required',
      v => /.+@.+/.test(v) || 'E-mail must be valid',
    ],
    passwordRules: [
      v => !!v || 'Password is required',
      v => v.length >= 8 || 'Password must be more than 8 characters',
      v => v.length <= 16 || 'Password must be less than 16 characters',
    ]
  }),
  methods: {
    async login(email, password) {
      const { valid } = await this.$refs.form.validate();

      if (!valid) return;
        const result = await this.userLogin({ email, password });
        this.setToken();
        if(result) {
          this.setAuthModal(false);
        }
    },
    ...mapActions(["userLogin"]),
    ...mapMutations(['setAuthModal', 'setToken', "setRegisterModal"])
  },
  computed: {
    ...mapGetters(["isAuthModal"]),
  }
}
</script>

<style scoped>

</style>