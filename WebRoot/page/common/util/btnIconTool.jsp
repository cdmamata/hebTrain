<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>按钮图标列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<jsp:include page="/page/common/util/ext-loder.jsp" flush="true"/>
		
		<script type="text/javascript" src="js/basic/extCommonIcon.js"></script>
		<script type="text/javascript">
			Ext.onReady(function() {
				
				/** 创建一行数据 **/
				var createIconRow = function(){
					
					var iconRowHtml = "";
					
					for(var key in Heb.icon){
						var imgValue = Heb.icon[key];
						iconRowHtml = iconRowHtml + "<tr align='center'><td><img src='" + imgValue + "' /></td><td>Heb.icon." + key + "</td></tr>";
					}
					return iconRowHtml;
				}
				
				/** 生成表格 html **/
				var createIconTab = function(){
					
					var iconTabHtml = "<table align='center' border='1px' cellspacing='0px'><tr align='center'><td width='200px'>图标样式</td>" +
						"<td width='400px'>图标名称</td></tr>";
					var iconStyleRow = createIconRow();
					iconTabHtml = iconTabHtml + iconStyleRow;
					iconTabHtml = iconTabHtml + "</table>";
					
					document.getElementById("btnIconDiv").innerHTML = iconTabHtml;
				}
				createIconTab();
			});
		</script>
		
	</head>

	<body class="bodyContentMiddle">
		<div class="bodyMiniWidth">
			<div>
				<!-- 用户登录信息 -->
				<jsp:include page="/page/common/basic/loginUser.jsp" flush="true" />
			</div>
			<div>
				<!-- 功能菜单 -->
				<jsp:include page="/page/common/basic/menuToolbar.jsp" flush="true" />
			</div>
			<div id="mainContent">
				<br/>
				<div id="btnIconDiv"></div>
				<br/><br/><br/><br/><br/>
			</div>
			<div>
				<jsp:include page="/page/common/basic/copyright.jsp" flush="true" />
			</div>
		</div>
	</body>
	
</html>
