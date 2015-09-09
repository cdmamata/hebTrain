<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
		
		<jsp:include page="/page/common/util/jquery-logger-loder.jsp" flush="true" />
		
		<script type="text/javascript" src="js/webview/help/teacherHelp.js"></script>
		
		<style type="text/css">
			.rowDiv{
				margin-top: 20px;
			}
			
			.loginMessage{
				font-size: 13px;
				color: #ff0000;
				text-align: center;
				height: 16px;
				margin-top: 4px;
			}
			
			.loginUpBar{
				cursor: pointer;
				height: 20px;
				border: solid 1px #DFDFDF;
				text-align: center;
				background-color: #ECECEC;
				background-position: center;
				background-repeat: no-repeat;
				background-image:url(img/icon/big-up.png);
				
			}
			
			.loginDownBar{
				cursor: pointer;
				height: 20px;
				border: solid 1px #DFDFDF;
				text-align: center;
				background-color: #ECECEC;
				background-position: center;
				background-repeat: no-repeat;
				background-image:url(img/icon/big-down.png);
			}
			
			.loggerDivStyle{
				width: 100%;
				height: 100%;
				overflow-y: auto;
			}
		
		</style>
		
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
					<td align="center">
						<div class="contentMiddleRevis" style="width: 100%;">
							<!-- 登录部分 -->
							
							<div id="teacherLoginDiv" style="text-align: center;">
								<div style="width: 100%; height: 150px; position: absolute; background-color: aqua; display: none;"></div>
							
								<div class="contentMiddleRevis" style="width: 370px;">
									<h2>请输入远程培训系统账号及密码</h2>
								</div>
								<div class="contentMiddleRevis" style="width: 220px;">
									<div style="width: 360px;">
										<div class="rowDiv">
											用户名
											<input type="text" id="userName" style="width: 150px;" value="${teacherSessionUser.userName}" />
										</div>
										<div class="rowDiv">
											密　码
											<input type="password" id="password" style="width: 150px;" value="${teacherSessionUser.password}"/>
										</div>
										<div class="loginMessage" id="errorMsgDiv">
											${loginErrorMsg}
										</div>
										<div style="margin-left: 50px;">
											<input type="reset" value="取消" />
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="button" value="登录" onclick="goLogin()" />
											<img id="loginImg" src="" style="display: none;"/>
										</div>
										<br/>
									</div>
								</div>
							</div>
							<div class="loginUpBar" id="loginBarDiv" title="隐藏"></div>
							
							
							<div class="contentMiddleRevis" style="width: 100%; margin-top: 10px;">
								<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
									
									<tr>
										<td style="border: solid #9A9A9A 2px;">
											<!-- 日志输出 -->
											<div class="loggerDivStyle">
												<div style="height: 20px; padding: 5px; border-bottom: solid #9A9A9A 2px;">
													<div style="font-size: 15px; font-weight: bolder; color: #D8432E; float: left; width: 100px;">执行日志</div>
													<div style="float: right; width: 80px;">
														<input type="button" value="清除日志" onclick="clearLogger()" />
													</div>
												</div>
												<div id="teacherLoggerDiv">
												
												</div>
											</div>
										</td>
										<td width="700px" valign="top" style="padding: 0; border: solid #9A9A9A 2px;">
											<!-- 学习计时 -->
											<table border="1" cellpadding="0" cellspacing="0" width="100%">
												<tr>
													<td colspan="2">
														<div style="background-color: #D5D5D5; font-size: 15px; font-weight: bolder; padding: 10px; height: 20px;">
															<div style="float: left; width: 120px;">
																更新学习时间
															</div>
															<div style="float: right;width: 500px; color: red;">
																距离下次自动更新时间：
																<input type="text" id="autoUpdateTimeText" readonly="readonly"/>
																
																<input type="button" id="timmerBtn" value="开始自动更新" onclick="timmerBtnClick();"/>
															</div>
															
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<div style="color: red; font-size: 12px; padding: 10px;">
															注意：点击“更新学习时间”按钮的时间间隔为：大于10分钟小于20分钟，不在此范围则不能累计学习时间！
														</div>
													</td>
												</tr>
												<tr height="35px">
													<td width="120px;">累计学习时间：</td>
													<td>
														<input type="text" id="sumLearnTimeText" readonly="readonly"/>
													</td>
												</tr>
												<tr height="35px">
													<td>本次学习时间：</td>
													<td>
														<input type="text" id="nowLearnTimeText" readonly="readonly"/>
													</td>
												</tr>
												<!-- 
												<tr height="35px">
													<td>输入验证码：</td>
													<td>
														<input type="text" />
													</td>
												</tr>
												 -->
												<tr>
													<td colspan="2">
														<div style="color: red; font-size: 12px; text-align: center;">
															你也可以点击下面的按钮手动更新
														</div>
														<div style="text-align: center;">
															<input type="button" value="更新学习时间" onclick="updateLearnTime()"/>
														</div>
													</td>
												</tr>
											</table>
											
											<div style="width: 100%; border-bottom: solid #9A9A9A 2px; " id="learnPageShowDiv">
												<div style="background-color: #D5D5D5; font-size: 15px; font-weight: bolder; padding: 10px; height: 20px;">
													<div style="float: left; width: 120px;">
														学习页面预览
													</div>
													<div style="float: right;width: 450px; color: red; font-size: 12px;">
														注：如果地址不正确，可以手动指定地址，然后点击 "更改地址" 按钮
													</div>
													
												</div>
												<div id="learnPageDiv">
													<div style="padding: 5px;">
														地址：
														<input type="text" id="addressText" style="width: 580px;" value="${teacherSessionUser.learnUrl}"/>
														<input type="button" value="跳转" onclick="changeFrameUrl()">
													</div>
													<div style="text-align: center; border-bottom: solid #9A9A9A 2px;">
														<input type="button" value="更改地址" onclick="updateLearnUrl()">
													</div>
													<div style="width: 100%; height: 500px;">
														<iframe width="100%" height="100%" frameborder="0" id="learnFrame" scrolling="yes" src="" style="margin: 0">
														</iframe>
													</div>
												</div>
											</div>
											
										</td>
									</tr>
								</table>
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
