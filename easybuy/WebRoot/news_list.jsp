<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link type="text/css" rel="stylesheet" href="<%=path %>/css/style.css" />
<style type="text/css">
.classlist{
	width:550px;
	font-size: 14px;
}
.classlist li{
	width:550px;
}
.classlist span{

}
</style>
<script type="text/javascript" src="<%=path %>/scripts/function.js"></script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="<%=path %>/index.jsp">易买网</a> &gt; 新闻列表
</div>
<div id="main" class="wrap">
	<div class="left-side">
			<jsp:include page="/inc/news_list.jsp" ></jsp:include>
	</div>
	<div id="news" class="right-main">
		
		<div class="content">
			 <ul class="classlist" >
      	
      	<c:forEach items="${pager.data }" var="news">
      		<li><a href="${pageContext.request.contextPath }/news/viewbyid?id=${news.enId}">${news.enTitle }</a>
      		<span>${news.formatDate }</span></li>
      	</c:forEach>
      		
       </ul>
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