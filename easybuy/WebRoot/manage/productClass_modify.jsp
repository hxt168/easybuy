<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="2" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>修改分类</h2>
		<div class="manage">
			<form action="${pageContext.request.contextPath}/category/manage_domodify" method="post" >
				<table class="form">
					<tr>
						<td class="field">父分类：</td>
						<td>
							<select name="parentId">
							<c:if test="${pcList==null}">
								<option value="0" selected="selected">根栏目</option>
							</c:if>	
							<c:if test="${pcList!=null}">
							<c:forEach items="${pcList }" var="pc">
								<c:if test="${pc.epcParentId!=category.parentCategory.epcParentId }">
									<option value="${pc.epcParentId }">${pc.epcParentName }</option>
								</c:if>
								<c:if test="${pc.epcParentId==category.parentCategory.epcParentId }">
									<option selected="selected" value="${pc.epcParentId }">${pc.epcParentName }</option>
								</c:if>
							</c:forEach>
							</c:if>	
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">分类名称：</td>
						<c:if test="${parentCategory!=null }">
						
						<td><input type="hidden" name="pid" value="${parentCategory.epcParentId }"  /><input type="text" class="text" name="className" value="${parentCategory.epcParentName }" /></td>
						
						</c:if>
						<c:if test="${category!=null }">
						
						<td><input type="hidden" name="cid" value="${category.epcId }"  /><input type="text" class="text" name="className" value="${category.epcName }" /></td>
						
						</c:if>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
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
