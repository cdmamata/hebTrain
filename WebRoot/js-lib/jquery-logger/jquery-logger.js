
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

/**
 * jquery logger
 * 暂时只支持两种  
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */
$(document).ready(function(){
	
	JqLoggerInfoClass1 = "";
	JqLoggerInfoClass2 = "";
	
	/** 用来表示此节点为日志输出元素 **/
	JqLoggerMainMark = "jq-logger-main-table";
	
	JqLoggerTimestampClass = "jq-logger-timestamp-style";
	
	(function(){
		$.extend($.fn,{
			logger: function(logLevel, msg){
				//先判断当前元素是否已初始化日志框架
				var loggerTable = $(this).find("." + JqLoggerMainMark);
		
				if(loggerTable == null || loggerTable.length <= 0){//初始化
					loggerTable = $("<table class='" + JqLoggerMainMark + "' cellspacing='0' cellpadding='0'></table>");
					
					$(this).append(loggerTable);
				}
				
				//先判断行颜色
				var lineClass = "jq-logger-white-line";
				
				var trChildren = $(loggerTable).find("tr");
				
				if(trChildren != null && trChildren.length > 0){
					var lastChild = $(trChildren).last();
					
					var nowClass = $(lastChild).attr("class");
					
					if(lineClass == nowClass){
						lineClass = "jq-logger-gray-line";
					}
				}
				
				//判断级别
				var msgClass = "jq-logger-info-msg";
				if(logLevel == "error"){
					msgClass = "jq-logger-error-msg";
				}
				
				var oneRow = $("<tr class='" + lineClass + "'></tr>");
				
				var nowDate = new Date().format("yyyy-MM-dd HH:mm:ss");
				
				//html
				//时间戳
				var msgHtml = "<td class='" + JqLoggerTimestampClass + "'>" + nowDate + "</td>";
				msgHtml = msgHtml + "<td class='" + msgClass + "'>" + msg + "</td>";
				
				$(oneRow).html(msgHtml);
				
				$(loggerTable).append(oneRow);
			},
			clearLogger: function(){
				$(this).find("." + JqLoggerMainMark).empty();
			}
		
		});
	})();
	
});




