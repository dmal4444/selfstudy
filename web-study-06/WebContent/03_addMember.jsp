<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"/>
<jsp:setProperty name="member" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>�Է� �Ϸ�� ȸ�� ����</h2>
<table>
	<tr>
		<td>�̸� </td>
		<td><jsp:getProperty name="member" property="name" /></td>
	</tr>
	<tr>
		<td>���̵� </td>
		<td><jsp:getProperty name="member" property="userid"/></td>
	</tr>
	<tr>
		<td>����</td>
		<td><jsp:getProperty name="member" property="nickname"/></td>
	</tr>
	<tr>
		<td>��й�ȣ </td>
		<td><jsp:getProperty name="member" property="pwd"/></td>
	</tr>

	<tr>
		<td>�̸���</td>
		<td><jsp:getProperty name="member" property="email"/></td>
	</tr>
	<tr>
		<td>��ȭ��ȣ </td>
		<td><jsp:getProperty name="member" property="phone"/></td>
	</tr>

</table>
</body>
</html>