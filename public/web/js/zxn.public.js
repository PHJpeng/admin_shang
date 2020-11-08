/**
 * 去除所有html标签
 * 
 * @returns {String}
 */
function delHtmlTag(str) {
	return str.replace(/<[^>]+>/g, "");// 去掉所有的html标记
}
/**
 * 获取当前时间 yyyy-MM-dd
 * 
 * @returns {String}
 */
function getNowFormatDate() {
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = date.getFullYear() + seperator1 + month + seperator1
			+ strDate
	return currentdate;
}
/**
 * 时间戳转换日期时间
 * 
 * @author ZXN return 2016-07-27 18:12:19
 */
function getLocalTime(nS) {
	return new Date(parseInt(nS)).toLocaleString().replace(/年|月|[/]/g, "-")
			.replace(/日|上午/g, " ");
}
/**
 * 时间戳转换日期时间
 * 
 * @author ZXN return 2016-07-27 18:12:19
 */
function formatLongDate(nS) {
	var date = new Date(nS);
	Y = date.getFullYear() + '-';
	M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
			.getMonth() + 1)
			+ '-';
	D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ';
	h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
	m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes())
			+ ':';
	s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
	return Y + M + D + h + m + s;
}
/**
 * 获取当前时间
 * 
 * @addon zxn
 * @returns {String} 2016-07-12 22:24:51
 */
function getNowFormatDate() {
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = date.getFullYear() + seperator1 + month + seperator1
			+ strDate + " " + date.getHours() + seperator2 + date.getMinutes()
			+ seperator2 + date.getSeconds();
	return currentdate;
}

// 功能：将浮点数四舍五入，取小数点后2位
// 用法：changeTwoDecimal(3.1415926) 返回 3.14
// changeTwoDecimal(3.1475926) 返回 3.15
// js保留2位小数（强制）

function changeTwoDecimal(x) {
	var f_x = parseFloat(x);
	if (isNaN(f_x)) {
		alert('function:changeTwoDecimal->parameter error');
		return false;
	}
	var f_x = Math.round(x * 100) / 100;

	return f_x;
}
// 对于小数点位数大于2位的，用上面的函数没问题，但是如果小于2位的，比如：
// changeTwoDecimal(3.1)，将返回 3.1，如果你一定需要3.10这样的格式，那么需要下面的这个函数
function changeTwoDecimal_f(x) {
	var f_x = parseFloat(x);
	if (isNaN(f_x)) {
		alert('function:changeTwoDecimal->parameter error');
		return false;
	}
	var f_x = Math.round(x * 100) / 100;
	var s_x = f_x.toString();
	var pos_decimal = s_x.indexOf('.');
	if (pos_decimal < 0) {
		pos_decimal = s_x.length;
		s_x += '.';
	}
	while (s_x.length <= pos_decimal + 2) {
		s_x += '0';
	}
	return s_x;
}

/**
 * 比较两个日期
 * 
 * @author ZXN
 * @date 2015- 9- 23
 * @param startTime
 *            开始时间
 * @param endTime
 *            结束时间
 * @return 开始时间<结束时间(<0) 开始时间=结束时间(=0) 开始时间>结束时间(>0)
 */
function compareDate(startTime, endTime) {
	if (startTime.length == 7) { // 2015-03
		startTime += "-01";
	}
	if (endTime.length == 7) { // 2015-03
		endTime += "-01";
	}
	startTime = startTime.replace(/-/g, "/");
	endTime = endTime.replace(/-/g, "/");
	return Date.parse(startTime) - Date.parse(endTime);
}
/**
 * 数组转字符串逗号拼接
 * 
 * @param array
 */
function arrayToString(array) {
	var str = "";
	if (array) {
		$.each(array, function(i, obj) {
			str += obj;
			if (i < array.length - 1) {
				str += ",";
			}
		})
	}
	return str;
}
/**
 * 数组转字符串逗号拼接
 * 
 * @param array
 */
function arrayToString(array) {
	var str = "";
	if (array) {
		$.each(array, function(i, obj) {
			str += obj;
			if (i < array.length - 1) {
				str += ",";
			}
		})
	}
	return str;
}
/**
 * map按照键排序-从小到大
 * 
 * @param map
 * @return map
 */
function mapKeySort(map) {
	var resultmap = {};
	var array = [];
	for (key in map) {
		array[array.length] = key;
	}
	array.sort();
	for (value in array) {
		resultmap[array[value]] = map[array[value]];
	}
	return resultmap;
}
/**
 * 将map 按照键排序 ASCLL 并拼接为'=' 和','相连的字符串
 * 
 * @param String
 */
function mapKeySortToString(map) {
	var resultmap = {};
	var prestr = "";// 待签名字符串
	var array = [];
	for (thisKey in map) {
		array[array.length] = thisKey;
	}
	array.sort();
	for (value in array) {
		prestr = prestr + array[value] + "=" + map[array[value]] + ",";
	}
	prestr = prestr.substring(0, prestr.length - 1)
	return prestr;
}

function uuid(len, radix) {
  var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
  var uuid = [], i;
  radix = radix || chars.length;
 
  if (len) {
   // Compact form
   for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random()*radix];
  } else {
   // rfc4122, version 4 form
   var r;
 
   // rfc4122 requires these characters
   uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
   uuid[14] = '4';
 
   // Fill in random data. At i==19 set the high bits of clock sequence as
   // per rfc4122, sec. 4.1.5
   for (i = 0; i < 36; i++) {
    if (!uuid[i]) {
     r = 0 | Math.random()*16;
     uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
    }
   }
  }
 
  return uuid.join('');
}