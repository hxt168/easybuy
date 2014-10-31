<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ page import="un.dez.easybuy.util.*" %>
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
 <script type="text/javascript" src="${pageContext.request.contextPath }/xhe/jquery/jquery-1.4.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/xhe/xheditor-1.1.14-zh-cn.min.js" ></script>
<script type="text/javascript">
	function check(){
		
		var name = document.getElementById("name").value;
		var con = document.getElementById("con").value;
		
		if(name == ""){
			document.getElementById("msgs").innerHTML="昵称不能为空";
			return false;
		}/*
		if(con == ""){
			document.getElementById("msgs").innerHTML="内容不能为空";
			return false;
		}*/
		return true;
	}
</script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="${pageContext.request.contextPath }/index.jsp">易买网</a> &gt; 在线留言
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="/inc/category_left.jsp" ></jsp:include>
	</div>
	<div class="main">
		<div class="guestbook">
			<h2>全部留言</h2>
			<ul>
				
				<c:forEach var="comment" items="${comments}">
				<li>
					<dl>
						<dt></dt>
						<dd class="author">网友：<span style="font-weight:bold;">${comment.ecNickName }</span> <span class="timer">时间： ${comment.ecCreateTime }</span></dd>
						<dd>${comment.ecContent }</dd>
					<c:if test="${comment.isReply==1}">	
						<dd style="color:red;">&nbsp;&nbsp;管理员回复： <span class="timer">${comment.ecReplyTime }</span></dd>
						<dd style="color:red;">&nbsp;&nbsp;${comment.ecReply }</dd>
					</c:if>	
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
			<div id="reply-box">
				<form method="post" action="${pageContext.request.contextPath }/comment/_add" onsubmit="return check()">
					<table>
						<tr>
							<td class="field">昵称：</td>
							<td><input id="name" class="text" type="text" name="ecNickName" /></td>
						</tr>
						<tr>
							<td class="field">留言内容：</td>
							<td><textarea id="con" class="xheditor" name="ecContent"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><label class="ui-blue"><input type="submit" name="submit" value="提交留言" /></label> <font id="msgs" color="red"> </font></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
