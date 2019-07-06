//引入连接池模块
const mysql=require("mysql");
//创建连接池对象
var pool=mysql.createPool({
    host:"127.0.0.1",
    port:"3306",
    user:"root",
    password:"",
    database:"pd",
    connectionLimit:20
});
//导出自定义的连接池模块
module.exports=pool;