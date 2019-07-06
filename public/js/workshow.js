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
//页面初始化加载
function workshow(){
    var uid=window.localStorage.getItem("uuuid");
    var pid=window.localStorage.getItem("pppicture");
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            var www=JSON.parse(xhr.responseText);
            //  for(var elem of www){
            //     jiansuo.innerHTML+=`<a href="http://localhost:8080/workshow.html"><div><img src="${elem.phead}" data-num="${elem.pid}"></div><div>${elem.pdetail}</div></a>`
            //  }
            datu.src=www[0][0].phead;
            hd.src=www[1][0].uhead;
            zn.innerHTML=www[1][0].uname;
            sy.innerHTML=www[0][0].pdetail;
            te.innerHTML=www[0][0].uptime;
            if(www[2]==true){
                b1.innerHTML="已关注"
                b1.setAttribute("data-gg",www[1][0].uid)
            }else{
                b1.innerHTML="+ 关注"
                b1.setAttribute("data-gg",www[1][0].uid)
            }
            if(www[3]==true){
                b2.innerHTML="已收藏"
                b2.setAttribute("data-ss",www[0][0].pid)
            }else{
                b2.innerHTML="+ 收藏"
                b2.setAttribute("data-ss",www[0][0].pid)
            }

             //console.dir(www[2]==false)
        }
    }
    xhr.open("get","/user/showp?uid="+uid+"&pid="+pid,true);
    xhr.send();
}
//收藏切换
b2.onclick=function(){
    var uid=window.localStorage.getItem("uuuid");
    var nei=b2.innerHTML;
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            //alert(xhr.responseText);
            //console.dir(xhr.responseText);
            b2.innerHTML=xhr.responseText;
        }
    }
    xhr.open("get","/user/ss?nei="+nei+"&uid="+uid+"&pid="+b2.getAttribute("data-ss"),true);
    xhr.send(); 
}
//关注切换
b1.onclick=function(){
    var uid=window.localStorage.getItem("uuuid");
    var nei=b1.innerHTML;
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            //alert(xhr.responseText);
            //console.dir(xhr.responseText);
            b1.innerHTML=xhr.responseText;
        }
    }
    xhr.open("get","/user/gg?nei="+nei+"&uid="+uid+"&loveuid="+b1.getAttribute("data-gg"),true);
    xhr.send(); 
}