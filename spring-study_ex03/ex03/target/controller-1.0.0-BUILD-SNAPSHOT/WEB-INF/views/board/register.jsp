<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REIDLO-SPRING-REGISTER</title>
</head>
<body id="page-top">

	<div id="wrapper">
	
		<c:import url="../includes/sidebar.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Board Register</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form role="form" action="${path}/board/register" method="post">
								<div class="form-group">
									<label>Ttitle</label>
									<input class="form-control" name="title" />
								</div>
								<div class="form-group">
									<label>Text Area</label>
									<textarea class="form-control" rows="3" name="content" ></textarea>
								</div>
								<div class="form-group">
									<label>Writer</label>
									<input class="form-control" name="writer" />
								</div>
								<button type="submit" class="btn btn-default">Submit Button</button>
								<button type="reset" class="btn btn-default">Reset Button</button>
							</form>
						</div>
						<!-- end panel body -->
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel -->
			</div>
		<c:import url="../includes/footer.jsp" />
		</div>
	</div>
</body>
</html>