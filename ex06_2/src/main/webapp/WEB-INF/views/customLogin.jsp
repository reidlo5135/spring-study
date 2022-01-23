<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/vendor/metisMenu/metisMenu.min.css">
	<link rel="stylesheet" href="${path}/resources/dist/css/sb-admin-2.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/font-awesome/css/font-awesome.min.css">
</head>
<body>
	<h1>Custom Login Page</h1>
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
	
	<form role="form" method="post" action="${path}/login">
		<fieldset>
			<div class="form-group">
				<input class="form-control" placeholder="userid" type="text" name="username" autofocus />
			</div>
			<div class="form-group">
				<input class="form-control" placeholder="Password" type="password" name="password" value=""/>
			</div>
			<div class="checkbox">
				<label>
					<input type="checkbox" name="remember-me" /> Remember Me
				</label>
			</div>
			<a href="index.html" class="btn btn-lg btn-success btn-block">LOGIN</a>
		</fieldset>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
	<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${path}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${path}/resources/vendor/metisMenu/metisMenu.min.js"></script>
	<script src="${path}/resources/dist/js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		$(".btn-success").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		});	
	</script>
</body>
</html>