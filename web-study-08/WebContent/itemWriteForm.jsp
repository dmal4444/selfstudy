<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="itemWriteResult.jsp">
<table border='1' width='800'>
<tr><td>상품명</td><td><input type="text" name="name" size="100"></td></tr>
<tr><td>가격</td><td><input type="text" name="price" size="100"></td></tr>
<tr><td>설명</td><td><textarea name="description"></textarea></td></tr>
<tr><td><input type="submit" value="전송"><input type="reset" value="취소"></td></tr>
</table>


</form>
</body>
</html>