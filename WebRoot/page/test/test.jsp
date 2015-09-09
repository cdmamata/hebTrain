<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'test.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<jsp:include page="/page/common/util/jquery-loder.jsp" flush="true" />
		<jsp:include page="/page/common/util/jquery-logger-loder.jsp" flush="true" />
		
		<script type="text/javascript">
			var testNumber = 9;
			
			function printTest(){
				$("#loggerId").logger("ssss");
			}
			
			function loggerTest(){
				
				var a = {"list" : [{"a" : 1, "b" : 2}]};
				var b = {"list" :[{"c" : 3, "d" : 4}]};
				
				a["list"].push(b["list"]);
				
				console.log(a);
				
				
				var testClass = $("#classTestDiv").attr("class");
				
				console.log(testClass + '####');
				
				var level = $("#logLevel").val();
				
				var msg = $("#logMsg").val();
				
				$("#loggerId").logger(level, msg);
				
			}
			
			
		</script>
		<script type="text/javascript" src=""></script>

	</head>

	<body>
		<div style="margin-left: 400px;">
			<br/><br/>
			<input type="button" value="测试" onclick="printTest()">
			
			<br/><br/>
			<form action="servlet/testser" method="post">
				
				<input type="submit" value="POST">
			</form>
			<a href="servlet/testser">GET</a>
			
			<hr/>
			
			级别：<input type="text" id="logLevel"/>
			<br/><br/>
			内容：<input type="text" id="logMsg"/>
			<br/><br/>
			<input type="button" value="logger" onclick="loggerTest()"/>
			
			
			<div id="classTestDiv" class="abc"></div>
			
			<div id="loggerId" style="border: solid 1px #9D9D9D; width: 1000px; height: 200px;">
				<table class="jq-logger-main-table" cellspacing='0' cellpadding='0'>
					<tr class="jq-logger-white-line">
						<td class="jq-logger-timestamp-style">
							2015-06-04 18:36:20
						</td>
						<td class="jq-logger-info-msg">
							
						</td>
					</tr>
					
					<tr class="jq-logger-gray-line">
						<td class="jq-logger-timestamp-style">
							2015-06-04 18:36:20
						</td>
						<td class="jq-logger-error-msg">
							测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试
						</td>
					</tr>
					
					<tr class="jq-logger-white-line">
						<td>
							
						</td>
						<td>
						
						</td>
					</tr>
					
					<tr class="jq-logger-gray-line">
						<td>
						
						</td>
						<td>
						
						</td>
					</tr>
					
				</table>
				
				
				
			</div>
		</div>
	</body>
</html>
