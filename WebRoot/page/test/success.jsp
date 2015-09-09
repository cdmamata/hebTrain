<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>登录成功</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		
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
				测试内容
				<div style="background-color: red; width: 700px; height: 500px;"></div>
			</div>
			<div>
				<jsp:include page="/page/common/basic/copyright.jsp" flush="true" />
			</div>
		</div>
	</body>
</html>
