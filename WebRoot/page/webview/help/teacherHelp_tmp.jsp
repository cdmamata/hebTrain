<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>教师远程培训辅助</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		
		<jsp:include page="/page/common/util/jquery-loder.jsp" flush="true" />
		
		<script type="text/javascript" src="js/webview/help/trainHelp_tmp.js"></script>
		
		
	</head>

	<body class="bodyContentMiddle">
		<div class="bodyMiniWidth">
			<table class="pageBodyTable" align="center" cellpadding="0" cellspacing="0">
				<tr class="pageHeaderPartRow"><!-- 页眉 -->
					<td>
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
				<tr class="pageContentPartRow"><!-- 正文 -->
					<td>
						<div class="contentMiddleRevis" style="width: 98%;">
							<br/>
							<div style="font-size: 10px;">
								温馨提示：此页面使用的内嵌 ifram，因此您在登录时跟浏览器直接登录一样，您的账户信息对本系统而言是完全保密的，因此不会对您的账号造成危险
							</div>
							<br/>
							<div>
								地址：
								<input type="text" id="addressText" style="width: 800px;" value="http://hb2015.px.teacher.com.cn/"/>
								<input type="button" value="跳转" onclick="changeFrameUrl()">
								
								<input type="button" value="测试" onclick="updateStudyTime()">
								
							</div>
							<br/>
							<div id="frameDiv">
								<!-- 
								<iframe width="100%" height="1100" frameborder="1" id="hiddenMainFrame" name="mainFrame" scrolling="yes" src="http://hb2015.px.teacher.com.cn/" style="margin: 0; display: inline;">
								</iframe>
								 -->
								<iframe width="100%" height="600px" frameborder="1" id="mainFrame" name="mainFrame" scrolling="yes" src="" style="margin: 0">
								</iframe>
							</div>
						</div>
					</td>
				</tr>
				<tr class="pageFooterPartRow"><!-- 页脚 -->
					<td>
						<div>
							<jsp:include page="/page/common/basic/copyright.jsp" flush="true" />
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
