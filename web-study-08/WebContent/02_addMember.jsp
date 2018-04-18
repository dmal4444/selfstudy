<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%! 
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String uid="scott";
	String pass="tiger";
	
	String sql="insert into member values(?,?,?,?,?,?)";
			
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String name=request.getParameter("name");
String userid=request.getParameter("userid");
String pwd = request.getParameter("pwd");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String admin = request.getParameter("admin");
try{
	//(1�ܰ�) JDBC ����̹� �ε�
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//(2�ܰ�) �����ͺ��̽� ���� ��ü�� Connection ����
	conn = DriverManager.getConnection(url, uid, pass);
	//(3�ܰ�)PreparedStatement ��ü �����ϱ�
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//(4�ܰ�)���ε� ������ ä���.
	pstmt.setString(1, name);
	pstmt.setString(2, userid);
	pstmt.setString(3, pwd);
	pstmt.setString(4, email);
	pstmt.setString(5, phone);
	pstmt.setInt(6, Integer.parseInt(admin));
	//(5�ܰ�) SQL���� �����Ͽ� ��� ó��
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
	
}finally{
	//(6�ܰ�) ����� ���ҽ� ����
	try{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
}//finally�� ��
%>
<h3>ȸ�� ���� ����</h3>
<a href="01_allMember.jsp">ȸ�� ��ü ��� ����</a>
</body>
</html>