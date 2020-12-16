<template>
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
</template>
<script>
export default {
  data() {
    return {
      arr: ["商品", "评论", "详情", "推荐"],

    };
  },
};
</script>
<style>
/* .my-swipe .van-swipe-item {
  color: #fff;
  font-size: 20px;
  line-height: 150px;
  text-align: center;
  background-color: #39a9ed;
} */
.swip {
  width: 100%;
}
.image img{
    display: block;
}
</style>
