<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>게시판 글쓰기</h2>
<form method="post" action="boardWrite.jsp">
<table border='1' width="500px">
<tr>
	<td>작성자</td>
	<td><input type="text" id="name" name="name"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" id="pwd" name="pass">(게시물 수정 삭제시 필요합니다.)</td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" id="email" name="email"></td>
</tr>
<tr>
	<td>글 제목</td>
	<td><input type="text" id="title" name="title"></td>
</tr>
<tr>
	<td>글 내용</td>
	<td><textarea id="content" name="content" width="700px">
	</textarea></td>
</tr>
</table>

<input type="submit" value="등록">
<input type="reset" value="다시 작성">
</form>
</body>
</html>