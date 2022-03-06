<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">

	<div id="wrapper">
	
		<c:import url="../includes/sidebar.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Board Read Page</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="form-group">
								<label>Bno</label>
								<input class="form-control" name="bno" value='<c:out value="${board.bno}" />' readonly/>
							</div>
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title" value='<c:out value="${board.title}" />' readonly/>
							</div>
							<div class="form-group">
								<label>Text Area</label>
								<textarea class="form-control" rows="3" name="content" readonly>
									<c:out value="${board.content}" />
								</textarea>
							</div>
							<div class="form-group">
								<label>Writer</label>
								<input class="form-control" name="writer" value='<c:out value="${board.writer}" />' readonly/>
							</div>
							<button data-oper='modify' class="btn btn-default">Modify</button>
							<button data-oper='list' class="btn btn-info">List</button>
							
							<form id='operForm' action="${path}/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>" />
								<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />' />
								<input type="hidden" name="amount" value='<c:out value="${cri.amount}" />' />
								<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'/>
                                <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'/>
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
	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");
			
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "${path}/board/modify").submit();
			});
			
			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "${path}/board/list")
				operForm.submit();
			});
		});
	</script>
</body>
</html>