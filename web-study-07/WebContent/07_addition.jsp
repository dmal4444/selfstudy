<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	고전적인 방식 :
	<%
		int num1 = (Integer)request.getAttribute("num1");
		int num2 = (Integer)request.getAttribute("num2");
	%>
	<%=num1 %>+<%=num2 %>=<%=num1+num2%> <hr>
	
	EL 방식 :
	${num1}+${num2}=${add}
</body>
</html>