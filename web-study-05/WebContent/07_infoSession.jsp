<%@page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3> ���� ������ ������ �޼ҵ带 ����ϱ�</h3>
<%
	String id_str = session.getId();
	long lasttime = session.getLastAccessedTime();
	long createdtime = session.getCreationTime();
	long time_used = (lasttime - createdtime) / 60000;
	int inactive = session.getMaxInactiveInterval()/60;
	boolean b_new = session.isNew();
%>
[1] ���� ID�� [<%= session.getId() %>] �Դϴ�. <br><hr>
[2] ����� �� ����Ʈ�� �ӹ� �ð��� <%=time_used %> ���Դϴ�. <br><hr>
[3] ������ ��ȿ �ð��� <%= inactive %> ���Դϴ�. <br><hr>
[4] ������ ���� ����� ������? <br>
<%
	if(b_new)
		out.print(" ��! ���ο� ������ ��������ϴ�.");
	else
		out.print(" �ƴϿ�! ���ο� ������ ������ �ʾҽ��ϴ�.");
%>
</body>
</html>