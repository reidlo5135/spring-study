<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <c:import url="../includes/sidebar.jsp" />    

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            	<!-- Top Bar -->
				<c:import url="../includes/topbar.jsp"></c:import>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>
					
					<div class="panel-heading">
						Board List Page
						<button type="button" id="regBtn" class="btn btn-xs pull-right">Register New Board</button>
					</div>
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#??????</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>                                           
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>#??????</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${list}" var="board">
                                        	<tr>
                                        		<td><c:out value="${board.bno}" /></td>
                                        		<td>
                                        			<a href='${path}/board/get?bno=<c:out value="${board.bno}"/>'>
                                        				<c:out value="${board.title}" />
                                        			</a>
                                        		</td>
                                        		<td><c:out value="${board.title}" /></td>
                                        		<td><c:out value="${board.writer}" /></td>
                                        		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                        		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
            <!-- Footer -->
            <c:import url="../includes/footer.jsp" />
        </div>
        <!-- End of Content Wrapper -->

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
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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
                <div class="modal-body">????????? ?????????????????????.</div>
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
    		
    		history.replace({}, null, null);
    		
    		function checkModal(result) {
    			if(result == '' || history.state) {
    				return;
    			}
    			if(parseInt(result) > 0){
    				$(".modal-body").html("????????? " + parseInt(result) + " ?????? ?????????????????????.");
    			}
    			
    			$("#myModal").modal("show");
    		}
    		
    		$("#regBtn").on("click", function() {
    			self.location = "${path}/board/register";
    		});
    	});
    </script>

    <!-- Bootstrap core JavaScript-->
    <%-- <script src="${path}/resources/vendor/jquery/jquery.min.js"></script> --%>
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${path}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${path}/resources/js/demo/datatables-demo.js"></script>

</body>
</html>