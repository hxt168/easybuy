<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script type="text/javascript">
function del(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "${pageContext.request.contextPath}/comment/manage_del?ecId=" + id;
		}
}
</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="4" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>留言管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>昵称</th>
					<th>留言时间</th>
					<th>留言内容</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<c:forEach var="comment" items="${comments}">
					<tr>
						<td class="first w4 c">${comment.ecId }</td>
						<td class="w1 c">${comment.ecNickName }</td>
						<td class="w1 c">${comment.ecCreateTime }</td>
						<td><pre>${comment.shortContent }</pre></td>
						<td class="w1 c">${comment.replyStr }</td>
						<td class="w1 c"><a href="${pageContext.request.contextPath}/comment/manage_up?id=${comment.ecId}">回复</a> 
						<a href="javascript:del(${comment.ecId });">删除</a></td>
					</tr>
				</c:forEach>
				
				
				
				<!--<tr>
					<td class="first w4 c">1</td>
					<td class="w1 c">张三丰</td>
					<td>高老庄的货发了没？</td>
					<td class="w1 c">已回复</td>
					<td class="w1 c"><a href="guestbook-modify.html">回复</a> <a href="javascript:Delete(1);">删除</a></td>
				</tr>
				-->
				
			</table>
			<div class="pager">
				<ul class="clearfix">
					<jsp:include page="/inc/pager.jsp">
	    				<jsp:param value="${pager.totalRecord}" name="items"/>
	    				<jsp:param value="${pager.pageSize}" name="pageSize"/>
	    				<jsp:param value="${pager.totalpage}" name="totalPage"/>
	    				<jsp:param value="${nowUrl}" name="url"/>
    				</jsp:include>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
