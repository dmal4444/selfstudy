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
<c:forTokens var="city" items="서울.인천,대구.부산" delims=",">
	${city }<br>
</c:forTokens>
<hr>
<c:forTokens var="city" items="서울.인천,대구.부산" delims=",.">
	${city }<br>
</c:forTokens>

</body>
</html>