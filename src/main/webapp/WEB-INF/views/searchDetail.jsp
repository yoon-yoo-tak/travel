<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:url var="urlHome" value="/"/>
<%@ page session="false" %>
<html>
<head>
<style>
th,td {padding:1px 20px;}
</style>
	<title>SearchDetail</title>
</head>
<body>
	<div align="center">
	
	<table id="1" >
	 
		<tr align="center" ><!-- 첫번째 줄 시작 -->
		    
		    <c:forEach  items="${detailLst }" var="detail" varStatus="status" >
	
		<c:if test="${status.index%3==0}">
		<tr></tr>
		</c:if>

		    <td>    
			     
		 	      <a href="${urlHome }region/detail?title=${detail.title}" class="">   
		          <figure>
		              <img src="${path }/${detail.img }" width="350px" align="middle" alt="">
		            <figcaption> 
		              <h3 >${detail.title }</h3>
		              <p>${detail.location }</p>
		              <span style="color:#00a599">${detail.title1 }</span> 
		            </figcaption>
		          </figure>
		        </a>
		        </td>
	
		       </c:forEach>
	        
		  
		</tr><!-- 세번째 줄 끝 -->
		
	    </table> 
	</div>
</body>
</html>
