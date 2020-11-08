
/**
 * // 地图接口有用到V1.0接口
 * /api/ucenter/ucenterRepairFactory/getFactoryByNearby
 * 此接口在V1.0不需要穿城市id,获取传入经纬度周围30公里汽修厂
 * V2.0改为输入城市id 和经纬度,返回城市内汽修厂由近到远排序
 * @Author lihy
 * @Date 2018年8月9日14:57:25
 * @Param
 * @return
 **/
// var hfileUrl = "http://hfile.youjiana.com";

// var httpUrl = "http://39.97.190.21";
var httpUrl = "http://home.shangtout.com";


/** 获取通过URL传递的参数，query?name=zhang 使用方法，就是里    var czzt = getParameter("czzt");*/
function getParameter(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    } else {
        return null;
    }
}

var u = navigator.userAgent;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
/**
 * // 调用安卓IOS打电话
 * @Author lihy
 * @Date 10:13 2018/7/31
 * @Param
 * @return
 **/
function callPhone(phone) {
    phone += "";
    if (isAndroid) {
        call.callPhone(phone);
    } else if (isiOS) {
        window.webkit.messageHandlers.callPhone.postMessage({body: phone});
    }
}
function phoneBack(){
    if (isAndroid) {
        backPage.backHtml();
    } else if (isiOS) {
        window.webkit.messageHandlers.backHtml.postMessage({body: ''});
    }
}


/**
 * // 所有图片放大功能
 * @Author lihy
 * @Date 11:04 2018/8/2
 * @Param
 * @return
 **/
$(function () {
    var imgdefereds = [];
    $('img').each(function () {
        var dfd = $.Deferred();
        $(this).bind('load', function () {
            dfd.resolve();
        }).bind('error', function () {
            //图片加载错误，加入错误处理
            // dfd.resolve();
        })
        if (this.complete) setTimeout(function () {
            dfd.resolve();
        }, 1000);
        imgdefereds.push(dfd);
    })
    $.when.apply(null, imgdefereds).done(function () {
        imgInit();
    });
})

function imgInit() {
    $("img").click(function () {
        valSrc = $(this).attr("src");
        if (valSrc.indexOf('http:') == 0 || valSrc.indexOf('https:') == 0) {
            valSrc = valSrc.replace("_255x255", "");
            $("body").append('<div onclick="removeThis(this)" style="width:100%;height:100%;background:rgba(0, 0, 0, 1);top: 0;position: fixed;z-index: 99999">' +
                '<img src="' + valSrc + '" alt="" class="Screenheight" /></div>');
        }
    })
}

function removeThis(thi) {
    $(thi).remove();
}

/**
 * // 视频匹配
 * @Author lihy
 * @Date 11:51 2018/8/2
 * @Param
 * @return
 **/
// var reg = /http:\/\/.*?(gif|png|jpg|jpeg|GIF|PNG|JPG|JPEG)/gi;
var reg = /\.(gif|jpg|jpeg|png|GIF|JPG|PNG|JPEG)$/;

function bigVideo(thi) {
    valSrc = $(thi).attr("src");
    valSrc = valSrc.replace("_255x255", "");
    $("body").append('<div style="width:100%;height:100%;background:rgba(0, 0, 0, 1);top: 0;position: fixed;z-index: 99999"><div class="videoDel" onclick="deleteDiv(this)">X</div>' +
        '<video controls="controls" autoplay src="' + valSrc + '" alt="" style="width: 100%; margin:50% 0px;" /></div>');
}

function deleteDiv(thi) {
    $(thi).parent().remove();
}
/**
 * ajax封装 url 发送请求的地址 data 发送到服务器的数据，数组存储，如：{"date": new Date().getTime(),"state": 1} successfn 成功回调函数
 * 前端异步提交方法
 */
function ajaxWeb(url, data, successfn) {
    data = (data == null || data == "" || typeof (data) == "undefined") ? {
        "date" : new Date().getTime()
    } : data;
    $.ajax( {
        type : "post",
        data : data,
        url : httpUrl+url,
        dataType : "JSON",
        beforeSend : function(XMLHttpRequest) {
        },
        success : function(d) {
            var re = /^{(.+:.+,*){1,}}$/;
            if (!re.test(d))
            {
                //普通字符串处理
            }
            else
            {
                //通过这种方法可将字符串转换为对象
                d = eval("("+d+")");
            }
            successfn(d);
        },
        complete : function(XMLHttpRequest, textStatus) {
        },
        error : function(e) {
            console.log(e)
        }
    });
};

function ajaxWebGet(url, data, successfn) {
    data = (data == null || data == "" || typeof (data) == "undefined") ? {
        "date" : new Date().getTime()
    } : data;

    $.ajax( {
        type : "GET",
        data : data,
        url : url,
        dataType : "json",
        beforeSend : function(XMLHttpRequest) {
        },
        success : function(d) {
            successfn(d);
        },
        complete : function(XMLHttpRequest, textStatus) {
        },
        error : function(e) {
        }
    });
};
var DataUtils ={
    toData:function (value) {
        if (!value){
            return "";
        }
        var date = new Date(value);
        var yy = date.getFullYear() + '-';
        var mM = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var dd = date.getDate();
        return yy + mM +dd;
    },
    toTime:function (value) {
        if (!value){
            return "";
        }
        var date = new Date(value);
        var yy = date.getFullYear() + '-';
        var mM = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var dd = date.getDate() + ' ';
        var hh = date.getHours() + ':';
        var mm = date.getMinutes() + ':';
        var ss = date.getSeconds();
        return yy + mM + dd + hh + mm + ss;
    }
}
//获取主机地址，如： http://localhost:8083
function localhostPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    return localhostPaht;
}
function isWeixinWeb() {
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }
    return false;
}