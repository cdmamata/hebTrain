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
		
		<jsp:include page="/page/common/util/jquery-loder.jsp" flush="true" />
		
		
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/open/keybord/keycapColor.css" />
		
		<script type="text/javascript">
		
		
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
						<div class="contentMiddleRevis" style="width: 1600px;">
							
							<!-- ===================================================================================================================== -->
							
							
							<div id="colorKeyDIv" style="background: url(img/key/chuYin.jpg) no-repeat; width: 1388px; border: 4px solid black; padding: 20px; margin-top: 20px;">
								
								<div>
									<!-- esc 区 -->
									<div class="keyArea" style="width: 62px;">
										<div class="oneKeyRow">
											<div class="keycapBlock keySimple" id="esc">
												Esc
												<div class="colorInput">
													<input type="text" class="">
													<input type="button" value="确定">
												</div>
											</div>
										</div>
									</div>
									
									<!-- F1 - F4区 -->
									<div class="keyArea" style="width: 248px; margin-left: 60px;">
										<div class="oneKeyRow">
											<div class="keycapBlock keySimple" id="f1">F1</div>
											<div class="keycapBlock keySimple" id="f2">F2</div>
											<div class="keycapBlock keySimple" id="f3">F3</div>
											<div class="keycapBlock keySimple" id="f4">F4</div>
										</div>
									</div>
									
									<!-- F5 - F8区 -->
									<div class="keyArea" style="width: 248px; margin-left: 28px;">
										<div class="oneKeyRow">
											<div class="keycapBlock keySimple" id="f5">F5</div>
											<div class="keycapBlock keySimple" id="f6">F6</div>
											<div class="keycapBlock keySimple" id="f7">F7</div>
											<div class="keycapBlock keySimple" id="f8">F8</div>
											
										</div>
									</div>
									
									<!-- F9 - F12区 -->
									<div class="keyArea" style="width: 248px; margin-left: 28px;">
										<div class="oneKeyRow">
											<div class="keycapBlock keySimple" id="f9">F9</div>
											<div class="keycapBlock keySimple" id="f10">F10</div>
											<div class="keycapBlock keySimple" id="f11">F11</div>
											<div class="keycapBlock keySimple" id="f12">F12</div>
											
										</div>
									</div>
									
									<!-- print 功能区 -->
									<div class="keyArea" style="width: 186px; margin-left: 10px;">
										<div class="oneKeyRow">
											<div class="keycapBlock keySimple" id="prtsc">PrtSc</div>
											<div class="keycapBlock keySimple" id="scroll">Scroll</div>
											<div class="keycapBlock keySimple" id="pause">Pause</div>
											
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
										<div class="keyArea">
											<div class="oneKeyRow">
												<div class="keycapBlock keySimple" id="wave">`~</div>
												<div class="keycapBlock keySimple" id="top-1">1</div>
												<div class="keycapBlock keySimple" id="top-2">2</div>
												<div class="keycapBlock keySimple" id="top-3">3</div>
												<div class="keycapBlock keySimple" id="top-4">4</div>
												<div class="keycapBlock keySimple" id="top-5">5</div>
												<div class="keycapBlock keySimple" id="top-6">6</div>
												<div class="keycapBlock keySimple" id="top-7">7</div>
												<div class="keycapBlock keySimple" id="top-8">8</div>
												<div class="keycapBlock keySimple" id="top-9">9</div>
												<div class="keycapBlock keySimple" id="top-0">0</div>
												<div class="keycapBlock keySimple" id="top-subtract">-</div>
												<div class="keycapBlock keySimple" id="top-equal">=</div>
												<div class="keycapBlock partMain" id="top-bak" style="width: 120px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 100px;">←Bak</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow">
												<div class="keycapBlock partMain" id="word-tab" style="width: 89px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 69px;">Tab</div>
													<div class="partRight"></div>
												</div>
												<div class="keycapBlock keySimple" id="word-q">Q</div>
												<div class="keycapBlock keySimple" id="word-w">W</div>
												<div class="keycapBlock keySimple" id="word-e">E</div>
												<div class="keycapBlock keySimple" id="word-r">R</div>
												<div class="keycapBlock keySimple" id="word-t">T</div>
												<div class="keycapBlock keySimple" id="word-y">Y</div>
												<div class="keycapBlock keySimple" id="word-u">U</div>
												<div class="keycapBlock keySimple" id="word-i">I</div>
												<div class="keycapBlock keySimple" id="word-o">O</div>
												<div class="keycapBlock keySimple" id="word-p">P</div>
												<div class="keycapBlock keySimple" id="word-bracket-left">[</div>
												<div class="keycapBlock keySimple" id="word-bracket-right">]</div>
												<div class="keycapBlock partMain" id="word-slash" style="width: 91px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 71px;">\|</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow">
												<div class="keycapBlock partMain" id="word-caps" style="width: 114px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 94px;">Caps</div>
													<div class="partRight"></div>
												</div>
												<div class="keycapBlock keySimple" id="word-a">A</div>
												<div class="keycapBlock keySimple" id="word-s">S</div>
												<div class="keycapBlock keySimple" id="word-d">D</div>
												<div class="keycapBlock keySimple" id="word-f">F</div>
												<div class="keycapBlock keySimple" id="word-g">G</div>
												<div class="keycapBlock keySimple" id="word-h">H</div>
												<div class="keycapBlock keySimple" id="word-j">J</div>
												<div class="keycapBlock keySimple" id="word-k">K</div>
												<div class="keycapBlock keySimple" id="word-l">L</div>
												<div class="keycapBlock keySimple" id="word-semicolon">;</div>
												<div class="keycapBlock keySimple" id="word-quotes">"</div>
												<div class="keycapBlock partMain" id="word-enter" style="width: 128px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 108px;">Enter</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow">
												<div class="keycapBlock partMain" id="word-shift-left" style="width: 151px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 127px;">Shift</div>
													<div class="partRight"></div>
												</div>
												<div class="keycapBlock keySimple" id="word-z">Z</div>
												<div class="keycapBlock keySimple" id="word-x">X</div>
												<div class="keycapBlock keySimple" id="word-c">C</div>
												<div class="keycapBlock keySimple" id="word-v">V</div>
												<div class="keycapBlock keySimple" id="word-b">B</div>
												<div class="keycapBlock keySimple" id="word-n">N</div>
												<div class="keycapBlock keySimple" id="word-m">M</div>
												<div class="keycapBlock keySimple" id="word-less">&lt;</div>
												<div class="keycapBlock keySimple" id="word-great">&gt;</div>
												<div class="keycapBlock keySimple" id="word-ask">?</div>
												<div class="keycapBlock partMain" id="word-shift-right" style="width: 153px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 133px;">Shift</div>
													<div class="partRight"></div>
												</div>
											</div>
											
											<div class="oneKeyRow">
												<div class="keycapBlock keySimpleBottom" id="word-ctrl-left">Ctrl</div>
												<div class="keycapBlock keySimpleBottom" id="word-win-left">田</div>
												<div class="keycapBlock keySimpleBottom" id="word-alt-left">Alt</div>
												<div class="keycapBlock partMain" id="word-space" style="width: 380px;">
													<div class="partLeft"></div>
													<div class="partHeng" style="width: 360px;">Space</div>
													<div class="partRight"></div>
												</div>
												
												<div class="keycapBlock keySimpleBottom" id="word-alt-right">Alt</div>
												<div class="keycapBlock keySimpleBottom" id="word-win-right">田</div>
												<div class="keycapBlock keySimpleBottom" id="word-fn">Fn</div>
												<div class="keycapBlock keySimpleBottom" id="word-ctrl-right">Ctrl</div>
											</div>
										</div>
									</div>
									
									<div style="float: left; width: 188px; margin-left: 10px;">
										<!-- 功能键 -->
										<div class="keyArea">
											<div class="oneKeyRow">
												<div class="keycapBlock keySimple" id="ins">Ins</div>
												<div class="keycapBlock keySimple" id="home">Home</div>
												<div class="keycapBlock keySimple" id="pgup">PgUp</div>
											</div>
											
											<div class="oneKeyRow">
												<div class="keycapBlock keySimple" id="del">Del</div>
												<div class="keycapBlock keySimple" id="end">End</div>
												<div class="keycapBlock keySimple" id="pgdn">PgDn</div>
												
											</div>
											
										</div>
									
										<!-- 方向键 -->
										<div class="keyArea" style="padding-bottom: 0; margin-top: 60px; margin-left: 64px;">
											<div class="oneKeyRow">
												<div class="keycapBlock keySimple" id="direction-up">↑</div>
											</div>
										</div>
										<div class="keyArea">
											<div class="oneKeyRow">
												<div class="keycapBlock keySimple" id="direction-left">←</div>
												<div class="keycapBlock keySimple" id="direction-down">↓</div>
												<div class="keycapBlock keySimple" id="direction-right">→</div>
												
											</div>
										</div>
									</div>
									
									<div style="float: left; width: 250px; margin-left: 10px;">
										<!-- 小键盘 -->
										
										<div class="keyArea">
											<div style="width: 186px; float: left;">
												<div class="oneKeyRow">
													<div class="keycapBlock keySimple" id="num-numlk">Num</div>
													<div class="keycapBlock keySimple" id="num-slash">/</div>
													<div class="keycapBlock keySimple" id="num-star">*</div>
												</div>
												
												<div class="oneKeyRow">
													<div class="keycapBlock keySimple" id="num-7">7</div>
													<div class="keycapBlock keySimple" id="num-8">8</div>
													<div class="keycapBlock keySimple" id="num-9">9</div>
													
												</div>
												
												<div class="oneKeyRow">
													<div class="keycapBlock keySimple" id="num-4">4</div>
													<div class="keycapBlock keySimple" id="num-5">5</div>
													<div class="keycapBlock keySimple" id="num-6">6</div>
													
												</div>
												
												<div class="oneKeyRow">
													<div class="keycapBlock keySimple" id="num-1">1</div>
													<div class="keycapBlock keySimple" id="num-2">2</div>
													<div class="keycapBlock keySimple" id="num-3">3</div>
													
												</div>
												
												<div class="oneKeyRow">
													<div class="keycapBlock partMain" id="num-0" style="width: 122px;">
														<div class="partLeft"></div>
														<div class="partHeng" style="width: 102px;">0</div>
														<div class="partRight"></div>
													</div>
													<div class="keycapBlock keySimple" id="num-point">.</div>
													
												</div>
											</div>
											
											<div style="width: 62px; float: left;">
												<div class="oneKeyRow">
													<div class="keycapBlock keySimple" id="num-subtract">-</div>
													<div class="keycapBlock partMain" id="num-plus" style="height: 122px;">
														<div class="partTop"></div>
														<div class="partShu" style="height: 101px;">+</div>
														<div class="partBottom"></div>
													</div>
													<div class="keycapBlock partMain" id="num-enter" style="height: 122px;">
														<div class="partTop"></div>
														<div class="partShu" style="height: 101px;">Enter</div>
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
