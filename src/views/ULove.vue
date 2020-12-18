<template>
  <div class="ul">
   <p class="title"><span class="heart">♥</span>猜你喜欢</p>
    <router-link to="/" class="box" v-for="(p,i) in product" :key="i" >
      <img class="imgbox" :src="`${p.img_small}`" alt="" />
      <p class="good_title">{{p.name}}</p>
      <button class="sm_btn" >波奇豆抵5%</button><button  class="sm_btn">加价换购</button>
      <span class="price">￥{{p.price}}<span class="vip"></span><span class="vip_price">￥{{(p.price*0.85).toFixed(2)}}</span></span>
      <div class="selled">已售　{{p.sold_count}} </div><div class="car"></div>
    </router-link>
  </div>
</template>
<style >
.ul .box {
  width: 42%;
  border: 1px solid #eee;
  margin-top: 8px;
  margin-left: 3% ;
  padding:5px;
  float: left;
  /* text-align: center; */
}

.ul .title {
  text-align: center;
  color: rgb(255, 92, 105);
  font: 24px "微软雅黑";
}
.ul .heart {
  font-size: 28px;
  margin: 0 3px;
}
.ul .imgbox {
  width: 100%;
}
.ul .good_title{
  font: 14px "微软雅黑";
  color: #444;
}
.ul .sm_btn {
  font-size: 10px;
  color: rgb(255, 90, 0);
  border: 1px solid rgb(255, 90, 0);
  border-radius: 30px;
  line-height: 12px;
  margin:  8px 4px ;
  background: #fff;
  padding: 2px 5px;
}
.ul .price{
  display: block;
  margin-left: 3px;
  /* text-align: center; */
  color: #f51;
  font: 18px "微软雅黑";
}
.ul .vip{
  display: inline-block;
  width: 18px;
  height: 18px;
  background: #000;
  border-radius:3px ;
  text-align: center;
  line-height: 18px;
  margin:  0 0 0 0.3rem;
}
.ul .v{
  width: 68%;
}
.ul .vip_price{
  font: 10px "微软雅黑";
  color: #444;
}
.ul .selled{
  display: inline-block;
  color: #aaa;
  font: 10px "微软雅黑";
  padding: 8px 4px;
}
.ul .car{
  /* display: inline-block; */
  width: 25px;
  height: 25px;
 background: rgb(255, 231, 231);
 text-align: center;
 float: right;
 border-radius: 3px;
}
.ul .caricon{
  margin-top: 3px;
}
</style>
<script>
export default {
  data(){
    return{
      product:[]
    }
  },
  mounted(){
    this.axios.get('/ulove').then(res=>{
      this.product=res.data.results;
      console.log(this.product)
    })
  }
}
</script>