<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="com.saeyan.javabeans.MemberBean"/>

--- �ڹ� �� ��ü ���� �� ����� ���� ����ϱ� <br><br>
�̸� : <%=member.getName()%><br>
���̵� : <%=member.getUserid() %>
<hr>

���� ������ �� ����� ���� ����ϱ� <br><br>
<%
member.setName("������");
member.setUserid("pinksubin");
%>
�̸� : <%=member.getName() %> <br>
���̵� : <%=member.getUserid() %> 

</body>
</html>