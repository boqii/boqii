//加载 Express模块
const express = require('express');
// 加载 CORS模块
const cors = require('cors')
//创建 WEB 服务器
const server = express();
// 加载body-parser 模块 (在 Express 4.5及以上的版本，自带 body-parser )
const bodyParser = require("body-parser")
const md5=require('md5')
// 加载 MySQL 模块
const mysql = require('mysql');
const { parse } = require('path');
// 为所有的 HTTP 请求使用 CORS 模块
server.use(cors({
    origin: ['http://127.0.0.1:8080', 'http://localhost:8080']
}))

server.use(bodyParser.urlencoded({
    extended: false
}))

const pool = mysql.createPool({
    // 数据库服务器的地址
    host: '127.0.0.1',
    // 数据库服务器的端口号
    port: 3306,
    // 数据库服务器的用户名
    user: 'root',
    // 数据库服务器的密码
    password: '',
    // 数据库名称
     database: 'bq',
    // 最大连接数
    connectionLimit: 15
})


 server.get('/ulove', (req, res) => {
     //    查询xzqa_category 数据表的全部记录
     let sql = "SELECT lid,name,img_small,price,sold_count FROM bq_laptop ORDER BY lid";
     // 执行 SQL 查询
     pool.query(sql, (error, results) => {
         if (error) throw error;
         res.send({ code: 200, message: '查询成功', results: results })
     })
 });
 server.get('/forum',(req,res)=>{
   let sql = "SELECT id,nickname,avatar,content,image,browse,like_mount,mount,concern,give_like FROM bq_forum;";
  //  let sql = "SELECT f.id,f.nickname,f.avatar,c.id,c.nickname,com_text,content,image,browse,like_mount,mount,concern,give_like FROM bq_forum AS f INNER JOIN bq_commentary AS c ON f.id = c.id;";
      //  sql = 'SELECT r.id,subject,content,created_at,nickname,avatar,article_number FROM xzqa_article AS r INNER JOIN xzqa_author AS u ON author_id = u.id WHERE r.id=?';
   pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ code: 200, message: '查询成功', results: results })
})
 });


 server.post('/register',(req,res)=>{
  let uname = req.body.uname;
  let upwd = req.body.upwd;
  let sql='select count(uid) as count from bq_user where uname=?';
  pool.query(sql,[uname],(error,results)=>{
    if(error) throw error;
    if(results[0].count){
      res.send({code:201,message:"用户注册失败"});
    }else{
      sql="insert into bq_user(uname,upwd) values(?,MD5(?))";
      pool.query(sql,[uname,upwd],(error,results=>{
        if(error) throw error;
        res.send({code:200,message:"用户注册成功"});
      }))
    }
  });
});
server.post('/login',(req,res)=>{
  let uname = req.body.uname;
  let upwd = md5(req.body.upwd);
  console.log(uname,upwd);
  let sql='select uid,uname,phone,avatar,nickname,gender from bq_user where uname=? and upwd=?';
  pool.query(sql,[uname,upwd],(error,results)=>{
    if(error) throw error;
    if(results.length){
      res.send({code:200,message:'登录成功',info:results[0]});
    }else {
      res.send({code:201,message:'登录失败'});
    }
  });
});

server.get('/foot',(req,res)=>{
  let id = req.query.id;
 
  let sql="select family_id,name,img_small,img_big,price from bq_laptop where family_id=10";
  pool.query(sql,(error,result)=>{
    if(error)throw error
    res.send({code:200,result:result})
  })
})
server.get('/foot2',(req,res)=>{
  let id = req.query.id;
 
  let sql="select family_id,name,img_small,img_big,price from bq_laptop where family_id=20";
  pool.query(sql,(error,result)=>{
    if(error)throw error
    res.send({code:200,result:result})
  })
})
server.get('/foot3',(req,res)=>{
  let id = req.query.id;

  let sql="select family_id,name,img_small,img_big,price from bq_laptop where family_id=30";
  pool.query(sql,(error,result)=>{
    if(error)throw error
    res.send({code:200,result:result})
  })
})
server.get('/foot4',(req,res)=>{
  let id = req.query.id;

  let sql="select family_id,name,img_small,img_big,price from bq_laptop where family_id=40";
  pool.query(sql,(error,result)=>{
    if(error)throw error
    res.send({code:200,result:result})
  })
})






//获取所有商品信息
server.get('/goods',(req,res)=>{
  let sql='SELECT lid,name,img_small,price FROM bq_laptop';
  pool.query(sql,(error,results)=>{
  if (error) throw error;
  res.send({code:200,message:'查询成功',results:results});
  })
  })








// // 获取所有的文章分类
// server.get('/category', (req, res) => {
//     // 查询xzqa_category数据表的全部记录
//     let sql = 'SELECT id,category_name FROM xzqa_category ORDER BY id';
//     // 执行SQL查询
//     pool.query(sql, (error, results) => {
//       if (error) throw error;
//       res.send({ code: 200, message: '查询成功', results: results });
//     });
//   });
  
//   // 获取指定分类下包含的文章数据
//   server.get('/articles', (req, res) => {
//     // 获取地址栏URL参数 --- 文章分类ID
//     let id = req.query.id;
//     // 获取地址栏URL参数 --- 页码
//     let page = req.query.page;
//     // 每页显示的记录数量
//     let pagesize = 15;
//     // 根据当前的页码,并且结合LIMIT语句的标准公
//     // 式来计算机出offset参数值
//     let offset = (page - 1) * pagesize;
//     //执行SQL语句,以获取总记录数
//     let sql = 'SELECT COUNT(id) AS count FROM xzqa_article WHERE category_id=?';
  
//     //声明变量，用于存储总记录数
//     let rowcount;
//     pool.query(sql, [id], (error, results) => {
//       if (error) throw error;
//       rowcount = results[0].count;
//       /////////////////////////////////////////////////
//       //计算出总页数
//       let pagecount = Math.ceil(rowcount / pagesize);
//       // 查找特定分类下包含的文章数据
//       sql = 'SELECT id,subject,description,image FROM xzqa_article WHERE category_id=? LIMIT ?,?';
//       // 执行SQL查询
//       pool.query(sql, [id, offset, pagesize], (error, results) => {
//         if (error) throw error;
//         res.send({
//           code: 200,
//           message: "查询成功",
//           results: results,
//           pagecount: pagecount
//         });
//       });
//       /////////////////////////////////////////////////
//     });
//   });
  
//   // 获取指定的文章信息
//   server.get('/review', (req, res) => {
//     // 获取地址栏的URL参数 -- 文章ID
//     let id = req.query.id;
//     // 查询特定记录的SQL语句
//     let sql = 'SELECT r.id,subject,content,created_at,nickname,avatar,article_number FROM xzqa_article AS r INNER JOIN xzqa_author AS u ON author_id = u.id WHERE r.id=?';
  
//     // 执行SQL语句
//     pool.query(sql, [id], (error, results) => {
//       if (error) throw error;
//       res.send({ code: 200, message: "查询成功", result: results[0] });
//     });
//   });
  
//   //获取文章的评论信息接口
//   server.get('/comments', (req, res) => {
//     // 获取文章的ID
//     let id = req.query.id;
//     // 查询的SQL语句
//     let sql = 'SELECT c.id,content,username,avatar,created_at FROM xzqa_comments AS c INNER JOIN xzqa_users AS u  ON user_id = u.id WHERE article_id =  ? ORDER BY c.id LIMIT 5';
//     // 执行SQL查询
//     pool.query(sql, [id], (error, results) => {
//       if (error) throw error;
//       res.send({ code: 200, message: "查询成功", results: results });
//     });
//   });
  
//   //用户注册接口
//   server.post('/register', (req, res) => {
//     //获取用户名和密码信息
//     let username = req.body.username;
//     let password = req.body.password;
//     // 先需要以username为条件进行用户的查找操作
//     let sql = 'SELECT COUNT(id) AS count FROM xzqa_author WHERE username=?';
//     // 执行SQL查询
//     pool.query(sql, [username], (error, results) => {
//       if (error) throw error;
//       if (results[0].count) {
//         res.send({ code: 201, message: "用户注册失败" });
//       } else {
//         // 插入记录的SQL语句
//         sql = 'INSERT INTO xzqa_author(username,password) VALUES(?,?)';
//         // 执行SQL语句
//         pool.query(sql, [username, password], (error, results) => {
//           if (error) throw error;
//           //console.log(results);
//           res.send({ code: 200, message: "用户注册成功" })
//         })
//       }
//     });
//   });
  
// server.get('/user',(req,res)=>{
//     res.send({name:'Diu',sex:false})
// })

  // 指定 WEB服务器监听的端口
  server.listen(3000);
  

