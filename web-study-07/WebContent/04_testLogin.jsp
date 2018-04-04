<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	당신이 입력한 정보입니다.(고전정인 방식).<hr>
	아이디 : <%=request.getParameter("id") %><br>
	비밀번호 : <%=request.getParameter("pwd") %><br><br>
	
	당신이 입력한 정보입니다.(EL 방식)<hr>
	아이디 : ${param.id}<br>
	비밀번호 : ${param["pwd"]}<br>

</body>
</html>