<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>

<%! 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "scott";
	String pass = "tiger";
	
	String sql ="select * from employee";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="800">
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, uid, pass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.println("<tr><td>"+rs.getString("name")+"</td>");
		out.println("<td>"+rs.getString("address")+"</td>");
		out.println("<td>"+rs.getString("ssn")+"</td></tr>");
	}
}
catch(Exception e){
	e.printStackTrace();
}
finally{
	try{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
</table>
</body>
</html>