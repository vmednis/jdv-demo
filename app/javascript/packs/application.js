import Vue from 'vue';
import VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import routes from '../src/routes.js';
import App from '../src/App.vue';

Vue.use(VueAxios, axios)

Vue.use(VueRouter);
const router = new VueRouter({ mode: 'history', routes });

window.onload = function() {
  new Vue({
    router,
    render: h => h(App)
  }).$mount('#app');
};
