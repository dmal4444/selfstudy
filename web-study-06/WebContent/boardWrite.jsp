<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="com.mission.javabeans.BoardBean"/>
<jsp:setProperty name="board" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>입력 완료된 정보</h2>
작성자: <jsp:getProperty name="board" property="name"/><br>
비밀번호: <jsp:getProperty name="board" property="pass"/><br>
이메일: <jsp:getProperty name="board" property="email"/><br>
글제목: <jsp:getProperty name="board" property="title"/><br>
글내용: <jsp:getProperty name="board" property="content"/>


</body>
</html>