import Home from './Home.vue';
import PageNotFound from './PageNotFound.vue'

const routes = [
  { path: '/', component: Home },
  { path: '*', component: PageNotFound }
];

export default routes;
