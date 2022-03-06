<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>REIDLO-SPRING-LIST</title>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
    
	<!-- Side Bar -->
    <%@include file="../includes/sidebar.jsp" %>    

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            	<!-- Top Bar -->
				<%@include file="../includes/topbar.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>
					
					<div class="panel-heading">
						Board List Page
						<br>
						<button type="button" id="regBtn" class="btn btn-xs pull-right">Register New Board</button>
					</div>
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>                                            
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>                                           
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${list}" var="board">
                                        	<tr>
                                        		<td><c:out value="${board.bno}" /></td>
                                        		<td>
                                        			<a class="move" href='<c:out value="${board.bno}"/>'>
                                        				<c:out value="${board.title}" />
                                        				<b>[<c:out value="${board.replyCnt}" />]</b>
                                        			</a>
                                        		</td>
                                        		<td><c:out value="${board.writer}" /></td>
                                        		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                        		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>                                        		
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                	<div class="row">
                                		<div class="col-lg-12">
                                			<form id="searchForm" action="${path}/board/list" method="get">
                                				<select name="type">
                                					<option value="" <c:out value="${pageMarker.cri.type == null ? 'selected' : ''}"/>>--</option>
                                					<option value="T" <c:out value="${pageMarker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
                                					<option value="C" <c:out value="${pageMarker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
                                					<option value="W" <c:out value="${pageMarker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
                                					<option value="TC" <c:out value="${pageMarker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 or 내용</option>
                                					<option value="TW" <c:out value="${pageMarker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 or 작성자</option>
                                					<option value="TWC" <c:out value="${pageMarker.cri.type eq 'TWC' ? 'selected' : ''}"/>>제목 or 내용 or 작성자</option>
                                				</select>
                                				<input type="text" name="keyword" value='<c:out value="${pageMarker.cri.keyword}"/>'/>
                                				<input type="hidden" name="pageNum" value='<c:out value="${pageMarker.cri.pageNum}"/>' />
                                				<input type="hidden" name="amount" value='<c:out value="${pageMarker.cri.amount}"/>' />
                                				<button class="btn btn-default">Search</button>
                                			</form> 
                                		</div>
                                	</div>
									<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                	<ul class="pagination">
                                		<c:if test="${pageMarker.prev}">
                                			<li class="paginate_button page-item previous disabled" id="dataTable_previous">
                                				<a href="${pageMaker.startPage-1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                			</li>
                                		</c:if>
                                		<c:forEach begin="${pageMarker.startPage}" end="${pageMarker.endPage}" var="num">
                                			<li class="paginate_button page-item ${pageMarker.cri.pageNum == num ? 'active':''}">
                                				<a href="${num}" aria-controls="dataTable" data-dt-idx="0" class="page-link">${num}</a>
                                			</li>
                                		</c:forEach>
                                		<c:if test="${pageMarker.next}">
                                			<li class="paginate_button page-item next" id="dataTable_next">
                                				<a href="${pageMarker.endPage+1}" aria-controls="dataTable" data-dt-idx="0" class="page-link">Next</a>
                                			</li>
                                		</c:if>                                		
                                	</ul>
                                </div>
                                </div>
                                <!-- End Pagination -->
                                <form id="actionForm" action="${path}/board/list" method="get">
                                	<input type="hidden" name="pageNum" value="${pageMarker.cri.pageNum}" />
                                	<input type="hidden" name="amount" value="${pageMarker.cri.amount}" />
                                	<input type="hidden" name="type" value='<c:out value="${pageMarker.cri.type}"/>'/>
                                	<input type="hidden" name="keyword" value='<c:out value="${pageMarker.cri.keyword}"/>'/>
                                </form>  
                               </div> 
                    	</div>
					
                	</div>
               		<!-- /.container-fluid -->

            	</div>
            	<!-- End of Main Content -->
            
            	<!-- Footer -->
            	<%@include file="../includes/footer.jsp" %>
        	</div>
        	<!-- End of Content Wrapper -->

    		</div>
	</div>   
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <sec:authorize access="isAuthenticated()">
                    	<a class="btn btn-primary" href="${path}/customLogout">Logout</a>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                    	<a class="btn btn-primary" href="${path}/customLogin">Login</a>
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                	<h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">처리가 완료되었습니다.</div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                	<!-- <button type="button" class="btn btn-primary">Save Changes</button> -->
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		var result = '<c:out value="${result}"/>';
    		
    		checkModal(result);
    		
    		/* history.replace({}, null, null); */
    		
    		function checkModal(result) {
    			if(result == '' || history.state) {
    				return;
    			}
    			if(parseInt(result) > 0){
    				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
    			}
    			
    			$("#myModal").modal("show");
    		}
    		
    		$("#regBtn").on("click", function() {
    			self.location = "${path}/board/register";
    		});
    		
    		var actionForm = $("#actionForm");
    		
    		$(".paginate_button a").on("click", function(e) {
    			e.preventDefault();
    			
    			console.log('click');
    			
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			actionForm.submit();
    		});
    		
    		$(".move").on("click", function(e) {
    			e.preventDefault();
    			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'/>");
    			actionForm.attr("action", "${path}/board/get");
    			actionForm.submit();
    		});
    		
    		var searchForm = $("#searchForm");
    		
    		$("#searchForm button").on("click", function(e) {
    			if(!searchForm.fin("option:selected").val()) {
    				alert("검색종류를 선택하세요");
    				return false;
    			}
    			
    			if(!searchForm.find("input[name='keyword']").val()) {
    				alert("키워드를 입력하세요");
    				return false;
    			}
    			
    			searchForm.find("input[name='pageNum']").val("1");
    			e.preventDefault();
    			
    			searchForm.submit();
    		});
    	});
    </script>

    <!-- Bootstrap core JavaScript-->
    <%-- <script src="${path}/resources/vendor/jquery/jquery.min.js"></script> --%>
</body>
</html>