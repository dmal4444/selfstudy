<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="item" class="com.mission.javabeans.ItemBean"/>
<jsp:setProperty name="item" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>�Է� �Ϸ�� ����</h2>
��ǰ�� : <jsp:getProperty property="name" name="item"/><br>
���� : <jsp:getProperty property="price" name="item"/><br>
���� : <jsp:getProperty property="description" name="item"/><br>
</body>
</html>