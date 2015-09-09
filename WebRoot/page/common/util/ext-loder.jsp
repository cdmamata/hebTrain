<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=path%>/js-lib/ext4/resources/css/ext-all-gray.css">

<script type="text/javascript" src="<%=path%>/js-lib/ext4/ext-all.js" charset="UTF-8"></script>
 
<script type="text/javascript" src="<%=path%>/js-lib/ext4/locale/ext-lang-zh_CN.js" charset="UTF-8"></script>

<!-- user setting -->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/basic/ext-user-basic.css">
<script type="text/javascript" src="<%=path%>/js/basic/ext-user-basic.js"></script>

<script type="text/javascript">
	/** 当前用户的客户名称 **/
	sessionUserCustomerName = "${sessionLoginUser.userName}";
	
</script>