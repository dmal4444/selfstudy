<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>�Խ��� �۾���</h2>
<form method="post" action="boardWrite.jsp">
<table border='1' width="500px">
<tr>
	<td>�ۼ���</td>
	<td><input type="text" id="name" name="name"></td>
</tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="password" id="pwd" name="pass">(�Խù� ���� ������ �ʿ��մϴ�.)</td>
</tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" id="email" name="email"></td>
</tr>
<tr>
	<td>�� ����</td>
	<td><input type="text" id="title" name="title"></td>
</tr>
<tr>
	<td>�� ����</td>
	<td><textarea id="content" name="content" width="700px">
	</textarea></td>
</tr>
</table>

<input type="submit" value="���">
<input type="reset" value="�ٽ� �ۼ�">
</form>
</body>
</html>