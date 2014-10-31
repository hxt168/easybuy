<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="un.dez.easybuy.entity.*"%>
<%@page import="un.dez.easybuy.biz.Factory"%>
<% 

List<ParentCategory> list=(List<ParentCategory>)application.getAttribute("parentCategoryList");
if(list==null)
{
	list=Factory.getParentCategorydao().getListAllContainCategory();
	application.setAttribute("parentCategoryList", list);
}

request.setAttribute("list",list);

 %>
<div class="box">
			<h2>商品分类</h2>
			<dl>
			
			<c:forEach items="${list}" var="plist">
			
			<dt>${plist.epcParentName }</dt>
			<c:forEach items="${plist.list}" var="clist">
			
				<dd><a href="${pageContext.request.contextPath }/product/listByChild?id=${clist.epcId}">${clist.epcName}</a></dd>
			</c:forEach>
			
			</c:forEach>
				
				

			</dl>
		</div>