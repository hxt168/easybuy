<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		location.href = "${pageContext.request.contextPath}/news/manage_del?id=" + id;
		}
	}
</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="5" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>新闻管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>新闻标题</th>
					<th>操作</th>
				</tr>
				
				<c:forEach items="${pager.data}" var="news">
				<tr>
					<td class="first w4 c">${news.enId }</td>
					<td><a href="${pageContext.request.contextPath }/news/viewbyid?id=${news.enId }" >${news.enTitle }</a></td>
					<td class="w1 c"><a href="${pageContext.request.contextPath }/news/manage_modify?id=${news.enId }">修改</a> <a href="javascript:del(${news.enId });">删除</a></td>
				</tr>
				</c:forEach>
				
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
