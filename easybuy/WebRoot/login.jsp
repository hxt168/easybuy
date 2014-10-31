<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="<%=path %>/css/style.css" />
<script type="text/javascript" src="<%=path %>/scripts/function.js"></script>
<script type="text/javascript" src="<%=path %>/scripts/md5.js"></script>
<script type="text/javascript">
	function loadimage(){ 
		document.getElementById("randImage").src = "<%=path %>/image.jsp?"+Math.random(); 
	}
	function checks(ob)
	{
		if(checkForm(ob))
		{
			var pwd=document.getElementById("passWord").value;
			pwd=hex_md5(hex_md5(pwd));
			pwd=pwd.substr(8,16);
			document.getElementById("passWord").value=pwd;
		}
	}
</script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎回到易买网</h1>
			<form id="loginForm" method="post" action="<%=path%>/user/_login" onsubmit="return checks(this)">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td><input class="text" type="text" name="userName" value="${userName }" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">登录密码：</td>
						<td><input class="text" type="password" id="passWord" name="passWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">验证码：</td>
						<td><input class="text verycode" type="text" name="code" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><a href="javascript:loadimage();"> <img width="60" height="25" id="randImage" align="top" src="<%=path%>/image.jsp" /></a><span></span></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="立即登录" /></label></td>
					</tr>
				</table>
				<span style="color:red">${msg}</span>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>