import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Details from '../views/Details'
import Test from '../views/Test'
import Grid from '../views/Grid'
import Guanzhu from '../views/Guanzhu'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path:'/gz',
    component:Guanzhu
  },
  {
    path:'/grid',
    component:Grid
  },
  {
    path:'/test',
    component:Test
  },
  {
    path:'/details',
    component:Details
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
