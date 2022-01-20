<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ALL ALL ALL</h1>
	
	<sec:authorize access="isAnonymous()">
		<a href="${path}/customLogin">LOGIN</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<a href="${path}/customLogout">LOGOUT</a>
	</sec:authorize>
</body>
</html>