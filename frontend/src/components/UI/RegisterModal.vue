<template>
  <v-dialog
      v-model="isRegisterModal"
      @update:modelValue="setRegisterModal(false)"
  >
    <v-card class="pa-6">
      <v-form
          ref="form"
          v-model="valid"
          lazy-validation
          @keydown.enter="register(getFullName(name, middleName, lastName), email, password, address, age, city, country)"
      >
        <v-row>
          <v-col
              cols="12"
              sm="6"
              md="4"
          >
            <v-text-field
                label="Legal first name*"
                v-model="name"
                :rules="nameRules"
                required
            ></v-text-field>
          </v-col>
          <v-col
              cols="12"
              sm="6"
              md="4"
          >
            <v-text-field
                label="Legal middle name"
                v-model="middleName"
            ></v-text-field>
          </v-col>
          <v-col
              cols="12"
              sm="6"
              md="4"
          >
            <v-text-field
                label="Legal last name*"
                v-model="lastName"
                :rules="lastNameRules"
                persistent-hint
                required
            ></v-text-field>
          </v-col>
          <v-col
              cols="12"
              sm="6"
          >
            <v-text-field
                label="Age*"
                type="number"
                v-model="age"
                :rules="ageRules"
                required
            ></v-text-field>
          </v-col>
          <v-col
              cols="12"
              sm="6"
          >
            <v-select
                label="Country*"
                :items="countries"
                return-object
                v-model="country"
            ></v-select>
          </v-col>
          <v-col
              cols="12"
              sm="6"
          >
            <v-text-field
                label="Сity*"
                :rules="cityRules"
                v-model="city"
                required
            ></v-text-field>
          </v-col>
          <v-col
              cols="12"
              sm="6"
          >
            <v-text-field
                label="Address*"
                :rules="addressRules"
                v-model="address"
                required
            ></v-text-field>
          </v-col>
          <v-col cols="12">
            <v-text-field
                label="Email*"
                :rules="emailRules"
                v-model="email"
                required
            ></v-text-field>
          </v-col>
          <v-col cols="12">
            <v-text-field
                label="Password*"
                type="password"
                :rules="passwordRules"
                v-model="password"
                required
            ></v-text-field>
          </v-col>
        </v-row>
        <v-btn
            color="success"
            class="mr-4"
            @click="register(getFullName(name, middleName, lastName), email, password, address, age, city, country)"
        >
          Register
        </v-btn>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";
import axios, {AxiosError} from "axios";

export default {
  name: "RegisterModal",
  data: () => ({
    valid: false,
    name: '',
    middleName: '',
    lastName: '',
    age: '',
    countries: [],
    country: null,
    city: '',
    address: '',
    email: '',
    password: '',
    emailRules: [
      v => !!v || 'E-mail is required',
      v => /.+@.+/.test(v) || 'E-mail must be valid',
    ],
    nameRules: [
      v => !!v || 'Name is required',
    ],
    lastNameRules: [
      v => !!v || 'Last Name is required',
    ],
    passwordRules: [
      v => !!v || 'Password is required',
      v => v.length >= 8 || 'Password must be more than 8 characters',
    ],
    cityRules: [
      v => !!v || 'City is required',
    ],
    addressRules: [
      v => !!v || 'Address is required',
      v => v.length >= 8 || 'Address must be more than 8 characters',
    ],
    ageRules: [
      v => !!v || 'Age is required',
      v => v <= 99 || 'Age must be less than 99 years old',
      v => v >= 8 || 'Age must be more than 8 years old'
    ]
  }),
  created() {
    if(this.countries.length === 0) {
      this.getCountryList();
    }
  },
  methods: {
    ...mapMutations(["setRegisterModal"]),
    ...mapActions(["userRegister"]),
    getFullName(name, middleName, lastName) {
      return middleName ? `${name} ${middleName} ${lastName}` : `${name} ${lastName}`;
    },
    async getCountryList() {
        const countries = []
        const { data } = await axios.get('https://countriesnow.space/api/v0.1/countries')
        for (let i = 0; i < data.data.length; ++i) {
          const country = data.data[i];
          countries.push(country.country);
        }
        return this.countries = countries;
    },
    async register(name, email, password, address, age, city, country) {
      const { valid } = await this.$refs.form.validate()

      if (!valid) return;
        const result = await this.userRegister({ name, email, password, address, age, city, country } );
        if(result) {
          this.setRegisterModal(false);
          this.clearFields();
        }
    },
    clearFields() {
      this.name = '';
      this.email = '';
      this.password = '';
      this.address = '';
      this.age = '';
      this.city = '';
      this.country = '';
    }
  },
  computed: {
    ...mapGetters(['isRegisterModal'])
  }
}
</script>

<style scoped>

</style>