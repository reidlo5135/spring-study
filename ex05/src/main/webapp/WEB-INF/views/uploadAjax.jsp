<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple />
	</div>
	
	<button id="uploadBtn">Upload</button>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				for(var i=0;i<files.length;i++) {
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url: '/reidlo/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					success : function(result) {
						alert("Uploaded");
					}
				});
			});
		});
	</script>
</body>
</html>