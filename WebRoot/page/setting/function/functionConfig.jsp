<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>功能配置</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		<jsp:include page="/page/common/util/ext-loder.jsp" flush="true"/>
		<jsp:include page="/page/common/util/icon-loder.jsp" flush="true"/>
		
		<script type="text/javascript" src="js/setting/function/functionConfig.js"></script>
		
	</head>

	<body class="bodyContentMiddle">
		<div class="bodyMiniWidth">
			<table class="pageBodyTable" align="center" cellpadding="0" cellspacing="0">
				<tr class="pageHeaderPartRow">
					<td><!-- 页眉 -->
						<div>
							<!-- 用户登录信息 -->
							<jsp:include page="/page/common/basic/loginUser.jsp" flush="true" />
						</div>
						<div>
							<!-- 功能菜单 -->
							<jsp:include page="/page/common/basic/menuToolbar.jsp" flush="true" />
						</div>
					</td>
				</tr>
				<tr class="pageContentPartRow">
					<td>
						<div class="contentMiddleRevis" style="width: 1024px;">
							<div id="functionConfigDiv" ></div>
						</div>
					</td>
				</tr>
				<tr class="pageFooterPartRow">
					<td>
						<div>
							<!-- 页脚版权 -->
							<jsp:include page="/page/common/basic/copyright.jsp" flush="true" />
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
