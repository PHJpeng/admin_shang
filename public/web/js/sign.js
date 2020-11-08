var authorization=getParameter("authorization");//token
var continuity=0;
$(function () {
    var action = "/v1/signInfo"
    ajaxWeb(action, {"authorization":authorization}, function(data) {
    	var rows = data.data;
    	if (data.code == "2000") {
    	    var sum="";
            if (rows['summary']<10){
                sum="00"+rows['summary'];
            }else if (rows['summary']<100){
                sum="0"+rows['summary'];
            }else {
                sum=rows['summary']+"";
            }
            var str="";
            for (var i=0;i<sum.length;i++){
                str+='<div  >'+sum.substr(i,1)+'</div>';
            }
            $("#summary").html(str);
            $("#continuity").html(rows.continuity);
            continuity=rows.continuity;
            var liStr="";
            if (rows.continuity>7){
                rows.continuity=7
            }
            for (var i=0;i<rows.continuity;i++){
                if(i<6){
                    liStr+='<li><img src="images/jx.png"></li>';
                }
            }
            for (var i=0;i<6-rows.continuity;i++){
                if(i<6){
                    liStr+='<li><img src="images/jxn.png"></li>';
                }
            }
            liStr+='<li><img class="liwu" src="images/liwu1@2x.png"></li>';
            $("#tsi").html(liStr);
    	}else {
            alert(data.msg)
        }

    }, 'json');
})
var bool=true;
function sign() {

    if(bool==true){
        bool=false;
    }else {
        return false;
    }
    var action = "/v1/signIn"
    ajaxWeb(action, {"authorization":authorization,"continuity":continuity}, function(data) {

        if (data.code == "2000") {
            alert("签到成功")
            window.location.reload();
            bool=true;
        }else {
            // $("#sign").hide();
            // $("#yqd").show();
            alert("今日已签到")
            bool=true;
        }
    }, 'json');
}