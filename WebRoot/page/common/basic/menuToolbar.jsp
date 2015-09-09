<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href="<%=basePath%>">

<style type="text/css">
	/** 菜单外部边框 **/
	.menuFrameDiv{
		width: 100%;
		overflow-x: auto;
		background-color: #DFDFDF;
		border-top: solid #9A9A9A 1px;
		border-right: 0;
		border-bottom: solid #9A9A9A 1px;
		border-left: 0;
	}

	/** 未选中时的样式 **/
	.funBtnUnselect{
		border: 1px solid #9A9A9A;
		float: left;
		cursor: pointer;
		font-weight: bold;
		color: black;
		background-color: #FFFFFF;
		text-align: center;
		white-space: nowrap;
		padding: 2px;
		margin: 2px;
	}
	.funBtnUnselectOver{
		border:1px solid #000000;
		float: left;
		cursor: pointer;
		font-weight: bold;
		color: white;
		background-color: #A1C7F4;
		text-align: center;
		white-space: nowrap;
		padding: 2px;
		margin: 2px;
	}
	
	/** 选中时的样式 **/
	.funBtnHasSelect{
		border:1px solid #9A9A9A;
		float: left;
		cursor: pointer;
		font-weight: bold;
		color: black;
		background-color: #A1C7F4;
		text-align: center;
		white-space: nowrap;
		padding: 2px;
		margin-left: 2px;
	}
	.funBtnHasSelectOver{
		border:1px solid #000000;
		float: left;
		cursor: pointer;
		font-weight: bold;
		color: black;
		background-color: #A1C7F4;
		text-align: center;
		white-space: nowrap;
		padding: 2px;
		margin-left: 2px;
	}
</style>

<script type="text/javascript">
	/** 当前页面对应按钮的 id **/
	var nowFunctionBtnId = null;
	
	var btnHasSelectOut = "funBtnHasSelect";
	var btnHasSelectOver = "funBtnHasSelectOver";
	
	var btnUnSelectOut = "funBtnUnselect";
	var btnUnSelectOver = "funBtnUnselectOver";

	/** 跳转 url **/
	function goFunction(actionUrl){
		window.location.href = actionUrl;
	}
	
	/** 生成 menuId **/
	function getFunBtnId(actionName, k){
		var menuId = "btn-" + actionName + "-" + k;
		return menuId;
	}
	
	/** 选择默认按钮 **/
	function checkDefautBtn(){
		var actionName = '${functionActionName}';
		var functionKey = '${functionActionKey}';
		
		nowFunctionBtnId = getFunBtnId(actionName, functionKey);
		
		var checkDom = document.getElementById(nowFunctionBtnId);
		
		if(checkDom != null){
			checkDom.className = btnHasSelectOut;
		}
	}
	
	/** 鼠标悬浮 **/
	function overBtn(dom){
		if(nowFunctionBtnId == dom.id){//选中的
			dom.className = btnHasSelectOver;
		}else{
			dom.className = btnUnSelectOver;
		}
		
	}
	
	/** 鼠标移出 **/
	function outBtn(dom){
		if(nowFunctionBtnId == dom.id){//选中的
			dom.className = btnHasSelectOut;
		}else{
			dom.className = btnUnSelectOut;
		}
	}
	
	/** 生成 functionBtnId **/
	function getFunctionBtnId(functionId){
		var functionBtnId = "functionBtn-" + functionId;
		return functionBtnId;
	}
	
	/**
	 * 生成 菜单
	 */
	function createMenu(){
		var functionJsonStr = '${sessionLoginUser.functionJson}';
		
		var functionJson = eval(functionJsonStr);
		
		if(functionJson != null){
			var funBtnHtml = "<table border='0' style='margin: 2px;'>";
			funBtnHtml = funBtnHtml + "<tr height='30px;'>";
			
			for(var i = 0; i<functionJson.length; i++){
				var oneFunction = functionJson[i];
				
				var actionUrl = oneFunction["actionUrl"];
				var k = oneFunction["k"];
				var functionName = oneFunction["functionName"];
				var actionValue = oneFunction["actionValue"];
				
				var funBtnId = getFunBtnId(actionValue, k);
				
				funBtnHtml = funBtnHtml + "<td>";
				
				funBtnHtml = funBtnHtml + "<div class='funBtnUnselect' id='" + funBtnId + "' onclick='goFunction(\"" + actionUrl + "\")' ";
				funBtnHtml = funBtnHtml + " onmouseover='overBtn(this)' onmouseout='outBtn(this)'>" + functionName + "</div>";
				
				funBtnHtml = funBtnHtml + "</td>";
			}
			funBtnHtml = funBtnHtml + "</tr></table>";
			
			document.getElementById("functionBtnDiv").innerHTML = funBtnHtml;
			
			checkDefautBtn();
		}
	}
	
</script>

<div>
	<div class="menuFrameDiv" id="functionBtnDiv">
	</div>
</div>

<script type="text/javascript">
	createMenu();
</script>

