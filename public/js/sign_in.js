   //背景起始图
   function putbgimg(){
    document.getElementById("bgimg").style="width:100%;height:100%;background-repeat:no-repeat;background-size:100% 100%;background-image:url(../image/ht5body/background/1.jpg)";
}
 
//背景随机图
var imgs =["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg"];//背景图片列表
      function time(){
         var i = Math.floor(Math.random()*13); //0~12随机下标
         document.getElementById("bgimg").style="width:100%;height:100%;background-repeat:no-repeat;background-size:100% 100%;background-image:url(../image/ht5body/background/"+imgs[i];//随机放入图片
      }
setInterval("time()",8000);//8秒一换图

var button1=document.getElementById("button1");
//验证登录是否出错
    button1.onclick=function signin(){
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4&&xhr.status==200){
                signinceshi.innerHTML=xhr.responseText;
                var fanhuizhi=JSON.parse(xhr.responseText);
                if(fanhuizhi!="登录失败，请再次确认您的用户名和密码"){
                    window.localStorage.setItem("uuuname",input1.value);
                    window.localStorage.setItem("uuuid",fanhuizhi[0].uid);
                    location.replace("http://localhost:8080/home.html");
                }
	        }
        }
        xhr.open("get","/user/signin?uname="+input1.value+"&upwd="+input2.value,true);
        xhr.send();
    }
//在密码框回车也触发登录效果
    input2.onkeyup=function(e){
        if(e.keyCode==13){//回车键代表编号13
            button1.onclick();
        }
    }