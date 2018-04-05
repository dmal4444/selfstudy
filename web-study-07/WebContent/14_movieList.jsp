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
	String[] movieList={"타이타닉","월요일이 사라졌다", "블랙팬서","인피니트워"};
	pageContext.setAttribute("movieList", movieList);
%>
<c:forEach var="movie" items="${movieList}">
	${movie}<br>
</c:forEach>
</body>
</html>