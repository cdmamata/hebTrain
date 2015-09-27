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
				background-color: purple;
				float: left;
				padding-bottom: 2px;
				padding-right: 2px;
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
				margin-top: 2px;
				margin-left: 2px;
				overflow: hidden;
				text-align: center;
				line-height: 30px;
				font-weight: bolder;
				background-color: #DEACAF;
			}
			
			/** 正方形按键 **/
			.squareKey{
				width: 60px;
				height: 60px;
				background: url(img/key/keySimple.gif) no-repeat;
				background-color: #E1C885;
			}
			/** 删除按键 **/
			.keyBak{
				width: 120px;
				height: 60px;
				background: url(img/key/key-bak.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** tab按键 **/
			.keyTab{
				width: 120px;
				height: 60px;
				background: url(img/key/key-tab.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** 竖线按键 **/
			.keyShuxian{
				width: 91px;
				height: 60px;
				background: url(img/key/key-shuxian.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** Caps按键 **/
			.keyCaps{
				width: 114px;
				height: 60px;
				background: url(img/key/key-caps.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** 字母区 回车 按键 **/
			.keyEnterWidth{
				width: 128px;
				height: 60px;
				background: url(img/key/key-enterWidth.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** 字母区 回车 按键 **/
			.keyShiftLeft{
				width: 147px;
				height: 60px;
				background: url(img/key/key-shiftLeft.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** 字母区 回车 按键 **/
			.keyShiftRight{
				width: 157px;
				height: 60px;
				background: url(img/key/key-shiftRight.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** 字母区 回车 按键 **/
			.keyCtrlLeft{
				width: 74px;
				height: 60px;
				background: url(img/key/key-ctrlLeft.gif) no-repeat;
				background-color: #DEACAF;
			}
			/** 字母区 回车 按键 **/
			.keySpace{
				width: 394px;
				height: 60px;
				background: url(img/key/key-space.gif) no-repeat;
				background-color: #DEACAF;
			}
			
			
			/** 字母区 回车 按键 **/
			.keyZero{
				width: 122px;
				height: 60px;
				background: url(img/key/key-zero.gif) no-repeat;
				background-color: #DEACAF;
			}
			
			/** 字母区 回车 按键 **/
			.keyHeight{
				width: 60px;
				height: 122px;
				background: url(img/key/key-height.gif) no-repeat;
				background-color: #DEACAF;
			}
			
			/** 颜色值域 **/
			.colorInput{
				width: 60px;
				position: absolute;
				top: 0;
			}
			
			.colorInput input[type='text']{
				width: 60px;
				color: red;
				
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
						<div class="contentMiddleRevis" style="width: 1500px;">
							
							<!-- ===================================================================================================================== -->
							
							
							<div id="colorKeyDIv" style="background: url(img/key/chuYin.jpg) no-repeat; width: 1390px; border: 4px solid black; padding: 20px; margin-top: 20px;">
								
								<div>
									<!-- esc 区 -->
									<div class="keyArea" style="width: 62px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock squareKey" style="position: relative;">Esc
												<div class="colorInput">
													<input type="text" class="" style="">
													<input type="button" value="确定">
												</div>
											</div>
										</div>
									</div>
									
									<!-- F1 - F4区 -->
									<div class="keyArea" style="width: 248px; margin-left: 60px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock squareKey" style="">F1</div>
											<div class="keycapBlock squareKey" style="">F2</div>
											<div class="keycapBlock squareKey" style="">F3</div>
											<div class="keycapBlock squareKey" style="">F4</div>
										</div>
									</div>
									
									<!-- F5 - F8区 -->
									<div class="keyArea" style="width: 248px; margin-left: 28px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock squareKey" style="">F5</div>
											<div class="keycapBlock squareKey" style="">F6</div>
											<div class="keycapBlock squareKey" style="">F7</div>
											<div class="keycapBlock squareKey" style="">F8</div>
											
										</div>
									</div>
									
									<!-- F9 - F12区 -->
									<div class="keyArea" style="width: 248px; margin-left: 28px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock squareKey" style="">F9</div>
											<div class="keycapBlock squareKey" style="">F10</div>
											<div class="keycapBlock squareKey" style="">F11</div>
											<div class="keycapBlock squareKey" style="">F12</div>
											
										</div>
									</div>
									
									<!-- print 功能区 -->
									<div class="keyArea" style="width: 186px; margin-left: 10px;">
										<div class="oneKeyRow" style="">
											<div class="keycapBlock squareKey" style="">PrtSc</div>
											<div class="keycapBlock squareKey" style="">Scroll</div>
											<div class="keycapBlock squareKey" style="">Pause</div>
											
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
									<div style="width: 930px; float: left;">
										<!-- 字母区 -->
										<div class="keyArea" style="width: 928px;">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock squareKey" style="">`~</div>
												<div class="keycapBlock squareKey" style="">1</div>
												<div class="keycapBlock squareKey" style="">2</div>
												<div class="keycapBlock squareKey" style="">3</div>
												<div class="keycapBlock squareKey" style="">4</div>
												<div class="keycapBlock squareKey" style="">5</div>
												<div class="keycapBlock squareKey" style="">6</div>
												<div class="keycapBlock squareKey" style="">7</div>
												<div class="keycapBlock squareKey" style="">8</div>
												<div class="keycapBlock squareKey" style="">9</div>
												<div class="keycapBlock squareKey" style="">0</div>
												<div class="keycapBlock squareKey" style="">-</div>
												<div class="keycapBlock squareKey" style="">=</div>
												<div class="keycapBlock keyBak" style="width: 120px;">←bak</div>
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keyTab" style="width: 89px;">tab</div>
												<div class="keycapBlock squareKey" style="">Q</div>
												<div class="keycapBlock squareKey" style="">W</div>
												<div class="keycapBlock squareKey" style="">E</div>
												<div class="keycapBlock squareKey" style="">R</div>
												<div class="keycapBlock squareKey" style="">T</div>
												<div class="keycapBlock squareKey" style="">Y</div>
												<div class="keycapBlock squareKey" style="">U</div>
												<div class="keycapBlock squareKey" style="">I</div>
												<div class="keycapBlock squareKey" style="">O</div>
												<div class="keycapBlock squareKey" style="">P</div>
												<div class="keycapBlock squareKey" style="">[</div>
												<div class="keycapBlock squareKey" style="">]</div>
												<div class="keycapBlock keyShuxian" style="width: 91px;">|</div>
												
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keyCaps" style="width: 114px;">Caps</div>
												<div class="keycapBlock squareKey" style="">A</div>
												<div class="keycapBlock squareKey" style="">S</div>
												<div class="keycapBlock squareKey" style="">D</div>
												<div class="keycapBlock squareKey" style="">F</div>
												<div class="keycapBlock squareKey" style="">G</div>
												<div class="keycapBlock squareKey" style="">H</div>
												<div class="keycapBlock squareKey" style="">J</div>
												<div class="keycapBlock squareKey" style="">K</div>
												<div class="keycapBlock squareKey" style="">L</div>
												<div class="keycapBlock squareKey" style="">;</div>
												<div class="keycapBlock squareKey" style="">"</div>
												<div class="keycapBlock keyEnterWidth" style="width: 128px;">Enter</div>
												
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keyShiftLeft" style="width: 147px;">Shift</div>
												<div class="keycapBlock squareKey" style="">Z</div>
												<div class="keycapBlock squareKey" style="">X</div>
												<div class="keycapBlock squareKey" style="">C</div>
												<div class="keycapBlock squareKey" style="">V</div>
												<div class="keycapBlock squareKey" style="">B</div>
												<div class="keycapBlock squareKey" style="">N</div>
												<div class="keycapBlock squareKey" style="">M</div>
												<div class="keycapBlock squareKey" style="">&lt;</div>
												<div class="keycapBlock squareKey" style="">&gt;</div>
												<div class="keycapBlock squareKey" style="">?</div>
												<div class="keycapBlock keyShiftRight" style="width: 157px;">Shift</div>
												
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">Ctrl</div>
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">田</div>
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">Alt</div>
												<div class="keycapBlock keySpace" style="width: 394px;">Space</div>
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">Alt</div>
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">田</div>
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">Fn</div>
												<div class="keycapBlock keyCtrlLeft" style="width: 74px;">Ctrl</div>
												
											</div>
										</div>
									</div>
									
									<div style="float: left; width: 186px; margin-left: 10px;">
										<!-- 功能键 -->
										<div class="keyArea" style="width: 186px; height: 124px;">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock squareKey" style="">Ins</div>
												<div class="keycapBlock squareKey" style="">Home</div>
												<div class="keycapBlock squareKey" style="">PgUp</div>
												
											</div>
											
											<div class="oneKeyRow" style="">
												<div class="keycapBlock squareKey" style="">Del</div>
												<div class="keycapBlock squareKey" style="">End</div>
												<div class="keycapBlock squareKey" style="">PgDn</div>
												
											</div>
											
										</div>
									
										<!-- 方向键 -->
										<div class="keyArea" style="padding-bottom: 0; width: 62px; height: 62px; margin-top: 60px; margin-left: 62px;">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock squareKey" style="">↑</div>
											</div>
										</div>
										<div class="keyArea" style="width: 186px; height: 62px;">
											<div class="oneKeyRow" style="">
												<div class="keycapBlock squareKey" style="">←</div>
												<div class="keycapBlock squareKey" style="">↓</div>
												<div class="keycapBlock squareKey" style="">→</div>
												
											</div>
										</div>
									</div>
									
									<div style="float: left; width: 248px; margin-left: 10px;">
										<!-- 小键盘 -->
										
										
										<div class="keyArea" style="width: 248px;">
											<div style="width: 186px; float: left;">
												<div class="oneKeyRow" style="">
													<div class="keycapBlock squareKey" style="">Num</div>
													<div class="keycapBlock squareKey" style="">/</div>
													<div class="keycapBlock squareKey" style="">*</div>
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock squareKey" style="">7</div>
													<div class="keycapBlock squareKey" style="">8</div>
													<div class="keycapBlock squareKey" style="">9</div>
													
												</div>
												
												<div class="oneKeyRow" style="width: 186px; ">
													<div class="keycapBlock squareKey" style="">4</div>
													<div class="keycapBlock squareKey" style="">5</div>
													<div class="keycapBlock squareKey" style="">6</div>
													
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock squareKey" style="">1</div>
													<div class="keycapBlock squareKey" style="">2</div>
													<div class="keycapBlock squareKey" style="">3</div>
													
												</div>
												
												<div class="oneKeyRow" style="">
													<div class="keycapBlock keyZero" style="width: 122px;">0</div>
													<div class="keycapBlock squareKey" style="">.</div>
													
												</div>
											</div>
											
											<div style="width: 62px; float: left;">
												<div class="oneKeyRow" style="">
													<div class="keycapBlock squareKey" style="">-</div>
													<div class="keycapBlock keyHeight" style="height: 122px;">+</div>
													<div class="keycapBlock keyHeight" style="height: 122px;">Enter</div>
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
