<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>정보 입력 폼</h2>
<form method="get" action="itemWrite.jsp">
<table>
	<tr>
		<td>상품명</td>
		<td><input type="text" id="name" name="name"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" id="price" name="price"></td>
	</tr>
	<tr>
		<td>설명</td>
		<td><textarea id="description" name="description"></textarea></td>
	</tr>
</table>
<input type="submit" value="전송">
<input type="reset" value="취소">
</form>
</body>
</html>