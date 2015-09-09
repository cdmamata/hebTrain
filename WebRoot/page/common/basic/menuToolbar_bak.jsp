<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>菜单栏</title>
		<base href="<%=basePath%>">
		
		<style type="text/css">
			/** 未选中时的样式 **/
			.actionMenuBtn{
				border: 1px solid #9A9A9A;
				float: left;
				cursor: hand;
				font-weight: bold;
				color: black;
				background-color: #FFFFFF;
				text-align: center;
				white-space: nowrap;
				padding: 2px;
				margin: 2px;
			}
			.actionMenuBtn:hover{
				border:1px solid #000000;
				color: white;
				background-color: #A1C7F4;
			}
			
			/** 选中时的样式 **/
			.checkActionMenuBtn{
				border:1px solid #9A9A9A;
				float: left;
				cursor: hand;
				font-weight: bold;
				color: black;
				background-color: #A1C7F4;
				text-align: center;
				white-space: nowrap;
				padding: 2px;
				margin-left: 2px;
				
			}
			.checkActionMenuBtn:hover{
				border:1px solid #000000;
			}
		</style>
		
		<script type="text/javascript">
			var lastBtnId = null;
			var firstBtnId = null;
		
			/** 跳转 url **/
			function goFunction(functionBtnId, url){
				if(lastBtnId != null){
					document.getElementById(lastBtnId).className = "actionMenuBtn";
				}
				document.getElementById(functionBtnId).className = "checkActionMenuBtn";
				
				lastBtnId = functionBtnId;
				
				changeFrame(url);
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
				var menuJsonStr = '${necSessionLoginUser.functionJson}';
				
				var menuJson = eval(menuJsonStr);
				
				if(menuJson != null){
					var menuHtml = "";
					
					for(var i = 0; i<menuJson.length; i++){
						var oneMenu = menuJson[i];
						
						var functionId = oneMenu["functionId"];
						var functionName = oneMenu["functionName"];
						var url = oneMenu["url"];
						
						var functionBtnId = getFunctionBtnId(functionId);
						
						if(i == 0){
							firstBtnId = functionBtnId;
						}
						
						menuHtml = menuHtml + "<td>";
						
						menuHtml = menuHtml + "<div class='actionMenuBtn' id='" + functionBtnId + "' ";
						menuHtml = menuHtml + "onclick='goFunction(\"" + functionBtnId + "\", \"" + url + "\")'>" + functionName + "</div>";
						
						menuHtml = menuHtml + "</td>";
					}
					
					document.getElementById("menuActionTr").innerHTML = menuHtml;
					
					document.getElementById(firstBtnId).click();
				}
			}
			
		</script>
	</head>

	<body>
		<div>
			<div style="width: 100%; overflow-x: auto; background-color: #DFDFDF;">
				<table border="0" style="margin: 2px;">
					<tr height="30px;" id="menuActionTr">
						
					</tr>
				</table>
			</div>
			<div style="width: 100%; height: 1px; background-color: #9A9A9A;"></div>
		</div>
	</body>
</html>
