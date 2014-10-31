<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/function-manage.js"></script>
<script type="text/javascript">
function del(id,index){
		    var isflag=confirm("是否要删除该用户 信息？");
		    if(isflag){
			document.location = '<%=request.getContextPath()%>/user/manage_delUser?id='+id+'&pageOffset='+index;}
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
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>用户名</th>
					<th>性别</th>
					<th>Email</th>
					<th>手机</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${users}" var="user">
				<tr>
					<td class="first w4 c">${user.euUserId}</td>
					<td class="w1 c">${user.euUserName}</td>
					<td class="w2 c">${user.euSex}</td>
					<td>${user.euEmail}</td>
					<td class="w4 c">${user.euMobile}</td>
					<td class="w1 c"><a href="<%=request.getContextPath()%>/user/manage_modifyUser?id=${user.euUserId}&pageOffset=${page.pageOffset}">修改</a> <a onclick="del(${user.euUserId},${page.pageOffset})" href="#">删除</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="clear"></div>
	<div class="pager">
				<ul class="clearfix">
					<jsp:include page="/inc/pager.jsp">
	    				<jsp:param value="${page.totalRecord}" name="items"/>
	    				<jsp:param value="${page.pageSize}" name="pageSize"/>
	    				<jsp:param value="${page.totalpage}" name="totalPage"/>
	    				<jsp:param value="${nowUrl}" name="url"/>
    				</jsp:include>
				</ul>
			</div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
