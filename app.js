//引入express模块
const express=require("express");
//引入body-parser模块
const bodyParser=require("body-parser");
//引入自定义路由器
const userRouter=require("./routers/user.js");



//创建web服务器
var server=express();
//监听端口
server.listen(8080);

//挂载静态资源目录文件
server.use(express.static("./public"));
server.use(express.static("./public/public"));



//使用body-parser中间件，转换post请求数据为对象形式
server.use(bodyParser.urlencoded({extended:false}));


//挂载自定义路由器
server.use("/user",userRouter);




