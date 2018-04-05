<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="msg" value="Hello"></c:set>
\${msg}=${msg}<br>
<c:set var="age">
	30
</c:set>
\${age}=${age}<hr>

<c:set var="member" value="<%=new com.saeyan.javabeans.MemberBean()  %>"></c:set>
<c:set target="${member}" property="name" value="전수빈"></c:set>
<c:set target="${member}" property="userid">pinksubin</c:set>
\${member}=${member}<hr>

<c:set var="add" value="${10+5}"></c:set>
\${add}=${add}<br>
<c:set var="flag" value="${10>5}"></c:set>
\${flag} = ${flag}<br>
</body>
</html>