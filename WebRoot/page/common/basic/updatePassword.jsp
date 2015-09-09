<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>修改密码</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		<jsp:include page="/page/common/util/jquery-loder.jsp" flush="true" />
		<jsp:include page="/page/common/util/sha1-loder.jsp" flush="true" />
		
		<style type="text/css">
			.errorMessage{
				font-size: 13px;
				color: #ff0000;
				text-align: center;
				height: 16px;
			}
		</style>
		
		<script type="text/javascript">
			baseAction = "";
			/** 修改密码 **/
			function updatePassword(){
				var userName = $("#userName").val();
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var repPassword = $("#repPassword").val();
				
				if(userName == "" || oldPassword == "" || newPassword == "" || repPassword == ""){
					$("#errorMsgDiv").html("不能为空");
				}else{
					if(newPassword != repPassword){
						$("#errorMsgDiv").html("密码不一致");
					}else{
						var regex = /^[A-Za-z\d_]{3,18}$/;
						
						if(regex.test(newPassword)){
							$("#errorMsgDiv").html("");
							$(document.body).mask("正在提交...");
							
							var sha1OldPassword = hex_sha1(oldPassword);
							var sha1NewPassword = hex_sha1(newPassword);
							
							var parameter = {};
							
							parameter["loginUser.userName"] = userName;
							parameter["loginUser.password"] = sha1OldPassword;
							parameter["loginUser.newPassword"] = sha1NewPassword;
							
							$.ajax({
								url: "editPassword",
								type: "post",
								data: parameter,
								complete: function(request, textStatus){
									$(document.body).unmask();
								},
								success: function(data, textStatus){
									var resultJson = $.parseJSON(data);
									
									if(resultJson.success == true){
										alert(resultJson["msg"]);
									}else{
										$("#errorMsgDiv").html("修改失败:" + resultJson["msg"]);
									}
								},
								error: function(data, textStatus){
									loggerMsg("error", "更新学习时间时未知异常");
								}
							});
						}else{
							$("#errorMsgDiv").html("密码必须为 3-18 位字母数字或下划线");
						}
					}
					
					
				}
			}
		
		</script>
		
		
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
						<div class="contentMiddleRevis" style="width: 100%;">
							<table align="center" style="margin-top: 10px;">
								<tr>
									<td>用户名：</td>
									<td>
										<input type="text" id="userName"/>
									</td>
								</tr>
								<tr>
									<td>原始密码：</td>
									<td>
										<input type="password" id="oldPassword"/>
									</td>
								</tr>
								<tr>
									<td>新密码：</td>
									<td>
										<input type="password" id="newPassword"/>
									</td>
								</tr>
								<tr>
									<td>重复密码：</td>
									<td>
										<input type="password" id="repPassword"/>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="errorMessage" id="errorMsgDiv">
											
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="button" value="提交" onclick="updatePassword()"/>
									
									</td>
								</tr>
								
							</table>
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
