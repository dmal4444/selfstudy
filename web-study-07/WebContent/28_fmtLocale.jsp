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
<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
<pre>
��Ĺ ������ �⺻ ������: <%= response.getLocale() %>

<fmt:setLocale value="ko_kr"></fmt:setLocale>
�������� �ѱ���� ������ ������ Ȯ�� : <%= response.getLocale() %>
��ȭ(currency) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
��¥ : <fmt:formatDate value="${now }"></fmt:formatDate>

<fmt:setLocale value="ja_JP"></fmt:setLocale>
�������� �Ϻ���� ������ ������ Ȯ�� : <%=response.getLocale() %>
��ȭ(currency) : <fmt:formatNumber value="10000" type="currency"> </fmt:formatNumber>
��¥ : <fmt:formatDate value="${now }"></fmt:formatDate>

<fmt:setLocale value="en_US"></fmt:setLocale>
�������� ����� ������ ������ Ȯ��: <%=response.getLocale() %>
��ȭ(currency) :<fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
��¥ : <fmt:formatDate value="${now }"></fmt:formatDate>

</pre>
</body>
</html>