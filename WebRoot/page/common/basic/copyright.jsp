<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<style type="text/css">
	.copyrightFrameBorder{
		border-top: solid #9A9A9A 1px;
		border-right: 0;
		border-bottom: solid #9A9A9A 1px;
		border-left: 0;
		height: auto;
	}
	.copyrightMiddle{
		height: 40px;
		text-align: center;
		background: #eeeeee;
		font-size: x-small;
		line-height: 40px;
		font-family: serif;
	}
	
</style>

<div class="copyrightFrameBorder">
	<div class="copyrightMiddle"></div>
</div>

