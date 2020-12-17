<template>
 <div class="scrollTop">
 <div class="backTop"
   @click="backTop">
  <button class="totop" v-show="flag_scroll">
   <img src="../assets/回到顶部.png" alt="">
  </button>
  </div>
  <!-- 数据源 -->
    <div>
    <van-nav-bar title="标题" left-text="" left-arrow placeholder>
      <template #right>
        <van-icon name="shopping-cart-o" size="18" />
        <van-icon name="share-o" size="18" />
        <van-icon name="ellipsis" size="18" />
      </template>
    </van-nav-bar>
    <van-tabs v-model="active" scrollspy sticky>
      <van-tab v-for="index in arr" :key="index" :title="index"> </van-tab>
      <!-- 轮播图区域 -->
      <van-swipe class="my-swipe" indicator-color="white">
        <van-swipe-item><img class="swip" src="../assets/kewang1.jpg" /></van-swipe-item>
        <van-swipe-item><img class="swip" src="../assets/kewang2.jpg" /></van-swipe-item>
        <van-swipe-item><img class="swip" src="../assets/kewang3.jpg" /></van-swipe-item>
        <van-swipe-item><img class="swip" src="../assets/kewang4.jpg" /></van-swipe-item>
        <van-swipe-item><img class="swip" src="../assets/kewang5.jpg" /></van-swipe-item>
      </van-swipe>
    </van-tabs>
    <!-- 商品数据 -->
    <span class="prices_title">
       <span class="big_price">￥722</span>
       <img class="small_v" src="../assets/vvvip.png" alt="">
       <span>￥685.9</span>
       <span style="margin-left:20px;color:#aaa">月销指数</span>
       <span style="color:#aaa;">187</span>
       <span class="guojia">
          <img class="sm_country" src="../assets/ca.gif" alt="">
          <span>加拿大</span>
          <p style="margin:5px;color:#aaa;">66.85 元/斤</p>
          <p class="big_title">渴望 Orijen 六种鲜鱼海藻配方全猫粮 5.4kg 加拿大进口</p>
          <p class="sub_title">6种鲜鱼猫咪喜爱的口感</p>
       </span>
    </span>
    <!-- 商品活动  -->
    <div class="huodong">
       <span style="margin-right:15px ;">活动</span><span class="sm_btn">波奇豆抵5%</span>
       <p style="margin-top:10px">
          <span class="sm_block">直降</span><span class="block_text">已优惠￥38</span>
       </p>
       <p style="margin-top:5px">
          <span class="sm_block">限购</span><span class="block_text">最多购买10件，最多购买5次</span>
       </p>
    </div>

    <!-- 商品评价 -->


    <!-- 详情商品信息区域 -->
    <div class="image">
    <img class="swip" src="../assets/Details/consumer.jpg" >
    <img class="swip"  src="../assets/Details/1.jpg" >
    <img class="swip"  src="../assets/Details/2.jpg" >
    <img  class="swip" src="../assets/Details/3.jpg" >
    <img  class="swip" src="../assets/Details/4.jpg" >
    <img  class="swip" src="../assets/Details/5.jpg" >
    <img class="swip" src="../assets/Details/6.jpg" >
    <img class="swip" src="../assets/Details/7.jpg" >
    <img class="swip" src="../assets/Details/8.jpg" >
    <img class="swip" src="../assets/Details/9.jpg" >
    <img class="swip" src="../assets/Details/10.jpg" >
    <img class="swip" src="../assets/Details/11.jpg" >
    <img class="swip" src="../assets/Details/12.jpg" >
    <img class="swip" src="../assets/Details/13.jpg" >
    <img class="swip" src="../assets/Details/14.jpg" >
    <img class="swip" src="../assets/Details/15.jpg" >
    <img class="swip" src="../assets/Details/16.jpg" >
    <img class="swip" src="../assets/Details/17.jpg" >
    <img class="swip" src="../assets/Details/18.jpg" >
    <img class="swip" src="../assets/Details/19.jpg" >
    <img class="swip" src="../assets/Details/20.jpg" >
    <img class="swip" src="../assets/Details/21.jpg" >
    <img class="swip" src="../assets/Details/22.png" >
    <img class="swip" src="../assets/Details/23.png" >
    </div>
    <!-- 底部商品导航 -->
    <van-goods-action fixed>
      <van-goods-action-icon icon="service-o" text="客服"  />
      <van-goods-action-icon icon="star-o" text="收藏"  />
      <van-goods-action-button type="warning" text="加入购物车" />
      <van-goods-action-button type="danger" text="立即购买" />
    </van-goods-action>
  </div>
  <div></div>
 </div>
</template> 
<script>
export default {
 name: 'scrollTop',
 data() {
 return {
  arr: ["商品", "评论", "详情", "推荐"],

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
 background:transparent;
}
.swip {
  width: 100%;
}
.image img{
    display: block;
}
.totop{
   background:transparent;
   width: 50px;
   height: 50px;
   border: 0;
}
.totop img{
   width: 100%;
   background: transparent;
}
.prices_title{
   font-size: 14px ;
}
.big_price{
   font:bold 24px "Microsoft YaHei";
   color: red;
   margin-right: 10px ;
}

.small_v{
   width: 16px;
   height: 16px;
}
.sm_country{
   width: 14px;
   height: 14px;
   border-radius: 50%;
   font-size: 10px;
}
.guojia{
   margin-left:70px ;
    font-size: 13px;
}
.big_title{
   margin: 5px;
   font-size: 16px;
}
.sub_title{
   font-size: 12px;
   color: red;
   margin: 5px;
   margin-bottom: 20px;
}
.huodong{
   margin:  0 auto;
   width: 90%;
    font: 16px "Microsoft YaHei";
    color: #999;
    margin-bottom: 50px;
    box-shadow: 0 0 15px 1px #e8e8e8;
    border-radius: 10px;
    padding: 20px 10px;
}
.sm_btn{
   border-radius: 28px;
   background: #fcc;
   color: #f66;
   font-size: 10px;
   padding: 1px 10px;
}
.sm_block{
   font-size: 8px;
   color: red;
   border: 1px solid #f00;
   border-radius: 28px;
   padding:0 5px;
}
.block_text{
   margin-left: 15px;
   font-size: 12px ;
   color : #bbb ;
}
</style>