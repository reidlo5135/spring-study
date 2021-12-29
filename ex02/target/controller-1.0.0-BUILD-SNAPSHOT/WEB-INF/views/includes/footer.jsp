<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
</head>
<body>

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2020</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#dataTables-example').DataTable({
				responsive:true
			});
			$(".sidebar-nav")
				.attr("class","sidebar-nav navbar-collapse collapse")
				.attr("aria-expanded", "false")
				.attr("style", "height:1px");
		});
	</script>
</body>
</html>