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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		var principal = $(".principal").val();
		console.log(principal);
	});
</script>
</head>
<body>
	<h1>ADMIN ADMIN ADMIN</h1>
	<input type="hidden" value="principal" class="principal"/>
	<p>principal : <sec:authentication property="principal"/></p>
	<p>MemberVO : <sec:authentication property="principal.member"/></p>
	<p>사용자 이름 : <sec:authentication property="principal.member.userName"/></p>
	<p>사용자 아이디 : <sec:authentication property="principal.member.userid"/></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
		
	<a href="${path}/customLogout">LOGOUT</a>
</body>
</html>
