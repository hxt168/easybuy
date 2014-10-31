<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/xhe/jquery/jquery-1.4.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/xhe/xheditor-1.1.14-zh-cn.min.js" ></script>
</head>
<body>

<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="4" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>回复留言</h2>
		<div class="manage">
			<form action="${pageContext.request.contextPath }/comment/manage_update" method="post">
				<table class="form">
					<tr>
						<td class="field">留言ID：</td>
						<td><input type="text" class="text" name="ecId" value="${comment.ecId }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">留言姓名：</td>
						<td><input type="text" class="text" name="name" value="${comment.ecNickName }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">留言内容：</td>
						<td>${comment.ecContent }</td>
					</tr>
					<tr>
						<td class="field">回复内容：</td>
						<td><textarea class="xheditor" name="replyContent" >${comment.ecReply }</textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="回复" /></label></td>
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
