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
//文字填充获取
function sjhq(){
    var uname=window.localStorage.getItem("uuuname");
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            if(xhr.responseText=="加载错误"){
                location.replace("http://localhost:8080/index.html");
            }else{
                var uuu=JSON.parse(xhr.responseText)[0];
                uhead.firstElementChild.src=uuu.uhead;
                tangguo.lastElementChild.innerHTML=uuu.candy;
                jianjie.lastElementChild.value=uuu.usay;
                ziliao.firstElementChild.lastElementChild.value=uuu.uname;
                ziliao.firstElementChild.nextElementSibling.lastElementChild.value=uuu.upwd;
                ziliao.firstElementChild.nextElementSibling.nextElementSibling.lastElementChild.value=uuu.question;
                ziliao.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.lastElementChild.value=uuu.answer;               
            }
        }
    }
    xhr.open("post","/user/sjhq",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send("uname="+uname);
}
//按钮跳转
button1.onclick=function(){
    top.location.href="http://localhost:8080/myworks.html";
}
button2.onclick=function(){
    top.location.href="http://localhost:8080/myfavuser.html";
}
button3.onclick=function(){
    top.location.href="http://localhost:8080/myfavwork.html";
}
//修改按钮提交触发
tijiao.onclick=function(){
    var xhr=new XMLHttpRequest();
    var olduname=window.localStorage.getItem("uuuname");
    var uuname=ziliao.firstElementChild.lastElementChild.value;
    var uupwd=ziliao.firstElementChild.nextElementSibling.lastElementChild.value;
    var qquestion=ziliao.firstElementChild.nextElementSibling.nextElementSibling.lastElementChild.value;
    var aanswer=ziliao.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.lastElementChild.value;
    var uusay=jianjie.lastElementChild.value;

    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
        var result=xhr.responseText;
        alert(result);
        if(result=="修改成功"){
            window.localStorage.setItem("uuuname",uuname);
        }
        }
    }
    xhr.open("post","/user/newtj",true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send("olduname="+olduname+"&uname="+uuname+"&upwd="+uupwd+"&question="+qquestion+"&answer="+aanswer+"&usay="+uusay);
}
// 会员触发提示
dianjichufa.onmouseenter=function(){
    chufa.style.opacity=0;
    huiyuantishi.style.opacity=1;
}
dianjichufa.onmouseleave=function(){
    chufa.style.opacity=1;
    huiyuantishi.style.opacity=0;
}