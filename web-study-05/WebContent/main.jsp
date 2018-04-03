<%@page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//Cookie에서 name과 value를 얻어와서 비교
	Cookie ck[] = null;
	//클라이언트로부터 Cookie[]를 얻어옴
	ck = request.getCookies();
	String str =null;
	if(ck!=null){
		//2. 쿠키의 name을 얻어서 "username"인지 비교하여 같으면
		for(Cookie c : ck){
			str = URLDecoder.decode(c.getValue(),"UTF-8");
			}
		
		out.print(str);
		%>
		님 안녕하세요!<br>
		저희 홈페이지에 방문해 주셔서 감사합니다.<br>
		즐거운 시간 되세요....<br>
		<form method="post" action="logout.jsp">
			<input type="submit" value="로그아웃">
		</form> 
		<%
		}else{
		%>
		<h2> 로그인에 실패했습니다.</h2>
		<p><a href="loginForm.jsp"> 되돌아가기 </a>
		
		<%
		} 
		%>
</body>
</html>