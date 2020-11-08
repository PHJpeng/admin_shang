var usercode=getParameter("usercode")

var countStart=60;
var countdown=countStart;
var timer;

function sendCode(val) {
    var phone=$("#phone").val();
    if(!/^(1[3-9])\d{9}$/i.test(phone))
    {
        alert("请输正确的手机号");
        return false;
    }
    var action = "/v1/sendcode"
    ajaxWeb(action, {"mobile":phone}, function(data) {

        if (data.code == "2000") {

        }
    }, 'json');
    settime(val);
}
function settime(val) {


    if (countdown == 0) {
        val.removeAttribute("disabled");
        val.value="发送验证码";
        countdown = countStart;
        window.clearTimeout(timer);
        return false;
    } else {
        val.setAttribute("disabled", true);
        val.value="重新发送(" + countdown + ")";
        countdown--;
    }
    setTimeout(function() {
        settime(val)
    },1000)
}
function save() {
    var phone=$("#phone").val();
    if(!/^(1[3-9])\d{9}$/i.test(phone))
    {
        alert("请输正确的手机号");
        return false;
    }
    var code=$("#code").val();
    if (!$.trim(code)){
        alert("请输入验证码");
        return false;
    }
    var pwd=$("#pwd").val();
    if (!$.trim(pwd)){
        alert("请输入密码");
        return false;
    }
    var action = "/v1/enterCode"
    ajaxWeb(action, {"mobile":phone,"pwd":pwd,"code":code,"usercode":usercode}, function(data) {

        if (data.code == "2000") {
            window.location.href="downloadApp.html";
        }else{
            alert(data.msg)
        }
    }, 'json');

}