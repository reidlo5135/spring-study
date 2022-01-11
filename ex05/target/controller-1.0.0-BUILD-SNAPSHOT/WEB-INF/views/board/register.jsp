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
			<div class='row'>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">File Attach</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" multiple />
							</div>
						</div>
						<div class="uploadResult">
							<ul>

							</ul>
						</div>
					</div>
				</div>
			</div>
			
		<c:import url="../includes/footer.jsp" />
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(e) {
			var formObj = $("form[role='form']");
			
			$("button[type='submit']").on("click", function(e) {
				e.preventDefault();
				
				console.log("submit clicked");
				
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj) {
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type='hidden' name ='attachList["+i+"].fileName' value='"+ jobj.data("filename") + "'>";
					str += "<input type='hidden' name ='attachList["+i+"].uuid' value='"+ jobj.data("uuid") + "'>";
					str += "<input type='hidden' name ='attachList["+i+"].uploadPath' value='"+ jobj.data("path") + "'>";
					str += "<input type='hidden' name ='attachList["+i+"].fileType' value='"+ jobj.data("type") + "'>";
					
					formObj.append(str).submit();
				});
			});
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;
	
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			$("input[type='file']").change(function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);

				for (var i = 0; i < files.length; i++) {
	
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
										
					formData.append("uploadFile",files[i]);
				}
				$.ajax({
					url : '${path}/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadResult(result);
					}
				});
			});
			
			function showUploadResult(uploadResultArr) {
				if(!uploadResultArr || uploadResultArr.length == 0){return;}
				
				var uploadUL = $(".uploadResult ul");
				
				var str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					if(obj.image) {
						console.log("showUpload : " + obj.uploadPath + " filename : " + obj.fileName);
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						
						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'data-type='" + obj.image + "'";
						str += "><div>";
						str += "<span>" + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='${path}/display?fileName=" + fileCallPath + "'>";
						str += "</div>";
						str += "</li>";
					}else {
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'data-type='" + obj.image + "'";
						str += "><div>";
						str += "<span>" + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-warning btn-cricle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='${path}/resources/img/bulls.png'></a>";
						str += "</div>";
						str += "</li>";
					}
				});
				uploadUL.append(str);
			}
			
			$(".uploadResult").on("click", "button", function(e) {
				console.log("delete File");
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				$.ajax({
					url : '${path}/deleteFile',
					data : {fileName: targetFile, type:type},
					dataType : 'text',
					type : 'POST',
					success : function(result) {
						alert(result);
						targetLi.remove();
					}
				});
			});
			
		});
	</script>
</body>
</html>