<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!--
<script type="text/javascript" src="<%=path%>/js-lib/jquery/jquery-1.11.2.js"></script>
-->

<script type="text/javascript" src="<%=path%>/js-lib/jquery/jquery-1.11.2.min.js"></script>

<!-- load mask -->
<link rel="stylesheet" type="text/css" href="<%=path%>/js-lib/jquery-loadmask/jquery.loadmask.css" />
<script type="text/javascript" src="<%=path%>/js-lib/jquery-loadmask/jquery.loadmask.min.js"></script>

<style type="text/css">
	
	/** 自定义的 a href blank 连接 **/
	.user-jq-alink-blank{
		display: none;
	}

</style>

<script type="text/javascript">
	
	/** blank 模式 打开新页面 **/
	function openBlankPage(url){
		var l = $('.user-jq-alink-blank').length;
		if(l <= 0){
			var ahrefDom = $('<a href="page" target="_blank" class="user-jq-alink-blank"></a>');
		
			$(ahrefDom).html('<span></span>');
			$("body:first").append(ahrefDom);
		}
		if(url != null){
			$('.user-jq-alink-blank').attr("href", url);
		}
		$('.user-jq-alink-blank span').click();
	}
	
	/** 获得单选钮值 **/
	function getRadioValue(radioName){
		var radioValue = null;
		var radioList = document.getElementsByName(radioName);
		for(i=0; i<radioList.length; i++){
			//遍历Radio
			if(radioList[i].checked){
				radioValue = radioList[i].value;
				break;
			}
		}
		return radioValue;
	}
	
	/** 获得 websocket url **/
	function getWebsocketUrl(actionName){
		var scheme = "<%=request.getScheme()%>";
		var serverName = "<%=request.getServerName()%>";
		var serverPort = "<%=request.getServerPort()%>";
		var path = "<%=path%>";
		
		if (scheme == 'http') {
			scheme = "ws";
		} else {
			scheme = "wss";
		}
		var url = scheme + "://" + serverName + ":" + serverPort + path + "/websocket/" + actionName;
		return url;
	}
	
	/** 是否支持 websocket **/
	function isSupportWebsocket(){
		var flag = true;
		
		if ('WebSocket' in window) {
		} else if ('MozWebSocket' in window) {
		}else{
			flag = false;
			var divDom = $('<div style="color: red; font-size: 18px; font-weight: bolder; "></div>');
			$(divDom).html('该浏览器不支持 Websocket！');
			$("body:first").prepend(divDom);
		}
		return flag;
	}
	
	/** 获得 websocket 对象 **/
	function getWebsocket(url){
		var websocket = null;
		
		if ('WebSocket' in window) {
			websocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket(host);
		}
		return websocket
	}
	
	/** 获得随机整数 **/
	function randomInt(min, max){
		var ran = max - min;
				
		var number = Math.round(Math.random() * ran) + min;
		
		return number;
	}
	
</script>
 
