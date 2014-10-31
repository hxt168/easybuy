<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/function.js"></script>

</head>
<body>
<jsp:include page="/inc/view_top.jsp" >
		<jsp:param value="${parentId}" name="parentId"/>
</jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="${pageContext.request.contextPath }/index.jsp">易买网</a> &gt; 
	<c:choose>
	<c:when test="${parentName!=null&&parentName!=''}">
	&gt;${parentName}</c:when>
	<c:when test="${category!=null}">
	<a href="<%=path%>/product/listByParent?id=${category.parentCategory.epcParentId}">${category.parentCategory.epcParentName}</a> &gt;${category.epcName}
	</c:when>
	<c:otherwise>
	&gt; 促销
	</c:otherwise>
	</c:choose>
	
</div>
<div id="main" class="wrap">
	<div class="lefter">
			<jsp:include page="/inc/category_left.jsp" ></jsp:include>
		<div class="spacer"></div>
		<jsp:include page="/inc/last_view.jsp" ></jsp:include>
	</div>
	<div class="main">
		<div class="product-list">
			<h2>全部商品</h2>
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
			<div class="clear"></div>
			<ul class="product clearfix">
			<c:forEach var="product" items="${pager.data}">
			<li>
					<dl>
						<dt><a href="<%=path%>/product/_view?epId=${product.epId}" target="_blank"><img src="<%=path%>${product.epFileName}" /></a></dt>
						<dd class="title"><a href="<%=path%>/product/_view?epId=${product.epId}" target="_blank">${product.epName}</a></dd>
						<dd class="price">${product.epPromotePrice}</dd>
					</dl>
			</li>
			</c:forEach>
		
			</ul>
			<div class="clear"></div>
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