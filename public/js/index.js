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