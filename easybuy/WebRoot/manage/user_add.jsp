<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/function-manage.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/md5.js"></script>
<script type="text/javascript">

	function checks()
	{
		var name=document.getElementById("userName").value;
		var pwd=document.getElementById("passWord").value;
		if(name=="")
		{
			document.getElementById("msgs").innerHTML="用户名不能为空";
			return false;
		}
		if(pwd=="")
		{
			document.getElementById("msgs").innerHTML="密码不能为空";
			return false;
		}
		
			pwd=hex_md5(hex_md5(pwd));
			pwd=pwd.substr(8,16);
			document.getElementById("passWord").value=pwd;
		return true;
	}
</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="1" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>新增用户</h2>
		<div class="manage">
			<form action="<%=request.getContextPath() %>/user/manage_addUser" method="post" onsubmit="return checks();">
				<table class="form" >
					<tr>
						<td class="field">用户名：</td>
						<td><input id="userName" type="text" class="text" name="userName" value="" /></td>
					</tr>
					<tr>
						<td class="field">姓名：</td>
						<td><input type="text" class="text" name="name" value="" /></td>
					</tr>
					<tr>
						<td class="field">密码：</td>
						<td><input type="text" class="text" id="passWord" name="passWord" value="" /></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td><input type="radio" name="sex" value="男 " checked="checked" />男 <input type="radio" name="sex" value="女" />女</td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<select name="birthyear">
							<c:forEach begin="1930" end="2013" varStatus="i">
								<option value="${i.index }">${i.index }</option>
							</c:forEach>	
							</select>年
							<select name="birthmonth">
								<c:forEach begin="1" end="12" varStatus="i">
								<option value="${i.index }">${i.index }</option>
							</c:forEach>	
								
							</select>月
							<select name="birthday">
								<c:forEach begin="1" end="31" varStatus="i">
								<option value="${i.index }">${i.index }</option>
							</c:forEach>	
							</select>日
						</td>
					</tr>
					<tr>
						<td class="field">状态：</td>
						<td><select name="status" >
							<option value="1">普通用户</option>
								<option value="2">管理员</option>
						</select></td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input type="text" class="text" name="email" value="" /></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="mobile" value="" /></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><input type="text" class="text" name="address" value="" /></td>
					</tr>
					<tr>
						<td>c</td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label> <font id="msgs" color="red"> </font></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
