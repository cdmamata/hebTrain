<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>按钮测试</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		
		<style type="text/css">
			.keyBlock{
				float: left;
				color: yellow;
				cursor: pointer;
				margin-top: 2px;
				margin-left: 2px;
				overflow: hidden;
				text-align: center;
				line-height: 30px;
				font-weight: bolder;
				background-color: #DEACAF;
				width: 60px;
				height: 60px;
				background: url(img/key/square.gif) no-repeat;
				background-color: #E1C885;
			}
			
			
			.partMain{
				float: left;
				color: yellow;
				background-color: fuchsia;
				cursor: pointer;
				overflow: hidden;
				width: 60px;
				height: 60px;
			}
			
			/** 横长按键 **/
			.partLeft{
				float: left;
				background: url(img/key/partLeft.gif) no-repeat;
				height: 60px;
				width: 11px;
			}
			.partHeng{
				float: left;
				background: url(img/key/partHeng.gif) repeat-x;
				height: 60px;
				width: 40px;
				padding-top: 10px;
				overflow: hidden;
			}
			.partRight{
				float: left;
				background: url(img/key/partRight.gif) no-repeat;
				height: 60px;
				width: 9px;
			}
			
			/** 竖长按键 **/
			.partTop{
				float: left;
				background: url(img/key/partTop.gif) no-repeat;
				width: 60px;
				height: 8px;
				
			}
			.partShu{
				float: left;
				background: url(img/key/partShu.gif) repeat-y;
				width: 60px;
				height: 39px;
				overflow: hidden;
				text-align: center;
			}
			.partBottom{
				float: left;
				background: url(img/key/partBottom.gif) no-repeat;
				width: 60px;
				height: 13px;
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
					<td>
						<div class="contentMiddleRevis" style="width: 100%;">
							<div class="keyLongMain" style="width: 300px;">
								<div class="partLeft"></div>
								<div class="partHeng">Shift</div>
								<div class="partRight"></div>
							</div>
							
							<div class="keycapBlock partMain" style="height: 124px;">
								<div class="partTop"></div>
								<div class="partShu" style="height: 104px;">Enter</div>
								<div class="partBottom"></div>
							</div>
					
							<div ></div>
							<div></div>
							<div></div>
							
							
							<br/>
							
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
