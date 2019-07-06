//右上角第一行：鼠标移入效果
function yinchu(){
    document.getElementById("yin").style.display="block";
}
function chu(){
    document.getElementById("yin").style.display="block"; 
}
//右上角第一行：鼠标移出
function yinhui(){
    var Timer=setTimeout(function(){
        document.getElementById("yin").style.display="none";
        clearTimeout("Timer");
    },2000);
}
function hui(){
    document.getElementById("yin").style.display="none";
}
//退出登录
function gundan(){
    window.localStorage.removeItem("uuuname");
    window.localStorage.removeItem("uuuid");
    top.location.replace("http://localhost:8080/index.html");
}