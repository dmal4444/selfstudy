<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	pageContext.setAttribute("name", "page man");
	request.setAttribute("name", "request man");
	session.setAttribute("name", "session man");
	application.setAttribute("name","application man");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
name : ${name} <hr>
page �Ӽ� : ${pageScope.name} <br>
request �Ӽ� : ${requestScope.name} <br>
session �Ӽ� : ${sessionScope.name} <br>
application �Ӽ�: ${applicationScope.name}<br>
</body>
</html>