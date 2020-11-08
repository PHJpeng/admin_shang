var qq="";
var tel="";
$(function () {
    var action = "/v1/kefu"
    ajaxWeb(action, null, function(data) {

        if (data.code == "2000") {
            qq=data.data.qq;
            tel=data.data.tel;
            var str="";
           $.each(data.data.list,function (i,obj) {
               str+='<li>';
               str+='<a href="javascript:void(0);" onclick="goView();" style="font-weight: 600">';
               str+=obj.question;
               str+='<em onclick="showContent(this);"></em>';
               str+='</a>';
               str+='<div class="ul2" style="display: none;">';
               str+=obj.answer;
               str+='</div>';
               str+='</li>';
           })
            $("#ulbody").html(str)
        }else {
            // $("#sign").hide();
            // $("#yqd").show();
            alert(data.msg)
        }
    }, 'json');
})
function showContent(obj) {
    var li=$(obj).parents("li");
    $(li).find(".ul2").toggle();
}

function pushQq() {
    if (isAndroid) {
        qqInfo.sendQq(qq);
    } else if (isiOS) {
        window.webkit.messageHandlers.sendQq.postMessage(qq);
    }
}
function pushTel() {
    if (isAndroid) {
        telPhone.sendTel(tel);
    } else if (isiOS) {
        window.webkit.messageHandlers.sendTel.postMessage(tel);
    }
}