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
	if(session.getAttribute("loginUser")==null){
		response.sendRedirect("10_loginForm.jsp");
	}else{
		%>
		<%=session.getAttribute("loginUser") %>�� �ȳ��ϼ���!<br>
		���� Ȩ�������� �湮�� �ּż� �����մϴ�. <br>
		��ſ� �ð� �Ǽ���....<br>
		<form method="post" action="10_logout.jsp">
			<input type="submit" value="�α׾ƿ�">
		</form>		
	<%} %>

</body>
</html>