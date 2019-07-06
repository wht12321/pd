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
function myfavuser(){
    var uid=window.localStorage.getItem("uuuid");
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            var uuu=JSON.parse(xhr.responseText)[0][0].uhead;
            var www=JSON.parse(xhr.responseText)[1];
            uhead.firstElementChild.src=uuu;
             for(var elem of www){
                ggo.innerHTML+=`<div><a href="#"><div><img src="${elem.uhead}" data-num="${elem.loveuid}"></div></a><button>取关</button></div>`
             }
            console.dir(www)
        }
    }
    xhr.open("post","/user/mfu",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
}
//取消关注ggo
ggo.onclick=function(e){
    var uid=window.localStorage.getItem("uuuid");
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
        xhr.open("get","/user/qg?loveuid="+duiyinimg.getAttribute("data-num")+"&myuid="+uid,true);
        xhr.send();            
    }
}