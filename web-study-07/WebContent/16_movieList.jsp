<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String[] movieList={"kingkong","black pather","spiderman","iron"};
	pageContext.setAttribute("movieList", movieList);
%>
<ul>
<c:forEach var="movie" items="${movieList }" varStatus="status">
	<c:choose>
		<c:when test="${status.first}">
			<li style="font-weight: bold; color:red;">${movie }</li>
		</c:when>
		<c:otherwise>
			<li>${movie }</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
</ul>

<c:forEach var="movie" items="${movieList }" varStatus="status">
	${movie} <c:if test="${not status.last}">, </c:if>
</c:forEach>
</body>
</html>