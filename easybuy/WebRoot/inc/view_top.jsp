<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="un.dez.easybuy.entity.*"%>
<%@page import="un.dez.easybuy.biz.Factory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
List<ParentCategory> list=Factory.getParentCategorydao().getListAllContainCategory();
request.setAttribute("list",list);

List<Category> clist=null;
String pid=request.getParameter("parentId");
int paId=0;
if(pid==null)
{
	clist=Factory.getCategorydao().getListByCount(12);
}else if("-1".equals(pid)){
	paId=-1;
	clist=Factory.getCategorydao().getListByCount(12);
}else{
	paId=Integer.parseInt(pid);
	clist=Factory.getCategorydao().getListByParentId(paId);
}
request.setAttribute("clist",clist);
request.setAttribute("paId", paId);

 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="header" class="wrap">
	<div id="logo"><img src="<%=path %>/images/logo.gif" /></div>
	<div class="help">	<c:if test="${loginUser!=null }">你好，${loginUser.euUserName } <a href="<%=path %>/user/loginout">注销</a> <a href="<%=path %>/order/user_list">个人中心</a> <c:if test="${loginUser.euStatus==2 }"> <a href="<%=path %>/order/manage_list">后台管理</a></c:if></c:if> <c:if test="${loginUser==null }"> <a href="<%=path %>/login.jsp">登录</a><a href="<%=path %>/register.jsp">注册</a></c:if> <a href="<%=path %>/shopping/viewCart" class="shopping">购物车</a> <a href="<%=path %>/comment/list">留言</a><a href="<%=path %>/news/list">新闻</a> </div>
	<div class="navbar">
		<ul class="clearfix">
		
			<li <c:if test="${param.parentId==null }">class="current"</c:if> ><a href="<%=path %>/">首页</a></li>
			<c:forEach items="${list}" var="plist">
			
			<li <c:if test="${paId==plist.epcParentId }">class="current"</c:if>><a href="<%=path %>/product/listByParent?id=${plist.epcParentId}">${plist.epcParentName}</a></li>
		
			</c:forEach>
			<li <c:if test="${paId==-1 }">class="current"</c:if>><a href="<%=path %>/product/listByPromote">促销</a></li>
		</ul>
	</div>
</div>
<div id="childNav">

	<div class="wrap">
		<ul class="clearfix">
		
		
			<c:set var="len" value="${fn:length(clist)}" />
	
		    <c:forEach items="${clist}" var="c" varStatus="i"  >
	
		    <c:if test="${i.index==0}">
			<li class="first"><a href="<%=path %>/product/listByChild?id=${c.epcId}">${c.epcName}</a></li>
			</c:if>
			
			<c:if test="${i.index!=0&&len-1!=i.index}">
			<li ><a href="<%=path %>/product/listByChild?id=${c.epcId}">${c.epcName}</a></li>
			</c:if>
			
			 <c:if test="${len-1==i.index}">
			<li class="last"><a href="<%=path %>/product/listByChild?id=${c.epcId}">${c.epcName}</a></li>
			</c:if>
			
			</c:forEach>
			
		
		</ul>
			
			
	</div>
	
</div>