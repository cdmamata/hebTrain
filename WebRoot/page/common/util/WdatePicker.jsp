<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/js-lib/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	
	/**对Date的扩展，将 Date 转化为指定格式的String
	**月(M)、日(d)、小时(H)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
	**年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
	**例子：
	**(new Date()).format("yyyy-MM-dd HH:mm:ss.S") ==> 2006-07-02 08:09:04.423
	**(new Date()).format("yyyy-M-d H:m:s.S")      ==> 2006-7-2 8:9:4.18
	*/
	Date.prototype.format = function (formatType) { //author: meizz 
		var o = {
			"M+" : this.getMonth() + 1,   //月份
			"d+" : this.getDate(),        //日
			"H+" : this.getHours(),       //小时
			"m+" : this.getMinutes(),     //分
			"s+" : this.getSeconds(),     //秒
			"q+" : Math.floor((this.getMonth() + 3) / 3),  //季度
			"S" : this.getMilliseconds()  //毫秒
		};
		if (/(y+)/.test(formatType)) formatType = formatType.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o)
		if (new RegExp("(" + k + ")").test(formatType)) formatType = formatType.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		return formatType;
	}

	/** 当前时间 **/
	wdateBaseDate = new Date();

	/** 初始化基准日期 */
	function initDateTime(baseDate){
		wdateBaseDate = baseDate;
	}
	
	/** 增加或减少 N 天的日期 */
	function offsetDayDate(baseDate, number){
		var newDate = new Date(baseDate.getTime() + (number * 24 * 60 * 60 * 1000));
		return newDate;
	}
	
	/** 增加或减少 N 小时的日期 **/
	function offsetHourDate(baseDate, number){
		var newDate = new Date(baseDate.getTime() + (number * 60 * 60 * 1000));
		return newDate;
	}
	
	/** 获得当前时间显示的日历 */
	function nowTimeDate(){
		return wdateBaseDate;
	}
	
	
	/** 原有方式 创建日历 */
	function simpleWdate(configJson){
		WdatePicker(configJson);
	}
	
	/** 简单方式 创建日历 */
	function easyWdate(configJson){
		configJson["isShowClear"] = false;
		configJson["readOnly"] = true;
		WdatePicker(configJson);
	}
	
</script>

