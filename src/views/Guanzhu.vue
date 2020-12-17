<template>
  <div class="guanzhu">
    <!-- <van-nav-bar 
      class="tit"
      left-text="推荐关注"
      right-text="＞"
      @click-right="onClickRight"
    /> -->
    <div class="box">
      <div class="innerbox" v-for="k of 8" :key="k">
        <button class="close">×</button>
        <!-- <div > -->
        <div class="img_box">
          <img class="img" src="../assets/tou.jpg" alt="" />
        </div>
        <p class="niname">萌宠治愈师</p>
        <p class="daren">知名萌宠博主</p>
        <button class="btn">关注</button>
      </div>
        <div class="more">更多</div>
    </div>
    <!-- </div> -->
  </div>
</template>
<style>
* {
  margin: 0;
  padding: 0;
}
/* .guanzhu > .tit {
  color: #bbb;
} */
/* .tit{} */
.box {
  width: 300%;
}
.innerbox {
  float: left;
  position: relative;
  padding-top: 0.5rem;
  width: 3rem;
  box-shadow: 0 0 2px 1px #e6e6e6;
  border-radius: 0.1rem;
  margin-left: 0.3rem;
  margin-bottom: 0.3rem;
  text-align: center;
  /* width: 30%; */
}
.close {
  font: lighter 0.5rem "Microsoft YaHei";
  /* float: right;
  margin-right: 5px;
  margin-top: -3px; */
  position: absolute;
  right: 5px;
  top: -3px;
  color: #aaa;
  border: 0;
  background: transparent;
}
.img {
  width: 50%;
  border-radius: 50%;
  /* padding-top: 10px ; */
}
.niname {
  /* text-align: center; */
  font: normal 0.35rem "Microsoft YaHei";
  color: #666;
}
.daren {
  margin-top: 2px;
  /* text-align: center; */
  font: 0.2rem "YaHei";
  color: #aaa;
}
.btn {
  border: 1px solid #f00;
  border-radius: 30px;
  font-size: 0.35rem;
  color: #f00;
  background: #fff;
  padding: 1px 12px;
  margin-bottom: 15px;
}
.more{
  height: 4.1rem;
  text-align: center;
  background: #ddd;
  float: left;
  position: relative;
  padding-top: 0.5rem;
  width: 3rem;
  box-shadow: 0 0 2px 1px #e6e6e6;
  border-radius: 0.1rem;
  margin-left: 0.3rem;
  margin-bottom: 0.3rem;
  font: 0.35rem "YaHei";
  color: #888;
  line-height: 3.4rem;
}
</style>
