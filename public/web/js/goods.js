var goodid=getParameter("goodid");//商品id
var authorization=getParameter("authorization");//token
$(function () {
    //获取商品详情
    var action = "/v1/goodInfo"
    ajaxWeb(action, {"goodid":goodid,"authorization":authorization}, function(data) {

    	var rows = data.data;
    	if (data.code == "2000") {
			$("#title").text(rows.title);
			var str="";

			$.each(rows.cover_img,function (i,obj) {
				str+='<div class="swiper-slide">';
				str+='<a href="javascript:void(0);">';
				str+='<img src="'+obj+'" alt="图片加载失败" />';
				str+='</a>';
				str+='</div>';
			})
			$(".swiper-wrapper").html(str);
			hr.page.proDetailpage = {
				init: function() {
					// TODO 本页面初始化时要执行的代码
					this.swiperPro();
				},
				swiperPro: function() {
					var swiper = new Swiper('.swiper_pro', {
						slidesPerView: 1,
						loop: false,
						pagination: {
							el: '.swiper-pagination',
						},
						autoplay: {
							delay: 2000,
							disableOnInteraction: false,
						},
					});
				}
			};
			hr.page.proDetailpage.init();
			$(".p2").text("¥"+rows.market_price);
			$(".p1").text(parseInt(rows.conversion_price)+"积分");
			$("#xl").text(rows.front_num);
			$("#kc").text(rows.stock);
			$("#yf").text(rows.post_fee);
			$(".con").html(rows.detail);
			// $(".con").html(str);
    	}
    }, 'json');

})
function buyGoods() {
	var gg=500;
	if (isAndroid) {
		buy.sendBuyParam(gg);
	} else if (isiOS) {
		window.webkit.messageHandlers.sendBuyParam.postMessage({body: gg});
	}
	// alert("向手机发送参数:规格值="+gg);
}
