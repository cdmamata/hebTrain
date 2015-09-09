<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>登录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		<jsp:include page="/page/common/util/sha1-loder.jsp" flush="true" />
		<jsp:include page="/page/common/util/jquery-loder.jsp" flush="true" />
		
		<style type="text/css">
			.rowDiv{
				margin-top: 20px;
			}
			
			.bodyCommonStyle{
				background-color: #DFDFDF;
				text-align: center;
			}
			
			.loginMessage{
				font-size: 13px;
				color: #ff0000;
				text-align: center;
				height: 16px;
				margin-top: 4px;
			}
			
			
		</style>
		
		<script type="text/javascript">
			
			function goLogin(){
				var userName = $("#userName").val();
				var password = $("#expressPassword").val();
				
				if(userName == "" || password == ""){
					$("#errorMsgDiv").text("用户名或密码不能为空！");
				}else{
					$("#errorMsgDiv").text("");
					
					var sha1Password = hex_sha1(password);
					$("#encryptPassword").val(sha1Password);
					
					document.getElementById("loginForm").submit();
				}
			}
			
			function enterPress(e){//传入 event
				var e = e || window.event;
				if(e.keyCode == 13){
					goLogin();
				}
			}
			
		</script>
	</head>

	<body class="bodyCommonStyle" onkeypress="enterPress()">
		<div class="bodyMiniWidth">
			<table class="pageBodyTable" align="center" cellpadding="0" cellspacing="0">
				<tr class="pageHeaderPartRow"><!-- 页眉 -->
					<td>
						<div>
							
						</div>
					</td>
				</tr>
				<tr valign="middle" align="center"><!-- 正文 -->
					<td>
						<div class="contentMiddleRevis" style="width: 200px;">
							<h2>用户登录</h2>
							<form action="login" method="post" id="loginForm">
								<div class="rowDiv">
									用户名
									<input type="text" id="userName" name="loginUser.userName" value="${userName}" />
								</div>
								<div class="rowDiv">
									密　码
									<input type="password" id="expressPassword" />
		
									<!-- 加密密码 -->
									<input type="hidden" id="encryptPassword" name="loginUser.password" />
								</div>
								<div class="loginMessage" id="errorMsgDiv">
									${loginErrorMsg}
								</div>
								<div>
									<input type="reset" value="取消" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" value="登录" onclick="goLogin()" />
								</div>
								<div style="height: 300px;"></div>
							</form>
						</div>
					</td>
				</tr>
				<tr class="pageFooterPartRow"><!-- 页脚 -->
					<td>
						<div>
							
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
