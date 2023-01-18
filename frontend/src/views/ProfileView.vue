<template>
  <div class="v-container w-100 mt-16 d-flex flex-row">
    <v-row>
      <v-col class="border-e v-col-md-4 w-50">
          <div class="d-flex flex-column align-center text-center pa-3 py-5">
            <img class="rounded-circle" width="150" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="avatar"/>
            <span class="font-weight-bold">{{ user.name }}</span><span class="text-black-50">{{ user.email }}</span><span></span>
          </div>
          <form class="pa-3 py-5" @submit.prevent="changeData({ name: `${this.name ? this.name : fullName[0]} ${this.surname ? this.surname : fullName[1]}`, email, age, country, city, address })">
            <div class="d-flex justify-center align-center mb-3">
              <h4 class="text-right">Profile Settings</h4>
            </div>
            <v-row class="v-row mt-2">
              <v-col class="v-col-md-6"><label class="labels">Name</label><input type="text" class="form-control" v-model="name" :placeholder="fullName[0]"></v-col>
              <v-col class="v-col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" v-model="surname" :placeholder="fullName[1]"></v-col>
            </v-row>
            <v-row class="v-row mt-3">
              <v-col class="v-col-md-12"><label class="labels">Email</label><input type="text" class="form-control" minlength="1" maxlength="254" :placeholder="this.user.email" v-model="email"></v-col>
              <v-col class="v-col-md-12"><label class="labels">Age</label><input type="number" min="8" max="99" class="form-control" :placeholder="this.user.age" v-model="age"></v-col>
            </v-row>
            <v-row class="v-row">
              <v-col class="v-col-md-6"><label class="labels">Country</label><input type="text" class="form-control" minlength="3" maxlength="254" :placeholder="this.user.country" v-model="country"></v-col>
              <v-col class="v-col-md-6 ma-0"><label class="labels">City</label><input type="text" class="form-control" minlength="1" maxlength="254" :placeholder="this.user.city" v-model="city"></v-col>
            </v-row>
            <v-row class="v-row">
              <v-col class="v-col-md-12"><label class="labels">Address</label><input type="text" class="form-control" minlength="1" maxlength="254" :placeholder="this.user.address" v-model="address"></v-col>
            </v-row>
            <div class="mt-5 d-flex align-center justify-center text-center"><input type="submit" value="Change Profile" class="floating-button"/></div>
          </form>
      </v-col>
      <v-col class="flex-lg-column w-75">
          <v-btn @click="logout()">Logout</v-btn>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import Cookies from "js-cookie";
import {mapActions, mapGetters} from "vuex";
import {toRaw} from "vue";

export default {
  name: "ProfileView.vue",
  data: () => ({
    valid: false,
    name: '',
    surname: '',
    email: '',
    age: '',
    country: '',
    city: '',
    address: '',
  }),
  created() {
    this.me();
  },
  methods: {
    logout() {
      Cookies.remove('jwtToken');
      this.$router.push('/').catch((error) => console.log(error));
    },
    async changeData(data) {
      if(data.email === '' && data.age === '' && data.country === '' && data.city === '' && data.address === '') {
        return;
      }
      for(let d in data) {
        if(!data[d]) {
          delete data[d];
        }
      }
      const result = {...this.user, ...data}
      await this.updateProfile(result);
      await this.me();
    },
    ...mapActions(['me', 'updateProfile']),
  },
  computed: {
    ...mapGetters(['user', 'fullName'])
  },
  props: {
    display: String,
  }
}
</script>

<style scoped>
input:invalid {
  border: 1px solid red;
}

.labels {
  font-size: 11px
}
.form-control:focus {
  box-shadow: none;
  border: 1px solid #BA68C8;
}
.form-control{
  display: block;
  width: 100%;
  padding: .375rem .75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #212529;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border-radius: .25rem;
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
  outline: none;
}
.floating-button {
  text-decoration: none;
  display: inline-block;
  width: 140px;
  height: 45px;
  line-height: 45px;
  border-radius: 45px;
  margin: 10px 20px;
  font-family: 'Montserrat', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  text-align: center;
  font-weight: 600;
  color: #524f4e;
  background: white;
  box-shadow: 0 8px 15px rgba(0, 0, 0, .1);
  transition: .25s;
}
.floating-button:hover {
  background: #92B4EC;
  box-shadow: 0 15px 20px rgba(146,180,236, .4);
  color: white;
  transform: translateY(-7px);
}
.floating-button:active {
  transform: translateY(0px);
}
</style>