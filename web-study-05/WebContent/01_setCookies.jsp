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
	//1. Cookie ��ü ����
	Cookie c = new Cookie("id", "pinksung");
	//2. ��ȿ�Ⱓ ����
	c.setMaxAge(365*24*60*60);
	//3. Ŭ���̾�Ʈ�� ��Ű ����
	response.addCookie(c);
	//4. ��Ű�� �����Ͽ� Ŭ���̾�Ʈ�� ����
	response.addCookie(new Cookie("pwd", "test1234"));
	response.addCookie(new Cookie("age", "20"));
%>
<h3> ��Ű ����</h3>
</body>
</html>