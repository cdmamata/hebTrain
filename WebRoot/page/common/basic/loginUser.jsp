<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<style type="text/css">
	#loginUserTable a {text-decoration:none; color: #09f; outline:none;}
	#loginUserTable a:visited {color: #09f}
	#loginUserTable a:hover{ text-decoration:underline;}
	
	#loginUserTable{background-color: #A7CBF6;}
</style>

<script type="text/javascript">
	function logout(){
		var flag = confirm("确实要退出登录吗？");
		
		if(flag){
			window.location.href = "logout";
		}
	}
</script>

<table id="loginUserTable" width="100%" height="30px" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
		
		<td align="center" width="250px;">
			<div style="width: 80px; float: left; font-weight: bolder; color: #fff;">用户名:</div>
			<c:if test='${sessionLoginUser != null}'>
				<div style="color: #ffc; width: 50px; float: left; font-weight: bolder;">
					${sessionLoginUser.userName}
				</div>
			</c:if>
			<c:if test='${sessionLoginUser == null}'>
				<div style="color: #ffc; width: 50px; float: left; font-weight: bolder;">
					游客
				</div>
			</c:if>
		</td>
		<td	width="90px;">
			<c:if test='${sessionLoginUser != null}'>
				<a href="opfun?k=editpsd">修改密码</a>
			</c:if>
		</td>
		<td width="60px">
			<c:if test='${sessionLoginUser != null}'>
				<a href="javascript:void(0)" onclick="logout()">注销</a>
			</c:if>
			
			<c:if test='${sessionLoginUser == null}'>
				<a href="login">登录</a>
			</c:if>
		</td>
		
	</tr>
</table>
