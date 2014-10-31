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
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册易买网</h1>
			<ul class="steps clearfix">
				<li class="finished"><em></em>填写注册信息</li>
				<li class="last-current"><em></em>注册成功</li>
			</ul>
			<div class="msg">
				<p>恭喜：注册成功！</p>
				<p>正在进入登陆页面...</p>
				<script type="text/javascript">
					setTimeout("location.href='<%=path%>/login.jsp'", 3000);
				</script>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
