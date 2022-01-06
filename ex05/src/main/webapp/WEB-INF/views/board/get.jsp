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
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw">Reply</i>
							<button id='addReplyBtn' class="btn btn-primary btn-xs pull-right">New Reply</button>
						</div>
						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix" data-rno='12'>
									<div class="header">
										<strong class="primary-font">reidlo</strong>
										<small class="pull-right text-muted">2021-12-28 21:21</small>
									</div>
									<p>Good Job!</p>
								</li>
							</ul>
						</div>
						<div class="panel-footer">
						
						</div>				
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Reply</label>
								<input class="form-control" name='reply' value="New Reply!!!"/>
							</div>
							<div class="form-group">
								<label>Replyer</label>
								<input class="form-control" name='replyer' value='replyer'/>
							</div>
							<div class="form-group">
								<label>Reply Date</label>
								<input class="form-control" name='replyDate' value='' />
							</div>
						</div>
						<div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
							<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button> 
							<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
						</div>
					</div>
				</div>
			</div>
			
		<c:import url="../includes/footer.jsp" />
		</div>
	</div>
	<script type="text/javascript" src="${path}/resources/js/reply.js"></script>
	
	<script>
		console.log("=============");
		console.log("JS TEST");
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page) {
		    	replyService.getList({bno:bnoValue, page:page||1}, function(replyCnt, list) {
		    	var str = "";
				
		    	console.log("replyCnt : " + replyCnt);
		    	console.log("list : " + list);
		    	console.log(list);
		    	
		    if(page == -1) {
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
		    }
		    	
			if(list == null || list.length == 0) {
			    return;
			}
			for(var i=0, len=list.length || 0;i<len;i++) {
			    str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			    str += "	<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
			    str += "	<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
			    str += "	<p>" + list[i].reply + "</p></div></li>";
			}
			
			replyUL.html(str);
			
			showReplyPage(replyCnt);
		    });		    	
	   }
		
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt) {
		    var endNum = Math.ceil(pageNum / 10.0) * 10;
		    var startNum = endNum - 9;
		    
		    var prev = startNum != 1;
		    var next = false;
		    
		    if(endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt / 10.0);
		    }
		    
		    if(endNum *10 < replyCnt) {
				next = true;
		    }
		    
		    var str = "<ul class='pagination pull-right'>";
		    
		    if(prev) {
				str += "<li class='paginate-button page-item previous'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		    }
		    
		    for(var i=startNum;i<=endNum;i++) {
				var active = pageNum == i ? "active":"";
				
				str += "<li class='paginate-button page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		    }
		    
		    if(next) {
				str += "<li class='paginate-button page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		    }
		    
		    str += "</ul></div>";
		    
		    console.log(str);
		    
		    replyPageFooter.html(str);
		}
		
		replyPageFooter.on("click", "li a", function(e) {
		   e.preventDefault();
		   console.log("page Click");
		   
		   var targetPageNum = $(this).attr("href");
		   
		   console.log("targetPageNum : " + targetPageNum);
		   
		   pageNum = targetPageNum;
		   
		   showList(pageNum);
		});
		
		var modal = $('.modal');
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click", function(e) {
		   modal.find("input") .val("");
		   modalInputReplyDate.closest("div").hide();
		   modal.find("button[id != 'modalCloseBtn']").hide();
		   
		   modalRegisterBtn.show();
		   
		   $('.modal').modal("show");
		});
		
		modalRegisterBtn.on("click", function(e) {
		   var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
		   };
		   replyService.add(reply, function(result){
		      alert(result);
		      modal.find("input").val();
		      modal.modal("hide");
		      
		      showList(-1);
		   });
		});
		
		modalModBtn.on("click", function(e) {
		    var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
		    
		    replyService.update(reply, function(result) {
				alert(result);
				modal.modal("hide");
				showList(pageNum);
		    });
		});
		
		modalRemoveBtn.on("click", function(e) {
		   var rno = modal.data("rno");
		   
		   replyService.remove(rno, function(result) {
		      alert(result);
		      modal.modal("hide");
		      showList(pageNum);
		   });
		});
		
		$(".chat").on("click", "li", function(e) {
			   var rno = $(this).data("rno") ;
			   
			   console.log(rno);
			   
			   replyService.get(rno, function(data) {
			       
			       modalInputReply.val(data.reply);
			       console.log("reply data : " + data);
			       modalInputReplyer.val(data.replyer);
			       modalInputReplyDate.val(replyService.displayTime(data.replyDate)).attr("readonly", "readonly");
			       modal.data("rno", data.rno);
			       
			       modal.find("button[id != 'modalCloseBtn']").hide();
			       modalModBtn.show();
			       modalRemoveBtn.show();
			       
			       $(".modal").modal("show");
			   });
			});
		
		replyService.getList({bno:bnoValue, page:1}, function(list){
		    for(var i=0, len=list.length||0;i<len;i++){
				console.log(list[i]);
				console.log("list[i].reply : " + list[i].reply);
		    }
		});
	</script>
	
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
			
			(function() {
				var bno = '<c:out value="${board.bno}" />';
				
				$.getJSON("${path}/board/getAttachList", {bno : bno}, function(arr) {
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i, attach) {
						if(attach.fileType) {
							fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
							str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
							str += "<img src='${path}/display?fileName=" + fileCallPath + "'>";
							str += "</div>";
							str += "</li>";
						}else {
							str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
							str += "<span>" + attach.fileName + "</span><br>";
							str += "<img src='${path}/resources/img/bulls.png'>";
							str += "</div>";
							str += "</li>";
						}
					});
					
					$(".uploadResult ul").html(str);
				});				
			})();
		});
		
		$(".uploadResult").on("click", "li", function(e) {
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("fileName"));
			
			if(liObj.data("type")) {
				showImage(path.replace(new RegExp(/\\/g), "/"));
			}else {
				self.location = "${path}/download?fileName=" + path;
			}
		});
		
		function showImage(fileCallPath) {
			alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display", "flex").show();
			
			$(".bigPicture")
			.html("<img src='${path}/display?fileName=" + fileCallPath + "'>")
			.animate({width:'100%', height:'100%'}, 1000);
		}
	</script>
</body>
</html>