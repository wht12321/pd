//引入express模块
const express=require("express");
//引入自定义的连接池模块pool
const pool=require("../pool.js");
//创建空的路由器对象
var router=express.Router();
//添加路由
    // 注册界面：验证注册用户名是否正确
    router.get("/register_uname_leave",function(req,res){
        if(req.query.uname==""){
            res.send("用户名不能为空");
            return;
        }
        pool.query("select * from pd_user where uname=?",[req.query.uname],function(err,result){
            if(err) throw err;
            if(result.length>0){
                res.send("用户名已被占用");
            }else{
                res.send("正确的用户名");
            }
        });
    });
    //注册界面：验证注册是否注册是否成功
    router.get("/register_user",function(req,res){
        if(req.query.unametishi!="正确的用户名"){
            res.send("请再次确认您的用户名是否正确");
            return;
        }else if(req.query.upwd==""){
            res.send("密码不能为空");
            return;           
        }
        pool.query("INSERT INTO pd_user VALUES(null,?,?,'./image/uhead/moren.jpg',null,null,null,0)",[req.query.uname,req.query.upwd],function(err,result){
            if(err) throw err;
            if(result.affectedRows>0){
                pool.query("select uid from pd_user where uname=?",[req.query.uname],function(err,result){
                    if(err) throw err;
                    res.send(result);       
                })
            }else{
                res.send("注册失败")
            }
        });
    });
    //登录界面：验证是否有匹配字符并登录
    router.get("/signin",function(req,res){
        pool.query("select * from pd_user where uname=? and upwd=?",[req.query.uname,req.query.upwd],function(err,result){
            if(err) throw err;
            if(result.length==0){
                res.send("登录失败，请再次确认您的用户名和密码")
            }else{
                pool.query("select uid from pd_user where uname=?",[req.query.uname],function(err,result){
                    if(err) throw err;
                    res.send(result);       
                })
            }
        });
    });
    //home界面的初始数据获取
    router.post("/sjhq",function(req,res){
        if(req.body.uname=="null"){
            res.send("加载错误");
            return;
        }
        pool.query("SELECT * FROM pd_user WHERE uname=?",[req.body.uname],function(err,result){
			if(err)throw err;
			res.send(result);
			});        
    });  
    //home界面的数据提交修改
    router.post("/newtj",function(req,res){
        pool.query("UPDATE pd_user SET uname=?,upwd=?,question=?,answer=?,usay=? where uname=?",[req.body.uname,req.body.upwd,req.body.question,req.body.answer,req.body.usay,req.body.olduname],function(err,result){
            if(err) throw err;
            if(result.affectedRows>0){
                res.send("修改成功")
            }else{
                res.send("修改失败")
            };       
        });
    });
    //myworks界面的初始数据获取
    router.post("/mws",function(req,res){
        var allll=[];
        pool.query("SELECT uid,uhead FROM pd_user WHERE uname=?",[req.body.uname],function(err,result){
            if(err)throw err;
            allll[0]=result;
            var uid=result[0].uid;
                pool.query("SELECT * FROM pd_picture WHERE uid=?",[uid],function(err,result){
                     allll[1]=result;
                     res.send(allll);
                 })
			});        
    });
    //myworks界面的图片删除
    router.get("/dp",function(req,res){
        pool.query("DELETE FROM pd_picture WHERE pid=?",[req.query.pid],function(err,result){
			if(err)throw err;
            if(result.affectedRows>0){
                res.send("删除成功")
            }else{
                res.send("删除失败")
            };
		}); 
    })  
    //myfavwork界面的初始数据获取
    router.post("/mfw",function(req,res){
        var allll=[];
        pool.query("SELECT uhead FROM pd_user WHERE uid=?",[req.body.uid],function(err,result){
            if(err)throw err;
            allll[0]=result;
            pool.query("SELECT pd_favorites.uid,pd_favorites.pid,pd_picture.phead FROM pd_favorites,pd_picture WHERE pd_favorites.pid=pd_picture.pid AND pd_favorites.uid=?",[req.body.uid],function(err,result){
                if(err)throw err;
                allll[1]=result;
                res.send(allll);
            })
			});        
    });
    //myfavwork界面的图片删除
    router.get("/sp",function(req,res){
        pool.query("DELETE FROM pd_favorites WHERE pid=?",[req.query.pid],function(err,result){
			if(err)throw err;
            if(result.affectedRows>0){
                res.send("删除成功")
            }else{
                res.send("删除失败")
            };
		}); 
    }) 
    //myfavuser界面的初始数据获取
    router.post("/mfu",function(req,res){
        var allll=[];
        pool.query("SELECT uhead FROM pd_user WHERE uid=?",[req.body.uid],function(err,result){
            if(err)throw err;
            allll[0]=result;
            pool.query("SELECT pd_loveuser.loveuid,pd_user.uhead FROM pd_loveuser,pd_user WHERE pd_loveuser.loveuid=pd_user.uid and pd_loveuser.uid=?;",[req.body.uid],function(err,result){
            if(err)throw err;
            allll[1]=result;
            res.send(allll);
            });
			});        
    });
    //myfavuser界面的用户取关
    router.get("/qg",function(req,res){
        pool.query("DELETE FROM pd_loveuser WHERE uid=? and loveuid=?",[req.query.myuid,req.query.loveuid],function(err,result){
			if(err)throw err;
            if(result.affectedRows>0){
                res.send("删除成功")
            }else{
                res.send("删除失败")
            };
		}); 
    })
    //workselect界面的初始数据获取
    router.get("/ws",function(req,res){
        pool.query("SELECT * FROM pd_picture",function(err,result){
            if(err)throw err;
            res.send(result);
            });      
    }); 
    //workselect界面的热门按钮检索数据获取
    router.get("/sws",function(req,res){
        pool.query("SELECT * FROM pd_picture where tag like'%"+req.query.gjc+"%'",function(err,result){
            if(err)throw err;
            res.send(result);
            });
    }); 
    //workshow界面的初始数据获取
    router.get("/showp",function(req,res){
        var allll=[];
        pool.query("SELECT * FROM pd_picture where pid=?",[req.query.pid],function(err,result){
            if(err)throw err;
            allll[0]=result;//图片的全部
            var u=result[0].uid;
             pool.query("SELECT * FROM pd_user where uid=?",[u],function(err,result){
                 if(err)throw err;
                 allll[1]=result;//作者全部
                 pool.query("SELECT * FROM pd_loveuser where loveuid=? and uid=?",[u,req.query.uid],function(err,result){
                    if(err)throw err;
                    allll[2]=(result.length==0?false:true);//自己是否关注
                    pool.query("SELECT * FROM pd_favorites where pid=? and uid=?",[req.query.pid,req.query.uid],function(err,result){
                        if(err)throw err;
                        allll[3]=(result.length==0?false:true);//自己是否收藏
                        res.send(allll);
                    });                       
                 });            
             });
            });
    });
    //workshow界面收藏切换
    router.get("/ss",function(req,res){
            if(req.query.nei!="已收藏"){
              pool.query("INSERT INTO pd_favorites VALUES(?,?)",[req.query.uid,req.query.pid],function(err,result){
                  if(err)throw err;
                  res.send("已收藏");
                  });            
             }else{
              pool.query("DELETE FROM pd_favorites WHERE uid=? and pid=?",[req.query.uid,req.query.pid],function(err,result){
                  if(err)throw err;
                  res.send("+ 收藏");
                  });                 
             }
    });
    //workshow界面关注切换
    router.get("/gg",function(req,res){
        if(req.query.nei!="已关注"){
          pool.query("INSERT INTO pd_loveuser VALUES(?,?)",[req.query.uid,req.query.loveuid],function(err,result){
              if(err)throw err;
              res.send("已关注");
              });            
         }else{
          pool.query("DELETE FROM pd_loveuser WHERE uid=? and loveuid=?",[req.query.uid,req.query.loveuid],function(err,result){
              if(err)throw err;
              res.send("+ 关注");
              });                 
         }
});  
//导出路由器
module.exports=router;