<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���� �Է� ��</h2>
<form method="get" action="itemWrite.jsp">
<table>
	<tr>
		<td>��ǰ��</td>
		<td><input type="text" id="name" name="name"></td>
	</tr>
	<tr>
		<td>����</td>
		<td><input type="text" id="price" name="price"></td>
	</tr>
	<tr>
		<td>����</td>
		<td><textarea id="description" name="description"></textarea></td>
	</tr>
</table>
<input type="submit" value="����">
<input type="reset" value="���">
</form>
</body>
</html>