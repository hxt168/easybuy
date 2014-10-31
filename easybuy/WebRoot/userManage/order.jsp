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
	<jsp:param value="3" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/user_left.jsp" ></jsp:include>
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				
			</div>
			<div class="spacer"></div>
			<table class="list">
				<tr>
					<th>ID</th>
					<th>订购时间</th>
					<th>总金额</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<c:if test="${hasnull==null }">
					<c:forEach items="${orderlist.data}" var="order">
				<tr>
					<td class="first w4 c">${order.eoId }</td>
					<td class="w1 c">${order.formatDate }</td>
					<td class="w1 c">${order.eoCost }</td>
					<td class="w1 c">${order.status }</td>
					<td class="w1 c"><a href="${pageContext.request.contextPath}/order/user_view?oid=${order.eoId}">查看</a></td>
				</tr>
			</c:forEach>
				</c:if>
				<c:if test="${hasnull==1 }">
				<tr><td colspan="5" align="center">您还未有购买订单。</td></tr>
				</c:if>
			</table>
			<div class="pager">
				<ul class="clearfix">
					<jsp:include page="/inc/pager.jsp">
	    				<jsp:param value="${orderlist.totalRecord}" name="items"/>
	    				<jsp:param value="${orderlist.pageSize}" name="pageSize"/>
	    				<jsp:param value="${orderlist.totalpage}" name="totalPage"/>
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
