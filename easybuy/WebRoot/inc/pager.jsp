<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page import="un.dez.easybuy.biz.Factory"%>
<%@page import="un.dez.easybuy.util.*"%>
<%@page import="un.dez.easybuy.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>

<% 
	request.setCharacterEncoding("utf-8");
	
%>
<pg:pager url="" items="${param.items}" maxPageItems="${param.pageSize}" maxIndexPages="${param.totalPage}" export="curPage=number" >
	<c:forEach items="${pageContext.request.parameterMap }" var="query">
		<c:if test="${query.key != 'url'&& query.key != 'items'&& query.key != 'pageSize'&& query.key != 'totalPage'&& query.key != 'pager.offset'}">
		<c:forEach items="${query.value }" var="v">
			<pg:param name="${query.key }" value="${v }" />
		</c:forEach>
		</c:if>
	</c:forEach>
    				总共有${param.items }条记录
    				,当前是第${curPage}页
    				<pg:last>
    				总有有:${pageNumber}页
    				</pg:last>
    				<pg:first>
    					<a href="${pageUrl }">首页</a>
    				</pg:first>
    				<pg:prev>
    					<a href="${pageUrl }">上一页</a>
    				</pg:prev>
    				<pg:pages>
    					<c:choose>  
          						 <c:when test="${curPage eq pageNumber}">  
               							<font color="red">${pageNumber }</font>  
           						 </c:when>  
          				 <c:otherwise>  
            		 			 <a href="${pageUrl }">${pageNumber }</a>  
          		 			</c:otherwise>  
		      		 </c:choose>  

    				
    				</pg:pages>
    				<pg:next>
    					<a href="${pageUrl }">下一页</a>
    				</pg:next>
    				<pg:last>
    					<a href="${pageUrl }">末页</a>
    				</pg:last>
    			</pg:pager>