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
function workselect(){
    var uid=window.localStorage.getItem("uuuid");
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            var www=JSON.parse(xhr.responseText);
             for(var elem of www){
                jiansuo.innerHTML+=`<a href="http://localhost:8080/workshow.html"><div><img src="${elem.phead}" data-num="${elem.pid}"></div><div>${elem.pdetail}</div></a>`
             }
            //console.dir(www)
        }
    }
    xhr.open("get","/user/ws",true);
    xhr.send();
}
//关键词按钮
remen.onclick=function(e){
    var a=e.target;
    if(a.nodeName==="A"){
        var gjc=a.innerHTML;
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4&&xhr.status==200){
                var www=JSON.parse(xhr.responseText);
                jiansuo.innerHTML="";
                 for(var elem of www){
                    jiansuo.innerHTML+=`<a href="http://localhost:8080/workshow.html"><div><img src="${elem.phead}" data-num="${elem.pid}"></div><div>${elem.pdetail}</div></a>`
                 }
                //console.dir(www)
            }
        }
        xhr.open("get","/user/sws?gjc="+gjc,true);
        xhr.send();        
        
    }
}
//点击图片跳转详情页面
jiansuo.onclick=function(e){
    var a=e.target; 
    if(a.nodeName==="IMG"){
        window.localStorage.setItem("pppicture",a.getAttribute("data-num"));
        window.localStorage.getItem("pppicture")
    }      
}
