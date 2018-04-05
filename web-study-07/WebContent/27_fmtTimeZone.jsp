<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<pre>
default : <c:out value="${now }"></c:out>
Korea KST : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>
<fmt:timeZone value="GMT">
Swiss GMT : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>
</fmt:timeZone>

<fmt:timeZone value="GMT-9">
NewYork GMT-8: <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>
</fmt:timeZone>


</pre>
</body>
</html>