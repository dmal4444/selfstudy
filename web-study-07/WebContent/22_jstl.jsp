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
<c:set var="age" value="30" scope="page"></c:set>
����:<c:out value="${age }">10</c:out><br>

<c:remove var="age" scope="page"></c:remove>
����:<c:out value="${age }">20</c:out><br>

<c:catch var="errmsg">
	���� �߻� ��<br>
	<%=1/0 %><br>
	���� �߻� ��<br>
</c:catch>

<c:out value="${errmsg }"></c:out>
</body>
</html>