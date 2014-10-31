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
	function check()
	{
		var name=document.getElementById("name").value;
		if(name=="")
		{
			document.getElementById("msg").innerHTML="名称不能为空";
			return false;
		}
		return true;
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
		<h2>添加分类</h2>
		<div class="manage">
			<form action="${pageContext.request.contextPath}/category/manage_doadd" method="post" onsubmit="return check();" >
				<table class="form">
					<tr>
						<td class="field">父分类：</td>
						<td>
							<select name="parentId">
								<option value="0" selected="selected">根栏目</option>
								<c:forEach items="${pcList }" var="pc">
				
									<option value="${pc.epcParentId }">${pc.epcParentName }</option>
								
	
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">分类名称：</td>
						<td><input type="text" id="name" class="text" name="className" value="" /></td>
					</tr>
					<tr><td> <font id="msg" color="red"></font> </td> </tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
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
