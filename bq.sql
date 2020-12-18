set names utf8;
drop database if exists `bq`;
create database `bq` charset=utf8;
use `bq`;
-- ------------------
-- 用户信息表
-- ------------------
create table `bq_user`(
  `uid` int(11) primary key NOT NULL auto_increment comment 'id',
  `uname` varchar(32) unique NOT NULL comment '用户名',
  `upwd` varchar(32) NOT NULL comment '密码',
  `phone` varchar(16) NOT NULL comment '手机号',
  `avatar` varchar(128) NULL DEFAULT 'img/avatar/10.jpg' comment '用户头像',
  `nickname` varchar(32) NOT NULL comment '昵称',
  `gender` int(11) NOT NULL comment '性别'
);
insert into `bq_user` values(1,'dingding','12345678','13511011000','img/avatar/1.jpg','黑色纯牛M奶',1);
insert into `bq_user` values(2,'dangdang','12345678','13611011000','img/avatar/2.jpg','最爱Kitty',0);
insert into `bq_user` values(3,'doudou','12345678','13711011000','img/avatar/3.jpg','吃草莓要吐籽',1);
insert into `bq_user` values(4,'yaya','12345678','13811011000','img/avatar/4.jpg','没表有时间',0);
insert into `bq_user` values(5,'tiaotiao','12345678','13911011000','img/avatar/5.jpg','跳跳最米粒',1);
insert into `bq_user` values(6,'younijiejie','12345678','13111011000','img/avatar/10.jpg','Youni姐姐',0);
insert into `bq_user` values(7,'kelisiwu','12345678','13211011000','img/avatar/17.jpg','克里斯吴',1);
insert into `bq_user` values(8,'bingbing','12345678','13311011000','img/avatar/12.jpg','Bing真的超级可爱',0);
insert into `bq_user` values(9,'mmchongwu','12345678','13411011000','img/avatar/15.jpg','萌哒宠物君',1);
insert into `bq_user` values(10,'xiongxiong','12345678','13661011000','img/avatar/16.jpg','晚安小熊熊',0);
insert into `bq_user` values(11,'guaiwuwuwu','12345678','13991011000','img/avatar/18.jpg','我是个怪物',1);
insert into `bq_user` values(12,'maoguantou','12345678','13991011000','img/avatar/19.jpg','过期猫罐头',1);
UPDATE `bq_user` SET upwd = MD5(upwd);

-- -----------------
-- 用户订单表
-- -----------------
create table `bq_order`(
  `aid` INT(11) NOT NULL auto_increment,
  `user_id` INT(11) NOT NULL comment '用户id',
  `status` INT(11) NOT NULL comment '订单状态 1-等待付款 2-等待发货 3-运输中 4-已签收 5-已取消',
  `order_time` INT NOT NULL comment '下单时间',
  `pay_time` INT NOT NULL comment '付款时间',
  `deliver_time` INT NOT NULL comment '发货时间',
  `received_time` INT NOT NULL comment '签收时间',
  PRIMARY KEY  (`aid`)
);
insert into `bq_order` values(1,5,4,1607345490,1607345590,1607345690,1607431890);
insert into `bq_order` values(2,2,4,1607445890,1607531890,1607641890,1607761890);
insert into `bq_order` values(3,1,4,1607855890,1607891890,1607931890,1608031890);
insert into `bq_order` values(4,3,4,1608166890,1608231890,1608261890,1608301890);
insert into `bq_order` values(5,4,4,1608377890,1608398901,1608422890,1608531890);
insert into `bq_order` values(6,8,4,1608357890,1608398902,1608422890,1608531890);
insert into `bq_order` values(7,9,4,1608577890,1608398909,1608422890,1608531890);
insert into `bq_order` values(8,7,4,1608357890,1608398950,1608422890,1608531890);


-- ------------------
-- 用户收货地址表
-- ------------------
CREATE TABLE `bq_receiver_address` (
  `aid` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL comment '用户id',
  `receiver` varchar(16) NOT NULL comment '收货人姓名',
  `province` varchar(16) NOT NULL comment '省',
  `city` varchar(16) NOT NULL comment '市',
  `county` varchar(16) NOT NULL comment '县/区',
  `address` varchar(128) NOT NULL comment '详细地址',
  `phone` varchar(11) NOT NULL comment '收货人手机号',
  `postcode` int(11) NOT NULL comment '邮编',
  `tag` varchar(10) NULL comment '标签名',
  `is_default` tinyint(1) NOT NULL comment '是否为默认地址 1-是 0-否',
  PRIMARY KEY  (`aid`)
); 
INSERT INTO `bq_receiver_address` VALUES(1,1,'丁小丁','广东省','深圳市','龙华区','民治街道嘉熙业广场11楼1155达内','13511011000',518000,'学校',1);
INSERT INTO `bq_receiver_address` VALUES(2,2,'当当喵','广东省','深圳市','龙华区','民治街道嘉熙业广场11楼1155达内','13611011000',518000,'学校',0);
INSERT INTO `bq_receiver_address` VALUES(3,3,'窦志强','广东省','深圳市','龙华区','民治街道嘉熙业广场11楼1155达内','13711011000',518000,'学校',0);
INSERT INTO `bq_receiver_address` VALUES(4,4,'秦小雅','广东省','深圳市','龙华区','民治街道嘉熙业广场11楼1155达内','13811011000',518000,'学校',1);
INSERT INTO `bq_receiver_address` VALUES(5,5,'汪小东','广东省','深圳市','龙华区','民治街道嘉熙业广场11楼1155达内','13911011000',518000,'学校',1);

-- ----------------
-- 用户购物车表 
-- ----------------
CREATE TABLE `bq_shopping_cart` (
  `cid` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL comment '用户id',
  `is_check` tinyint(4) NOT NULL comment '是否选中 1-选中 0-未选中',
  `product_id` int(11) NOT NULL comment '商品编号',
  `spec` varchar(64) NOT NULL comment '商品规格',
  `count` int(11) NOT NULL comment '商品数量',
  PRIMARY KEY  (`cid`)
);
INSERT INTO `bq_shopping_cart` VALUES (1,5,1,1,'3kg',1);
INSERT INTO `bq_shopping_cart` VALUES (2,5,0,2,'2.5kg',3);
INSERT INTO `bq_shopping_cart` VALUES (3,1,1,3,'800g',5);
INSERT INTO `bq_shopping_cart` VALUES (4,2,0,4,'1.8kg',4);
INSERT INTO `bq_shopping_cart` VALUES (5,3,1,1,'3kg',2);
INSERT INTO `bq_shopping_cart` VALUES (6,8,1,8,'35g',5);
INSERT INTO `bq_shopping_cart` VALUES (7,10,1,7,'1kg',1);
INSERT INTO `bq_shopping_cart` VALUES (8,6,1,6,'150g',3);


-- ------------------
-- 商品表
-- ------------------
CREATE TABLE `bq_laptop` (
  `lid` int(11) NOT NULL auto_increment,
  `family_id` int(11) NOT NULL comment '商品类别编号',
  `name` varchar(64) NOT NULL comment '商品名称',
  `img_small` varchar(64) NOT NULL comment '商品小图',
  `img_big` varchar(64) NOT NULL comment '商品大图',
  `spec` varchar(64) NOT NULL comment '商品规格',
  `price` DECIMAL(5,1) NOT NULL comment '商品价格',
  `promise` varchar(64) NOT NULL comment '服务说明',
  `sold_count` int(11) NOT NULL comment '已售',
  `details` varchar(1024) NOT NULL comment '商品详情',
  PRIMARY KEY (`lid`)
);
INSERT INTO `bq_laptop` VALUES(1,10,'法国皇家Royal Canin 小型犬离乳期奶糕粮3kg','img/shop/shoppicpath11568013747_thumb.jpg','img/shop/shoppicpath11568013747_y.jpg','3kg',215,'正品保证 25省满99元免运费 7天无忧退换',173393,'<img src="img/shop/shopimg1.jpg"><img src="img/shop/shopimg2.jpg"><img src="img/shop/shopimg3.jpg"><img src="img/shop/shopimg4.jpg"><img src="img/shop/shopimg5.jpg"><img src="img/shop/shopimg6.jpg"><img src="img/shop/shopimg7.jpg"><img src="img/shop/shopimg8.jpg"><img src="img/shop/shopimg9.jpg"><img src="img/shop/shopimg10.jpg"><img src="img/shop/shopimg11.jpg">'
);
INSERT INTO `bq_laptop` VALUES(2,20,'怡亲Yoken 深海鱼幼猫粮 2.5kg','img/shop/shoppicpath11592224785_thumb.jpg','img/shop/shoppicpath11592224785_y.jpg','2.5kg',69,'正品保证 25省满99元免运费 7天无忧退换',590339,'<img src="img/shop/shopimg12.jpg"><img src="img/shop/shopimg13.jpg"><img src="img/shop/shopimg14.jpg"><img src="img/shop/shopimg15.jpg"><img src="img/shop/shopimg16.jpg"><img src="img/shop/shopimg17.jpg"><img src="img/shop/shopimg18.jpg"><img src="img/shop/shopimg19.jpg"><img src="img/shop/shopimg20.jpg"><img src="img/shop/shopimg21.jpg"><img src="img/shop/shopimg22.jpg">');
INSERT INTO `bq_laptop` VALUES(3,30,'Minishow 迷你秀仓鼠盛宴营养鼠粮800g','img/shop/shoppicpath11561519928_thumb.jpg','img/shop/shoppicpath11561519928_y.jpg','800g',13,'正品保证 25省满99元免运费 7天无忧退换',335253,'<img src="img/shop/shopimg23.jpg"><img src="img/shop/shopimg24.jpg"><img src="img/shop/shopimg25.jpg"><img src="img/shop/shopimg26.jpg"><img src="img/shop/shopimg27.jpg"><img src="img/shop/shopimg28.jpg"><img src="img/shop/shopimg29.jpg"><img src="img/shop/shopimg30.jpg"><img src="img/shop/shopimg31.jpg"><img src="img/shop/shopimg32.jpg"><img src="img/shop/shopimg33.jpg"><img src="img/shop/shopimg34.jpg"><img src="img/shop/shopimg35.jpg"><img src="img/shop/shopimg36.jpg"><img src="img/shop/shopimg37.jpg"><img src="img/shop/shopimg38.jpg"><img src="img/shop/shopimg39.jpg"><img src="img/shop/shopimg40.jpg">');
INSERT INTO `bq_laptop` VALUES(4,10,'BOTH N3小型犬成犬粮全价犬粮 1.8kg','img/shop/shoppicpath11552992571_thumb.jpg','img/shop/shoppicpath11552992571_y.jpg','1.8kg',79,'正品保证 25省满99元免运费 7天无忧退换',19191,'<img src="img/shop/shopimgFile1552992589.jpg"><img src="img/shop/shopimgFile1552992590.jpg"><img src="img/shop/shopimgFile1552992592.jpg"><img src="img/shop/shopimgFile1552992593.jpg"><img src="img/shop/shopimgFile1552992595.jpg"><img src="img/shop/shopimgFile1552992596.jpg"><img src="img/shop/shopimgFile1552992598.jpg"><img src="img/shop/shopimgFile1552992600.jpg"><img src="img/shop/shopimgFile1552992601.jpg"><img src="img/shop/shopimgFile1552992603.jpg"><img src="img/shop/shopimgFile1552992604.jpg"><img src="img/shop/shopimgFile1552992606.jpg"><img src="img/shop/shopimgFile1552992607.jpg"><img src="img/shop/shopimgFile1552992609.jpg"><img src="img/shop/shopimgFile1552992610.jpg"><img src="img/shop/shopimgFile1552992612.jpg">');
INSERT INTO `bq_laptop` VALUES(5,20,'法国皇家Royal Canin 室内成猫猫粮 2kg','img/shop/shoppicpath11566290878_thumb.jpg','img/shop/shoppicpath11566290878_y.jpg','2kg',136,'正品保证 25省满99元免运费 7天无忧退换',1044260,'<img src="img/shop/shopimgFile1590485744.jpg"><img src="img/shop/shopimgFile1590485746.jpg"><img src="img/shop/shopimgFile1590485747.jpg"><img src="img/shop/shopimgFile1590485749.jpg"><img src="img/shop/shopimgFile1590485750.jpg"><img src="img/shop/shopimgFile1590485752.jpg"><img src="img/shop/shopimgFile1590485754.jpg"><img src="img/shop/shopimgFile1590485755.jpg"><img src="img/shop/shopimgFile1590485757.jpg"><img src="img/shop/shopimgFile1590485758.jpg"><img src="img/shop/shopimgFile1590485760.jpg">');
INSERT INTO `bq_laptop` VALUES(6,40,'聚宝源 锦鲤金鱼通用鱼粮育成2mm颗粒 150g','img/shop/shoppicpath11561528991_y.jpg','img/shop/shoppicpath11561528991_y.jpg','150g',9.9,'正品保证 25省满99元免运费 7天无忧退换',15486,'<img src="img/shop/shopimgFile1588666315.jpg"><img src="img/shop/shopimgFile1588666317.jpg"><img src="img/shop/shopimgFile1588666318.jpg"><img src="img/shop/shopimgFile1588666320.jpg"><img src="img/shop/shopimgFile1588666321.jpg"><img src="img/shop/shopimgFile1588666323.jpg"><img src="img/shop/shopimgFile1588666324.jpg"><img src="img/shop/shopimgFile1588666325.jpg"><img src="img/shop/shopimgFile1588666327.jpg"><img src="img/shop/shopimgFile1588666328.jpg"><img src="img/shop/shopimgFile1588666330.jpg"><img src="img/shop/shopimgFile1588666331.jpg"><img src="img/shop/shopimgFile1588666333.jpg">');
INSERT INTO `bq_laptop` VALUES(7,30,'NEW AGE纽安吉经典幼兔粮1KG 替代乳配方','img/shop/shoppicpath11586933318_thumb.jpg','img/shop/shoppicpath11586933318_y.jpg','1kg',15,'正品保证 25省满99元免运费 7天无忧退换',36921,'<img src="img/shop/shopimgFile1587716377.jpg"><img src="img/shop/shopimgFile1562585195.jpg"><img src="img/shop/shopimgFile1562585197.jpg"><img src="img/shop/shopimgFile1562585198.jpg"><img src="img/shop/shopimgFile1562585200.jpg"><img src="img/shop/shopimgFile1562585201.jpg"><img src="img/shop/shopimgFile1562585203.jpg">');
INSERT INTO `bq_laptop` VALUES(8,20,'路斯 三文鱼肉丁 35g 美毛亮毛猫零食','img/shop/shoppicpath11538215767_thumb.jpg','img/shop/shoppicpath11538215767_y.jpg','35g',9.9,'正品保证 25省满99元免运费 7天无忧退换',199802,'<img src="img/shop/shopimgFile1538215786.jpg"><img src="img/shop/shopimgFile1538215787.jpg"><img src="img/shop/shopimgFile1538215788.jpg"><img src="img/shop/shopimgFile1538215790.jpg"><img src="img/shop/shopimgFile1538215791.jpg"><img src="img/shop/shopimgFile1538215793.jpg"><img src="img/shop/shopimgFile1538215794.jpg"><img src="img/shop/shopimgFile1538215796.jpg"><img src="img/shop/shopimgFile1538215797.jpg"><img src="img/shop/shopimgFile1538215798.jpg"><img src="img/shop/shopimgFile1538215800.jpg"><img src="img/shop/shopimgFile1538215801.jpg">');
INSERT INTO `bq_laptop` VALUES(9,10,'伯纳天纯 鸡肉樱桃配方小型犬成犬粮 1.5kg','img/shop/shoppicpath11585727548_thumb.jpg','img/shop/shoppicpath11585727548_y.jpg','1.5kg',89,'正品保证 25省满99元免运费 7天无忧退换',132362,'<img src="img/shop/shopimgFile1597200729.jpg"><img src="img/shop/shopimgFile1597200731.jpg"><img src="img/shop/shopimgFile1597200732.jpg"><img src="img/shop/shopimgFile1597200734.jpg"><img src="img/shop/shopimgFile1597200735.jpg"><img src="img/shop/shopimgFile1597200737.jpg"><img src="img/shop/shopimgFile1597200738.jpg"><img src="img/shop/shopimgFile1597200739.jpg"><img src="img/shop/shopimgFile1597200741.jpg"><img src="img/shop/shopimgFile1597200742.jpg"><img src="img/shop/shopimgFile1597200744.jpg"><img src="img/shop/shopimgFile1597200745.jpg"><img src="img/shop/shopimgFile1597200747.jpg"><img src="img/shop/shopimgFile1597200748.jpg"><img src="img/shop/shopimgFile1597200751.jpg"><img src="img/shop/shopimgFile1597200753.jpg"><img src="img/shop/shopimgFile1597200754.jpg">');
INSERT INTO `bq_laptop` VALUES(10,20,'伟嘉 海洋鱼味低盐清淡成猫粮 1.3kg','img/shop/shoppicpath11582092651_thumb.jpg','img/shop/shoppicpath11582092651_y.jpg','1.3kg',42.9,'正品保证 25省满99元免运费 7天无忧退换',164165,'<img src="img/shop/shopimgFile1582092703.jpg"><img src="img/shop/shopimgFile1582092709.jpg"><img src="img/shop/shopimgFile1582092716.jpg"><img src="img/shop/shopimgFile1582092725.jpg"><img src="img/shop/shopimgFile1582092731.jpg"><img src="img/shop/shopimgFile1582092738.jpg"><img src="img/shop/shopimgFile1582092744.jpg"><img src="img/shop/shopimgFile1582092751.jpg"><img src="img/shop/shopimgFile1582092758.jpg"><img src="img/shop/shopimgFile1582092546.jpg">');
INSERT INTO `bq_laptop` VALUES(11,20,'法国皇家Royal Canin 孕猫及12个月以下幼猫粮 2kg','img/shop/shoppicpath11566292134_thumb.jpg','img/shop/shoppicpath11566292134_y.jpg','2kg',129,'正品保证 25省满99元免运费 7天无忧退换',897206,'<img src="img/shop/shopimgFile1590561517.jpg"><img src="img/shop/shopimgFile1590561518.jpg"><img src="img/shop/shopimgFile1590561520.jpg"><img src="img/shop/shopimgFile1590561521.jpg"><img src="img/shop/shopimgFile1590561523.jpg"><img src="img/shop/shopimgFile1590561524.jpg"><img src="img/shop/shopimgFile1590561526.jpg"><img src="img/shop/shopimgFile1590561528.jpg"><img src="img/shop/shopimgFile1590561529.jpg"><img src="img/shop/shopimgFile1590561531.jpg"><img src="img/shop/shopimgFile1590561532.jpg">');
INSERT INTO `bq_laptop` VALUES(12,10,'冠能Proplan 中型犬幼犬粮 12kg 鸡肉>40%','img/shop/shoppicpath11592474384_thumb.jpg','img/shop/shoppicpath11592474384_y.jpg','12kg',609,'正品保证 25省满99元免运费 7天无忧退换',12600,'<img src="img/shop/shopimgFile1592474407.jpg"><img src="img/shop/shopimgFile1592474408.jpg"><img src="img/shop/shopimgFile1592474410.jpg"><img src="img/shop/shopimgFile1592474411.jpg"><img src="img/shop/shopimgFile1592474413.jpg"><img src="img/shop/shopimgFile1592474414.jpg"><img src="img/shop/shopimgFile1592474416.jpg"><img src="img/shop/shopimgFile1592474417.jpg"><img src="img/shop/shopimgFile1592474420.jpg"><img src="img/shop/shopimgFile1592474423.jpg">');
INSERT INTO `bq_laptop` VALUES(13,10,'比瑞吉 比熊专用成犬粮 2kg','img/shop/shoppicpath11593496624_thumb.jpg','img/shop/shoppicpath11593496624_y.jpg','2kg',160,'正品保证 25省满99元免运费 7天无忧退换',34381,'<img src="img/shop/shopimgFile1593496668.jpg"><img src="img/shop/shopimgFile1593496670.jpg"><img src="img/shop/shopimgFile1593496671.jpg"><img src="img/shop/shopimgFile1593496673.jpg"><img src="img/shop/shopimgFile1593496674.jpg"><img src="img/shop/shopimgFile1593496676.jpg"><img src="img/shop/shopimgFile1593496677.jpg"><img src="img/shop/shopimgFile1593496679.jpg"><img src="img/shop/shopimgFile1593496680.jpg"><img src="img/shop/shopimgFile1593496682.jpg"><img src="img/shop/shopimgFile1593496683.jpg"><img src="img/shop/shopimgFile1593496685.jpg"><img src="img/shop/shopimgFile1593496687.jpg"><img src="img/shop/shopimgFile1593496688.jpg">');
INSERT INTO `bq_laptop` VALUES(14,20,'佩玛思特 美毛理想体态成猫粮 2kg 33%粗蛋白质','img/shop/shoppicpath11562051840_thumb.jpg','img/shop/shoppicpath11562051840_y.jpg','2kg',135,'正品保证 25省满99元免运费 7天无忧退换',45612,'<img src="img/shop/shopimgFile1562051878.jpg"><img src="img/shop/shopimgFile1562051879.jpg"><img src="img/shop/shopimgFile1562051881.jpg"><img src="img/shop/shopimgFile1562051882.jpg"><img src="img/shop/shopimgFile1562051884.jpg"><img src="img/shop/shopimgFile1562051886.jpg"><img src="img/shop/shopimgFile1562051887.jpg"><img src="img/shop/shopimgFile1562051889.jpg"><img src="img/shop/shopimgFile1562051890.jpg"><img src="img/shop/shopimgFile1562051891.jpg">');
INSERT INTO `bq_laptop` VALUES(15,30,'纽安吉NEW AGE 全日蔬果美毛龙猫粮 800g','img/shop/shoppicpath11565753993_thumb.jpg','img/shop/shoppicpath11565753993_y.jpg','800g',18.9,'正品保证 25省满99元免运费 7天无忧退换',124056,'<img src="img/shop/shopimgFile1565754013.jpg"><img src="img/shop/shopimgFile1565754015.jpg"><img src="img/shop/shopimgFile1565754016.jpg"><img src="img/shop/shopimgFile1565754018.jpg"><img src="img/shop/shopimgFile1565754019.jpg"><img src="img/shop/shopimgFile1565754020.jpg"><img src="img/shop/shopimgFile1565754022.jpg">');
INSERT INTO `bq_laptop` VALUES(16,30,'New Age经典配方龙猫粮饲料1kg','img/shop/shoppicpath11586934250_thumb.jpg','img/shop/shoppicpath11586934250_y.jpg','1kg',17.5,'正品保证 25省满99元免运费 7天无忧退换',545610,'<img src="img/shop/shopimgFile1468892261.jpg"><img src="img/shop/shopimgFile1468892263.jpg"><img src="img/shop/shopimgFile1468892264.jpg"><img src="img/shop/shopimgFile1468892266.jpg"><img src="img/shop/shopimgFile1468892267.jpg"><img src="img/shop/shopimgFile1468892269.jpg"><img src="img/shop/shopimgFile1468892270.jpg"><img src="img/shop/shopimgFile1468892271.jpg"><img src="img/shop/shopimgFile1468892272.jpg"><img src="img/shop/shopimgFile1468892285.jpg"><img src="img/shop/shopimgFile1468892286.jpg"><img src="img/shop/shopimgFile1468892288.jpg">');
INSERT INTO `bq_laptop` VALUES(17,30,'哈姆小宠 宠物兔子龙猫豚鼠松鼠消臭除臭吸水桦木粒垫料垫材替木屑','img/shop/shoppicpath11562827637_thumb.jpg','img/shop/shoppicpath11562827637_y.jpg','2500g',16,'正品保证 25省满99元免运费 7天无忧退换',16170,'<img src="img/shop/shopimgFile1473154001.jpg"><img src="img/shop/shopimgFile1473154003.jpg"><img src="img/shop/shopimgFile1473154004.jpg"><img src="img/shop/shopimgFile1473154005.jpg"><img src="img/shop/shopimgFile1473154006.jpg"><img src="img/shop/shopimgFile1473154007.jpg"><img src="img/shop/shopimgFile1473154009.jpg"><img src="img/shop/shopimgFile14731540010.jpg"><img src="img/shop/shopimgFile14731540011.jpg"><img src="img/shop/shopimgFile14731540012.jpg"><img src="img/shop/shopimgFile14731540013.jpg">');
INSERT INTO `bq_laptop` VALUES(18,10,'法国皇家Royal Canin A3优选全犬种幼犬粮 8kg','img/shop/shoppicpath11567417979_thumb.jpg','img/shop/shoppicpath11567417979_y.jpg','8kg',217,'正品保证 25省满99元免运费 7天无忧退换',194898,'<img src="img/shop/shopimgFile1569569727.jpg"><img src="img/shop/shopimgFile1569569728.jpg"><img src="img/shop/shopimgFile1569569730.jpg"><img src="img/shop/shopimgFile1569569731.jpg"><img src="img/shop/shopimgFile1569569732.jpg"><img src="img/shop/shopimgFile1569569734.jpg"><img src="img/shop/shopimgFile1569569735.jpg"><img src="img/shop/shopimgFile1569569737.jpg"><img src="img/shop/shopimgFile1569569738.jpg"><img src="img/shop/shopimgFile1569569739.jpg"><img src="img/shop/shopimgFile1569569741.jpg"><img src="img/shop/shopimgFile1569569742.jpg"><img src="img/shop/shopimgFile1569569744.jpg"><img src="img/shop/shopimgFile1569569745.jpg">');
INSERT INTO `bq_laptop` VALUES(19,30,'纽安吉 仓鼠全日综合营养粮 800g','img/shop/shoppicpath11565754113_thumb.jpg','img/shop/shoppicpath11565754113_y.jpg','800g',21,'正品保证 25省满99元免运费 7天无忧退换',308306,'<img src="shopimgFile1565754132.jpg"><img src="shopimgFile1565754134.jpg"><img src="shopimgFile1565754135.jpg"><img src="shopimgFile1565754136.jpg"><img src="shopimgFile1565754138.jpg"><img src="shopimgFile1565754139.jpg"><img src="shopimgFile1565754140.jpg">');
INSERT INTO `bq_laptop` VALUES(20,10,'卡比 全阶系列全犬粮原味配方狗粮 44磅','img/shop/shoppicpath11585049799_thumb.jpg','img/shop/shoppicpath11585049799_y.jpg','19.96kg',859,'正品保证 25省满99元免运费 7天无忧退换',9341,'<img src="img/shop/shopimgFile1586319007.jpg"><img src="img/shop/shopimgFile1586319009.jpg"><img src="img/shop/shopimgFile1586319010.jpg"><img src="img/shop/shopimgFile1586319005.jpg"><img src="img/shop/shopimgFile1586319012.jpg"><img src="img/shop/shopimgFile1586319013.jpg"><img src="img/shop/shopimgFile1586319015.jpg"><img src="img/shop/shopimgFile1586319016.jpg"><img src="img/shop/shopimgFile1586319018.jpg"><img src="img/shop/shopimgFile1586319019.jpg"><img src="img/shop/shopimgFile1586319021.jpg"><img src="img/shop/shopimgFile1586319022.jpg"><img src="img/shop/shopimgFile1586319024.jpg">');

-- ------------------
-- 商品类别表
-- ------------------
CREATE TABLE `bq_laptop_family` (
  `fid` int NOT NULL KEY auto_increment,
  `family_id` int(11) NOT NULL comment '商品类别编号',
  `f_name` varchar(32) NOT NULL comment '类别名称'
);
INSERT INTO `bq_laptop_family` VALUES (1,10,'狗狗');
INSERT INTO `bq_laptop_family` VALUES (2,20,'猫猫');
INSERT INTO `bq_laptop_family` VALUES (3,30,'小宠');
INSERT INTO `bq_laptop_family` VALUES (4,40,'水族');

-- -----------------
-- 论坛表
-- -----------------
CREATE TABLE `bq_forum` (
  `id` INT NOT NULL KEY auto_increment comment '帖子id',
  `user_id` INT NOT NULL comment '用户id',
  `nickname` VARCHAR(32) NOT NULL comment '昵称',
  `avatar` VARCHAR(32) NULL DEFAULT 'img/avatar/10.jpg' comment '用户头像',
  `content` VARCHAR(1024) NOT NULL comment '帖子内容',
  `image` VARCHAR(256) NOT NULL comment '帖子图片',
  `time` INT NOT NULL comment '发表时间',
  `browse` INT NOT NULL comment '浏览次数',
  `place` VARCHAR(16) NULL comment '发表地点',
  `mount` INT NULL DEFAULT 0 comment '评论数',
  `like_mount` INT NULL DEFAULT 0 comment '点赞数',
  `concern` SMALLINT NULL DEFAULT 0 comment '是否被关注 1-已关注 0-未关注',
  `give_like` SMALLINT NULL DEFAULT 0 comment '是否被点赞 1-已点赞 0-未点赞'
);
INSERT INTO `bq_forum` VALUES(1,5,'跳跳最米粒','img/avatar/5.jpg','暖冬必备之小奶狗，作为铲屎官我们和狗狗之间可以说是相互陪伴相互依赖的关系，我们是他们最温暖的港湾，最坚强的后盾，小狗也是我们最忠诚，最可靠的伙伴','<img src="img/forum/1.jpg"><img src="img/forum/2.jpg"><img src="img/forum/3.jpg">',1607600974,70737,'广东省 深圳市',2,7,0,0);
INSERT INTO `bq_forum` VALUES(2,1,'黑色纯牛M奶','img/avatar/1.jpg','嗯，多吃点肉肉、多囤点膘才好过冬呀','<img src="img/forum/4.jpg"><img src="img/forum/5.jpg"><img src="img/forum/6.jpg"><img src="img/forum/7.jpg"><img src="img/forum/8.jpg">',1607601817,81266,'上海市 崇明区',1,23,0,0);
INSERT INTO `bq_forum` VALUES(3,2,'最爱Kitty','img/avatar/2.jpg','大哥的小剧场：这是什么？待我闻闻 嗯没有味道 咬咬看呢？哼不好吃呢 妈 这个无用的东西我不要 你拿走吧','<img src="img/forum/9.jpg"><img src="img/forum/10.jpg"><img src="img/forum/11.jpg">',1607602364,51482,'上海市 浦东新区',1,41,0,0);
INSERT INTO `bq_forum` VALUES(4,3,'吃草莓要吐籽','img/avatar/3.jpg','昨晚小区狗友在小区里遛狗时，看到了一只四处晃悠的博美。看身上有剪毛的痕迹，应该是有主人的。她发到了小区宠物群里，但是我们都不认识这只狗，应该是小区外的。大家自发在附近的几个宠物群里问了一圈，都不认识。狗友给小博美拿了点狗粮吃，先收留着。今天再送到了附近宠物医院，医院也帮忙发文，希望尽快找到他的主人。冬天来了，室外气温低，狗狗万一跑丟流浪在外了，生命堪忧，尤其是毛发抗寒能力弱的狗狗。各位主人一定要看管好自己的狗狗呀。','<img src="img/forum/12.jpg"><img src="img/forum/13.jpg"><img src="img/forum/14.jpg">',1607602814,57510,'浙江省 宁波市',1,100,1,1);
INSERT INTO `bq_forum` VALUES(5,4,'没表有时间','img/avatar/4.jpg','大佬，你明白我的意思吗？ 大佬：我懂 真的是贴心的小猫咪','<img src="img/forum/15.jpg"><img src="img/forum/16.jpg"><img src="img/forum/38.jpg">',1607603157,62038,'河南省 南阳市',2,20,0,1);
INSERT INTO `bq_forum` VALUES(6,10,'晚安小熊熊','img/avatar/16.jpg','喵...这就是朕的江山！','<img src="img/forum/17.jpg"><img src="img/forum/18.jpg"><img src="img/forum/19.jpg">',1607739164,56912,'广东省 广州市',2,66,0,0);
INSERT INTO `bq_forum` VALUES(7,8,'Bing真的超级可爱','img/avatar/12.jpg','据说狗狗有木有犯错，只要看它的耳朵就知道了！','<img src="img/forum/20.jpg"><img src="img/forum/21.jpg"><img src="img/forum/22.jpg">',1607739611,34567,'浙江省 杭州市',1,16,0,0);
INSERT INTO `bq_forum` VALUES(8,6,'Youni姐姐','img/avatar/10.jpg','请最可爱的那位同学举一下手。','<img src="img/forum/23.jpg"><img src="img/forum/24.jpg"><img src="img/forum/25.jpg">',1607739938,64578,'广东省 深圳市',5,99,1,1);
INSERT INTO `bq_forum` VALUES(9,7,'克里斯吴','img/avatar/17.jpg','“看我动感光波！biubiubiu！”哈哈哈炒鸡萌！！！被可爱击中了！！！ ​​​​','<img src="img/forum/26.jpg"><img src="img/forum/27.jpg"><img src="img/forum/28.jpg"><img src="img/forum/29.jpg"><img src="img/forum/30.jpg"><img src="img/forum/31.jpg">',1607760846,85213,'山西省 太原市',3,120,0,1);
INSERT INTO `bq_forum` VALUES(10,12,'过期猫罐头','img/avatar/19.jpg','对你而言，你陪它只是一段时间，而对它却是陪你走了自己的一生。','<img src="img/forum/32.jpg"><img src="img/forum/33.jpg"><img src="img/forum/34.jpg"><img src="img/forum/35.jpg"><img src="img/forum/36.jpg"><img src="img/forum/37.jpg">',1607761616,45211,'四川省 成都市',4,232,1,0);

-- -----------------
-- 评论表
-- -----------------
CREATE TABLE `bq_commentary` (
  `cid` INT NOT NULL KEY auto_increment,
  `id` INT NOT NULL comment '帖子id',
  `nickname` VARCHAR(32) NOT NULL comment '昵称',
  `avatar` VARCHAR(32) NULL DEFAULT 'img/avatar/10.jpg' comment '用户头像',
  `com_text` VARCHAR(256) NOT NULL comment '评论内容',
  `com_time` INT NOT NULL comment '评论时间',
  `com_like` SMALLINT NULL DEFAULT 0 comment '是否被点赞 1-已点赞 0-未点赞'
);
INSERT INTO `bq_commentary` VALUES(1,1,'Youni姐姐','img/avatar/10.jpg','狗子可以玩一下',1607603770,0);
INSERT INTO `bq_commentary` VALUES(2,1,'Bing真的超级可爱','img/avatar/12.jpg','被安利啦！谢谢！',1607603908,0);
INSERT INTO `bq_commentary` VALUES(3,2,'萌哒宠物君','img/avatar/15.jpg','这个也太萌了我喜欢瓜娃',1607737127,0);
INSERT INTO `bq_commentary` VALUES(4,3,'晚安小熊熊','img/avatar/16.jpg','好可爱好可爱',1607737396,1);
INSERT INTO `bq_commentary` VALUES(5,4,'克里斯吴','img/avatar/17.jpg','对一定要好好看着自己的狗狗',1607737420,1);
INSERT INTO `bq_commentary` VALUES(6,5,'我是个怪物','img/avatar/18.jpg','这表情，好生动啊',1607737550,1);
INSERT INTO `bq_commentary` VALUES(7,5,'过期猫罐头','img/avatar/19.jpg','偷猫大队集合',1607737678,1);
INSERT INTO `bq_commentary` VALUES(8,6,'黑色纯牛M奶','img/avatar/1.jpg','萌出一脸血！！！',1607739321,1);
INSERT INTO `bq_commentary` VALUES(9,6,'最爱Kitty','img/avatar/2.jpg','表情是真的吗',1607739350,1);
INSERT INTO `bq_commentary` VALUES(10,7,'吃草莓要吐籽','img/avatar/3.jpg','这狗狗好委屈呀',1607739752,1);
INSERT INTO `bq_commentary` VALUES(11,8,'没表有时间','img/avatar/4.jpg','啊啊啊，好阔爱',1607739752,1);
INSERT INTO `bq_commentary` VALUES(12,8,'跳跳最米粒','img/avatar/5.jpg','太可愛啦',1607739752,0);
INSERT INTO `bq_commentary` VALUES(13,8,'我是个怪物','img/avatar/18.jpg','天啊，你的猫和我的好像！',1607739752,0);
INSERT INTO `bq_commentary` VALUES(14,8,'Youni姐姐','img/avatar/10.jpg','越养越胖',1607739752,1);
INSERT INTO `bq_commentary` VALUES(15,8,'吃草莓要吐籽','img/avatar/3.jpg','好乖哈哈哈',1607739789,1);
INSERT INTO `bq_commentary` VALUES(16,9,'萌哒宠物君','img/avatar/15.jpg','太可爱了吧，猫主子抓拍的太到位了简直是绝了，想要撸猫猫',1607739895,0);
INSERT INTO `bq_commentary` VALUES(17,9,'晚安小熊熊','img/avatar/16.jpg','啊哈哈主人抓拍的也是非常的到位了啊，记录猫猫每一个可爱时刻 ',1607739995,1);
INSERT INTO `bq_commentary` VALUES(18,9,'过期猫罐头','img/avatar/19.jpg','我不管猫猫就是这个世上最可爱的动物！',1607749752,0);
INSERT INTO `bq_commentary` VALUES(19,10,'Bing真的超级可爱','img/avatar/12.jpg','这些画面真的好有爱呀，请珍惜它们陪你的这段时光吧！',1607761857,1);
INSERT INTO `bq_commentary` VALUES(20,10,'Youni姐姐','img/avatar/10.jpg','养宠物养着养着已经把宠物当做家人了。',1607761875,1);
INSERT INTO `bq_commentary` VALUES(21,10,'我是个怪物','img/avatar/18.jpg','年龄大了看不得这些，越看这些越想哭，眼泪不值钱',1607761887,0);
INSERT INTO `bq_commentary` VALUES(22,10,'黑色纯牛M奶','img/avatar/1.jpg','宠物确实能给人带来很多的欢乐和慰藉',1607761897,0);