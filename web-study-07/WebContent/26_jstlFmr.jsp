<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<pre>
<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
\${now } = ${now }
	<fmt:formatDate value="${now }"></fmt:formatDate>
date : <fmt:formatDate value="${now }" type="date"></fmt:formatDate>
time : <fmt:formatDate value="${now }" type="time"></fmt:formatDate>
both :  <fmt:formatDate value="${now }" type="both"></fmt:formatDate>

default : <fmt:formatDate value="${now }" type="both" dateStyle="default" timeStyle="default"></fmt:formatDate>
short : <fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short"></fmt:formatDate>
medium : <fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium"></fmt:formatDate>
long : <fmt:formatDate value="${now }" type="both"  dateStyle="long" timeStyle="long"></fmt:formatDate>
full : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>

pattern="yyyy년 MM월 dd일 hh시 mm분 ss초" : 
<fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"></fmt:formatDate>
</pre>
</body>
</html>