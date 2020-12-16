import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Vant from 'vant'
import 'vant/lib/index.css';
import axios from 'axios'
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.min.css';
import qs from 'qs'
import '../public/icon.css'

axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.use(Vant);
Vue.use(MintUI)
Vue.prototype.axios=axios
Vue.prototype.qs=qs;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
