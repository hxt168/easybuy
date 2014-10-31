<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/xhe/jquery/jquery-1.4.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/xhe/xheditor-1.1.14-zh-cn.min.js" ></script>
<script type="text/javascript">
	function check(){
		var title = document.getElementById("title").value;
		var con = document.getElementById("con").value;
		if(title == ""){
			document.getElementById("msgs").innerHTML="标题不能为空";
			return false;
		}
		//if(con == ""){
		//	document.getElementById("msgs").innerHTML="内容不能为空";
		//	return false;
		//}
		return true;
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
		<h2>添加新闻</h2>
		<div class="manage">
			<form action="${pageContext.request.contextPath}/news/manage_doadd" method="post" onsubmit="return check()">
				<table class="form">
					<tr>
						<td class="field">新闻标题：</td>
						<td><input type="text" class="text" id="title" name="title" value="" /></td>
						<td><font id="msg" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">新闻内容：</td>
						<td><textarea id="con" name="content" class="xheditor" ></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label> <font id="msgs" color="red"> </font></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>