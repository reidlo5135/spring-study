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
<style type="text/css">
	.uploadResult {
		width: 100%;
		background-color: gray;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	
	.uploadResult ul li span {
		color: white;
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255, 255, 255, 0.5);
	}
	
	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;	
	}
	
	.bigPicture img {
		width: 600px;
	}
</style>
</head>
<body id="page-top">

	<div id="wrapper">
	
		<c:import url="../includes/sidebar.jsp" />
		
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="bigPictureWrapper">
				<div class="bigPicture"></div>
			</div>
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
								<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'/>
                                <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'/>
								<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
								<button type="submit" data-oper='list' class="btn btn-info">List</button>
							</form>
						</div>
						<!-- end panel body -->
						
						<div class="panel panel-heading">Files</div>
						<div class="panel-body">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel -->
			</div>
			<!-- footer.jsp -->
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
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					formObj.append(keywordTag);
					formObj.append(typeTag);
				}
				formObj.submit();
			});
			
			(function() {
				var bno = '<c:out value="${board.bno}" />';
				
				$.getJSON("${path}/board/getAttachList", {bno : bno}, function(arr) {
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i, attach) {
						if(attach.fileType) {
							fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
							str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
							str += "<span>" + attach.fileName + "</span>";
							str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'";
							str += "class= 'btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='${path}/display?fileName=" + fileCallPath + "'>";
							str += "</div>";
							str += "</li>";
						}else {
							str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
							str += "<span>" + attach.fileName + "</span>";
							str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'";
							str += "class= 'btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='${path}/resources/img/bulls.png'>";
							str += "</div>";
							str += "</li>";
						}
					});
					
					$(".uploadResult ul").html(str);
				});				
			})();
		});
	</script>
</body>
</html>