<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script type="text/javascript">
	function delParentClass(pid)
	{
		if(confirm("确定要删除吗？")) {
		location.href = "${pageContext.request.contextPath}/category/manage_pdel?pid=" + pid;
		}
	}
	function delChildClass(cid)
	{
		if(confirm("确定要删除吗？")) {
		location.href = "${pageContext.request.contextPath}/category/manage_cdel?cid=" + cid;
		}
	}

</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="2" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>分类管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>分类名称</th>
					<th>操作</th>
				</tr>
				
				<c:forEach items="${pc }" var="pCategory">
				<tr>
					<td class="first w4 c">${pCategory.epcParentId }</td>
					<td>${pCategory.epcParentName }</td>
					<td class="w1 c"><a href="${pageContext.request.contextPath}/category/manage_modify?pid=${pCategory.epcParentId }">修改</a> <a href="javascript:delParentClass(${pCategory.epcParentId });" >删除</a></td>
				</tr>
				<c:forEach items="${pCategory.list }" var="category">
				<tr>
					<td class="first w4 c">${category.epcId }</td>
					<td class="childClass">${category.epcName }</td>
					<td class="w1 c"><a href="${pageContext.request.contextPath}/category/manage_modify?cid=${category.epcId }">修改</a> <a href="javascript:delChildClass(${category.epcId });">删除</a></td>
				</tr>
				</c:forEach>
			
			</c:forEach>	
				
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
