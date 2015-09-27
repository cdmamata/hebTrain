<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>键帽配色</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/commonCssLoder.jsp" flush="true" />
		
		<style type="text/css">
			
			/** 同一区域按键 **/
			.keyArea{
				background-color: #C86400;
				float: left;
				padding-bottom: 4px;
				padding-right: 4px;
			}
			
			/** 区域中的一行 **/
			.oneKeyRow{
				float: left;
			}
			
			/** 按键基础样式 **/
			.keycapBlock{
				float: left;
				color: yellow;
				cursor: pointer;
				margin-top: 4px;
				margin-left: 4px;
				overflow: hidden;
				text-align: center;
				line-height: 30px;
				font-weight: bolder;
				background-color: #DEACAF;
			}
			
			/** 正方形按键 **/
			.keySimple{
				width: 60px;
				height: 60px;
				background: url(img/key/keySimple.gif) no-repeat;
				background-color: #FFAEC9;
			}
			
			/** 字母区 回车 按键 **/
			.keySimpleBottom{
				width: 76px;
				height: 60px;
				background: url(img/key/keySimpleBottom.gif) no-repeat;
				background-color: #E1C885;
			}
			
			/** ==================== 特殊按键拼接 ==================== **/
			.partMain{
				float: left;
				color: yellow;
				background-color: fuchsia;
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
						<div class="contentMiddleRevis" style="width: 1600px;">
							
							<!-- ===================================================================================================================== -->
							
							
							<div id="colorKeyDIv" style="background: url(img/key/chuYin.jpg) no-repeat; width: 1436px; border: 4px solid black; padding: 20px; margin-top: 20px;">
								
								<div>
									<!-- esc 区 -->
									<div class="keyArea" style="width: 64px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock keySimple" style="">Esc</div>
										</div>
									</div>
									
									<!-- F1 - F4区 -->
									<div class="keyArea" style="width: 256px; margin-left: 60px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock keySimple" style="">F1</div>
											<div class="keycapBlock keySimple" style="">F2</div>
											<div class="keycapBlock keySimple" style="">F3</div>
											<div class="keycapBlock keySimple" style="">F4</div>
										</div>
									</div>
									
									<!-- F5 - F8区 -->
									<div class="keyArea" style="width: 256px; margin-left: 26px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock keySimple" style="">F5</div>
											<div class="keycapBlock keySimple" style="">F6</div>
											<div class="keycapBlock keySimple" style="">F7</div>
											<div class="keycapBlock keySimple" style="">F8</div>
											
										</div>
									</div>
									
									<!-- F9 - F12区 -->
									<div class="keyArea" style="width: 256px; margin-left: 26px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock keySimple" style="">F9</div>
											<div class="keycapBlock keySimple" style="">F10</div>
											<div class="keycapBlock keySimple" style="">F11</div>
											<div class="keycapBlock keySimple" style="">F12</div>
											
										</div>
									</div>
									
									<!-- print 功能区 -->
									<div class="keyArea" style="width: 192px; margin-left: 10px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock keySimple" style="">PrtSc</div>
											<div class="keycapBlock keySimple" style="">Scroll</div>
											<div class="keycapBlock keySimple" style="">Pause</div>
											
										</div>
									</div>
									
									<!-- 指示灯 -->
									<div style="margin-left: 10px; width: 237px; height: 63px; float: left;">
										<img alt="" src="img/key/filco.gif">
									</div>
								</div>
								
								<div style="clear: both;"></div>
								<!-- ========== 一大行 ============ -->
								
								<div style="margin-top: 10px;">
									<div style="width: 960px; float: left;">
										<!-- 字母区 -->
										<div class="keyArea" style="">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keySimple" style="">`~</div>
												<div class="keycapBlock keySimple" style="">1</div>
												<div class="keycapBlock keySimple" style="">2</div>
												<div class="keycapBlock keySimple" style="">3</div>
												<div class="keycapBlock keySimple" style="">4</div>
												<div class="keycapBlock keySimple" style="">5</div>
												<div class="keycapBlock keySimple" style="">6</div>
												<div class="keycapBlock keySimple" style="">7</div>
												<div class="keycapBlock keySimple" style="">8</div>
												<div class="keycapBlock keySimple" style="">9</div>
												<div class="keycapBlock keySimple" style="">0</div>
												<div class="keycapBlock keySimple" style="">-</div>
												<div class="keycapBlock keySimple" style="">=</div>
												<div class="keycapBlock partMain" style="width: 120px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 100px;">←Bak</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock partMain" style="width: 89px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 69px;">Tab</div>
													<div class="partRight"></div>
												</div>
												<div class="keycapBlock keySimple" style="">Q</div>
												<div class="keycapBlock keySimple" style="">W</div>
												<div class="keycapBlock keySimple" style="">E</div>
												<div class="keycapBlock keySimple" style="">R</div>
												<div class="keycapBlock keySimple" style="">T</div>
												<div class="keycapBlock keySimple" style="">Y</div>
												<div class="keycapBlock keySimple" style="">U</div>
												<div class="keycapBlock keySimple" style="">I</div>
												<div class="keycapBlock keySimple" style="">O</div>
												<div class="keycapBlock keySimple" style="">P</div>
												<div class="keycapBlock keySimple" style="">[</div>
												<div class="keycapBlock keySimple" style="">]</div>
												<div class="keycapBlock partMain" style="width: 91px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 71px;">\|</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock partMain" style="width: 114px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 94px;">Caps</div>
													<div class="partRight"></div>
												</div>
												<div class="keycapBlock keySimple" style="">A</div>
												<div class="keycapBlock keySimple" style="">S</div>
												<div class="keycapBlock keySimple" style="">D</div>
												<div class="keycapBlock keySimple" style="">F</div>
												<div class="keycapBlock keySimple" style="">G</div>
												<div class="keycapBlock keySimple" style="">H</div>
												<div class="keycapBlock keySimple" style="">J</div>
												<div class="keycapBlock keySimple" style="">K</div>
												<div class="keycapBlock keySimple" style="">L</div>
												<div class="keycapBlock keySimple" style="">;</div>
												<div class="keycapBlock keySimple" style="">"</div>
												<div class="keycapBlock partMain" style="width: 130px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 110px;">Enter</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock partMain" style="width: 151px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 127px;">Shift</div>
													<div class="partRight"></div>
												</div>
												<div class="keycapBlock keySimple" style="">Z</div>
												<div class="keycapBlock keySimple" style="">X</div>
												<div class="keycapBlock keySimple" style="">C</div>
												<div class="keycapBlock keySimple" style="">V</div>
												<div class="keycapBlock keySimple" style="">B</div>
												<div class="keycapBlock keySimple" style="">N</div>
												<div class="keycapBlock keySimple" style="">M</div>
												<div class="keycapBlock keySimple" style="">&lt;</div>
												<div class="keycapBlock keySimple" style="">&gt;</div>
												<div class="keycapBlock keySimple" style="">?</div>
												<div class="keycapBlock partMain" style="width: 157px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 137px;">Shift</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">Ctrl</div>
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">田</div>
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">Alt</div>
												<div class="keycapBlock partMain" style="width: 392px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 372px;">Space</div>
													<div class="partRight"></div>
												</div>
												
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">Alt</div>
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">田</div>
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">Fn</div>
												<div class="keycapBlock keySimpleBottom" style="width: 76px;">Ctrl</div>
											</div>
										</div>
									</div>
									
									<div style="float: left; width: 196px; margin-left: 10px;">
										<!-- 功能键 -->
										<div class="keyArea" style="">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keySimple" style="">Ins</div>
												<div class="keycapBlock keySimple" style="">Home</div>
												<div class="keycapBlock keySimple" style="">PgUp</div>
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keySimple" style="">Del</div>
												<div class="keycapBlock keySimple" style="">End</div>
												<div class="keycapBlock keySimple" style="">PgDn</div>
												
											</div>
											
										</div>
									
										<!-- 方向键 -->
										<div class="keyArea" style="padding-bottom: 0; margin-top: 60px; margin-left: 64px;">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keySimple" style="">↑</div>
											</div>
										</div>
										<div class="keyArea" style="">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keySimple" style="">←</div>
												<div class="keycapBlock keySimple" style="">↓</div>
												<div class="keycapBlock keySimple" style="">→</div>
												
											</div>
										</div>
									</div>
									
									<div style="float: left; width: 260px; margin-left: 10px;">
										<!-- 小键盘 -->
										
										<div class="keyArea" style="">
											<div style="width: 192px; float: left;">
												<div class="oneKeyRow" style="">
													<div class="keycapBlock keySimple" style="">Num</div>
													<div class="keycapBlock keySimple" style="">/</div>
													<div class="keycapBlock keySimple" style="">*</div>
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock keySimple" style="">7</div>
													<div class="keycapBlock keySimple" style="">8</div>
													<div class="keycapBlock keySimple" style="">9</div>
													
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock keySimple" style="">4</div>
													<div class="keycapBlock keySimple" style="">5</div>
													<div class="keycapBlock keySimple" style="">6</div>
													
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock keySimple" style="">1</div>
													<div class="keycapBlock keySimple" style="">2</div>
													<div class="keycapBlock keySimple" style="">3</div>
													
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock partMain" style="width: 124px;">
														<div class="partLeft"></div>
														<div class="partHeng" style="width: 104px;">0</div>
														<div class="partRight"></div>
													</div>
													<div class="keycapBlock keySimple" style="">.</div>
													
												</div>
											</div>
											
											<div style="width: 64px; float: left;">
												<div class="oneKeyRow" style="">
													<div class="keycapBlock keySimple" style="">-</div>
													<div class="keycapBlock partMain" style="height: 124px;">
														<div class="partTop"></div>
														<div class="partShu" style="height: 104px;">+</div>
														<div class="partBottom"></div>
													</div>
													<div class="keycapBlock partMain" style="height: 124px;">
														<div class="partTop"></div>
														<div class="partShu" style="height: 104px;">Enter</div>
														<div class="partBottom"></div>
													</div>
												</div>
											</div>
											
											
											
										</div>
									</div>
								</div>
								
								<div style="clear: both;"></div>
								
								
							</div>
							
							
							
							
							
							
							
							
							
							
							
							
							<!-- ===================================================================================================================== -->
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
