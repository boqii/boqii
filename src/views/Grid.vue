<template>
 <div class="scrollTop">
 <div class="backTop"
   @click="backTop">
  <button v-show="flag_scroll">
     返回顶部
  </button>
  </div>
  <!-- 数据源 -->
  <div></div>
 </div>
</template> 
<script>
export default {
 name: 'scrollTop',
 data() {
 return {
  
  flag_scroll: false,
  scroll: 0,
 }
 },
 computed: {},
 methods: {
 //返回顶部事件
 backTop() {
  document.getElementsByClassName('scrollTop')[0].scrollTop = 0
 },
 //滑动超过200时显示按钮
 handleScroll() {
  let scrollTop = document.getElementsByClassName('scrollTop')[0]
  .scrollTop
  console.log(scrollTop)
  if (scrollTop > 200) {
  this.flag_scroll = true
  } else {
  this.flag_scroll = false
  }
 },
 },
 mounted() {
 window.addEventListener('scroll', this.handleScroll, true)
 },
 created() { },
}
</script>
 
<style scoped>
.scrollTop{
 width: 100%;
 height: 100vh;
 overflow-y: scroll;
}
.backTop {
 position: fixed;
 bottom: 50px;
 z-index: 100;
 right: 0;
 background: white;
}
</style>