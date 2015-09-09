<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>国家应急中心</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<!--
			<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<style type="text/css">
			.miniWith{
				min-width: 1024px;
				_width: expression((document.documentElement.clientWidth||document.body.clientWidth)<1024?"1024px":"");
			}
		</style>
		
		<script type="text/javascript">
			/** 添加cookie **/
			function setCookie(cookieName, cookieValue, expiredays) {
				var exdate = new Date();
				exdate.setDate(exdate.getDate() + expiredays);
				document.cookie = cookieName + "=" + escape(cookieValue) + ((expiredays == null) ? "" : ";expires=" + exdate.toUTCString());
			}
			
			/**
			 * 手动设置 iframe 高度
			 */
			function setFrameHeight(height){
				var mainFrame = document.getElementById("mainFrame");
				mainFrame.style.height = height + "px";// 设置iframe的高度
			}
			
			/** 保存用户 cookie **/
			function saveUserCookies(){
				var tubaUserName = "${ubaSessionLoginUser.userName}";
				var tubaAct = "${ubaSessionLoginUser.act}";
				
				var allCookies = document.cookie;
				
				setCookie("tubaCookieUserName", tubaUserName, 36500);
				setCookie("tubaCookieAct", tubaAct, 36500);
			}
			
			/** 更改 Iframe url **/
			function changeFrame(url){
				setFrameHeight(700);
				document.getElementById("mainFrame").src = url;
			}
			
			saveUserCookies();
		</script>
	</head>

	<body style="text-align: center; margin: 0;" onload="createMenu()">
		<div style="text-align: left; margin-right: auto; margin-left: auto; height: 700px;" class="miniWith">
			<div>
				<!-- 用户登录信息 -->
				<jsp:include page="/page/common/basic/loginUser.jsp" flush="true" />
			</div>
			<div>
				<!-- 功能菜单 -->
				<jsp:include page="/page/common/basic/menuToolbar.jsp" flush="true" />
			</div>
			<div id="frameDiv">
				<iframe width="100%" height="1000" frameborder="0" id="mainFrame" name="mainFrame" 
					scrolling="yes" src="" style="margin: 0">
				</iframe>
			</div>
			<div>
				<jsp:include page="/page/common/basic/copyright.jsp" flush="true" />
			</div>
			
		</div>
	</body>
</html>
