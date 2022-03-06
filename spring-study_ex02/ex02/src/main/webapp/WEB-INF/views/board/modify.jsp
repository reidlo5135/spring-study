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
						<div class="panel-heading">Board Modify Page</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form role="form" action="${path}/board/modify" method="post">
								<div class="form-group">
									<label>Bno</label>
									<input class="form-control" name="bno" value='<c:out value="${board.bno}" />' readonly/>
								</div>
								<div class="form-group">
									<label>Title</label>
									<input class="form-control" name="title" value='<c:out value="${board.title}" />'/>
								</div>
								<div class="form-group">
									<label>Text Area</label>
									<textarea class="form-control" rows="3" name="content">
										<c:out value="${board.content}" />
									</textarea>
								</div>
								<div class="form-group">
									<label>Writer</label>
									<input class="form-control" name="writer" value='<c:out value="${board.writer}" />' readonly/>
								</div>
								<div class="form-group">
									<input type="hidden" class="form-control" name="writer" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly/>
								</div>
								<div class="form-group">
									<input type="hidden" class="form-control" name="writer" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly/>
								</div>
								<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />' />
								<input type="hidden" name="amount" value='<c:out value="${cri.amount}" />' />
								<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
								<button type="submit" data-oper='list' class="btn btn-info">List</button>
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
			var formObj = $("form");
			
			$('button').on("click", function(e) {
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "${path}/board/remove");	
				}else if(operation === 'list'){
					formObj.attr("action", "${path}/board/list").attr("method", "get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
				}
				formObj.submit();
			});
		});
	</script>
</body>
</html>