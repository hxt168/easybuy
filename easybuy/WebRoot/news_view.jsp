<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=path %>/scripts/function.js"></script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="<%=path %>/index.jsp">易买网</a> &gt; 阅读新闻
</div>
<div id="main" class="wrap">
	<div class="left-side">
			<jsp:include page="/inc/news_list.jsp" ></jsp:include>
	</div>
	<div id="news" class="right-main">
	
		<h1 style="text-align:center">${news.enTitle }</h1>
		
		<div class="content">
			<div style="text-align:center" ><font color="grey"  >${news.formatDate }</font></div>
			${news.enContent }
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>