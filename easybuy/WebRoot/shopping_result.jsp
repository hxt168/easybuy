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
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="${pageContext.request.contextPath }/index.jsp">易买网</a> &gt; 购物车
</div>
<div class="wrap">
	<div id="shopping">
		<div class="shadow">
			<em class="corner lb"></em>
			<em class="corner rt"></em>
			<div class="box">
				<div class="msg">
					<p>恭喜：购买成功！</p>
					<p>正在进入首页...</p>
					<script type="text/javascript">
						setTimeout("location.href='<%=path %>/'", 3000);
					</script>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
