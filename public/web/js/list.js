$(function() {
	// 初始化页面列表信息
	// var action = "/appTcmn01Cms/searchAll.ph"
	// ajaxWeb(action, null, function(data) {
	// 	var rows = data.resobj;
	// 	if (data.code == "40000") {
	// 		var str = "";
	// 		$.each(rows, function(i, obj) {
	// 			str += '<li><a href="javascript:void(0);" onclick="goView(\''+obj.ccmn01Uuid+'\');">'
	// 					+ obj.ccmn01Spare1 + '</a></li>'
	// 		})
	// 		$("#ulbody").html(str)
	// 	}
	// }, 'json');
})
/**
 * 去详情页面
 */
function goView(id) {
	window.location.href="customer_service_view.html?id="+id;
}