<%@page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//������ DB���� �����;� �ϴ� ��
	String id = "pinksung";
	String pwd="1234";
	String name="������";
	
	if(id.equals(request.getParameter("id")) &&
			pwd.equals(request.getParameter("pwd"))){
		//id, pwd�� ���� ���� ��Ű �����ϰ� client�� �߰�
		//1. Cookie ��ü ����(username�� �������� ����)
		Cookie cookie = new Cookie("username", URLEncoder.encode(name,"UTF-8"));
		
		//2. �Ӽ��ο�
		cookie.setMaxAge(365*24*60*60);
		//3. Ŭ���̾�Ʈ�� ����
		response.addCookie(cookie);
		%>
		<h2> ���������� �α����ϼ̽��ϴ�. </h2>
		<p> <a href="main.jsp"> ���� </a>
		<%
	}else{
		%>
		<h2> �α��ο� �����߽��ϴ�. </h2>
		<p> <a href="loginForm.jsp"> �ǵ��ư��� </a>
	<%}%> 
%>