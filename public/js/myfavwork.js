// fixed内容
var huojian=document.querySelector("body>div>a>img");
function dianji(){
    var x=document.body.scrollTop||document.documentElement.scrollTop; 
    var timer=setInterval(function(){
        huojian.src="../image/ht5body/top3.png"; 
        x=x-100; 
        if(x<100){ 
            x=0; 
            window.scrollTo(x,x); 
            clearInterval(timer);
            huojian.src="../image/ht5body/top1.png";  
        } 
        window.scrollTo(x,x); 
    }
        ,"10");         
}
 huojian.onmouseover=function(){
     var huojian=this;
     huojian.src="../image/ht5body/top2.png";
     huojian.style="height:200px;position:fixed;left:1600px;top:500px;animation:huojiandong 0.5s infinite;"
 }
huojian.onmouseout=function(){
    var huojian=this;
    huojian.src="../image/ht5body/top1.png";
    huojian.style.animation="";
}
// 页面初始化加载
function myfavwork(){
    var uid=window.localStorage.getItem("uuuid");
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            var uuu=JSON.parse(xhr.responseText)[0];
            var www=JSON.parse(xhr.responseText)[1];
            uhead.firstElementChild.src=uuu[0].uhead;
            for(var elem of www){
                 ggo.innerHTML+=`<div><div><a href="http://localhost:8080/workshow.html"><img src="${elem.phead}" data-num="${elem.pid}"></a></div><button>移除</button></div>`
            }
            console.dir(www)
        }
    }
    xhr.open("post","/user/mfw",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
}
//删除图片ggo
ggo.onclick=function(e){
    var a=e.target;
    if(a.nodeName==="BUTTON"){
        //获取点击按钮对应的图片img对象
        var duiyinimg=a.previousElementSibling.firstElementChild.firstElementChild;
        //console.dir(a.previousElementSibling.firstElementChild.firstElementChild.src);
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4&&xhr.status==200){
                //alert(xhr.responseText);
                //duiyinimg.parent.removeChild(duiyinimg);
                alert(xhr.responseText);
                //异步删除页眉显示
                duiyinimg.parentElement.parentElement.parentElement.parentElement.removeChild(duiyinimg.parentElement.parentElement.parentElement);
            }
        }
        xhr.open("get","/user/sp?pid="+duiyinimg.getAttribute("data-num"),true);
        xhr.send();            
    }
    //点击图片跳转详情页面
    if(a.nodeName==="IMG"){
        window.localStorage.setItem("pppicture",a.getAttribute("data-num"));
        window.localStorage.getItem("pppicture")
    } 
}