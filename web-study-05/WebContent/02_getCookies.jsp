<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3> 클라이언트로부터 얻어온 Cookie</h3>
<% Cookie[] cookies = request.getCookies();
for(Cookie c : cookies){
	out.println(c.getName()+" : "+c.getValue()+"<br>");
}
	%>


</body>
</html>