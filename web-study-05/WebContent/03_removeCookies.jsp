<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("id", "");
	cookie.setMaxAge(0); //쿠키의 유효기간을 만료시킴
	response.addCookie(cookie);
%>
<h3> id 쿠키가 삭제 되었습니다.</h3>
<a href="02_getCookies.jsp">
	쿠키 삭제를 확인하려면 클릭하세요.
</a>
</body>
</html>