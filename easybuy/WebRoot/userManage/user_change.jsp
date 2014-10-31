<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" >
	<jsp:param value="1" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/user_left.jsp" ></jsp:include>
	<div class="main">
		<h2>修改用户信息</h2>
		<div class="manage">
			<form action="<%=request.getContextPath()%>/user/user_updateUser" method="post">
				<input type="hidden" name="id" value="${user.euUserId}"/>
				<table class="form">
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="userName" value="${user.euUserName}" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">姓名：</td>
						<td><input type="text" class="text" name="name" value="${user.euRealName}" /></td>
					</tr>
					<tr>
						<td class="field">性别: </td>
						<td>
						<input type="radio" name="sex" value="男" <c:if test="${user.euSex=='男'}">checked="checked"</c:if>/>男 <input type="radio" name="sex" value="女" <c:if test="${user.euSex=='女'}">checked="checked"</c:if> />女
						</td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<select name="birthyear">
									<c:forEach begin="1930" end="2013" varStatus="i">
								<c:if test="${i.index==birthyear }">
								<option selected="selected" value="${i.index }">${i.index }</option>
								</c:if>
								<c:if test="${i.index!=birthyear }">
								<option value="${i.index }">${i.index }</option>
								</c:if>
								</c:forEach>
							</select>年
							<select name="birthmonth">
									<c:forEach begin="1" end="12" varStatus="i">
								<c:if test="${i.index==birthmonth }">
								<option selected="selected" value="${i.index }">${i.index }</option>
								</c:if>
								<c:if test="${i.index!=birthmonth }">
								<option value="${i.index }">${i.index }</option>
								</c:if>
								</c:forEach>
							</select>月
							<select name="birthday">
								<c:forEach begin="1" end="31" varStatus="i">
								<c:if test="${i.index==birthday }">
								<option selected="selected" value="${i.index }">${i.index }</option>
								</c:if>
								<c:if test="${i.index!=birthday }">
								<option value="${i.index }">${i.index }</option>
								</c:if>
								</c:forEach>
							</select>日
						</td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input type="text" class="text" name="email" value="${user.euEmail}" /></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="mobile" value="${user.euMobile}" /></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><input type="text" class="text" name="address" value="${user.euAddress}" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
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
