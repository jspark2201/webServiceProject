<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="User.User"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IDEARIA</title>
	
	<link rel="shortcut icon" href="/img/favicon/ecology.png">
	<link rel="stylesheet" href="/css/myPage/myPage1.css">
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/googleFont.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#" style="color:#FFCE1E;" class="a_500">WEB SERVICE PJ</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">��ŷ ����
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">���̵�� ����
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">������Ʈ �����ϱ�
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" data-toggle="modal" data-target="#guideModal">�̿밡�̵�
						</a>
					</li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">ȸ������</a></li> -->
					<li class="nav-item"><a class="nav-link a_400" href="#">�α׾ƿ�</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">����������</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div style="height:80px; background-color:#FFCE1E; margin-bottom:30px;	">
	</div>


	<%
		// mode�� ���� ��� ��ȯ
		String type = request.getParameter("type");
		String search = request.getParameter("search");
		String order = request.getParameter("order");
		int curPageNum = (Integer)request.getAttribute("curPageNum");
		int pageCount = (Integer)request.getAttribute("PageCount");
			
			
		String src = "users.do?";
		
		if (search != null) {
			if (!search.equals("")) {
				src += "type=" + type + "&";
				src += "search=" + search + "&";
			}
		}

	%>

	
	<!-- Page Content -->
  <div class="container" style="padding:80px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">

  
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active a_500" style="color:#FFCE1E;" data-toggle="tab" href="#home">Home</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#user">ȸ������</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#idea">���̵�����</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="home" class="container tab-pane active" ><br>
				<table class="table">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="<%=src%>order=id">���̵�</a>
							</th>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="<%=src%>order=nickname">�г���</a>
							</th>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="<%=src%>order=email">�̸���</a>
							</th>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="<%=src%>order=date">������</a>
							</th>
							<th style="background-color: #eeeeee; text-align: center;">����</th>
							<th style="background-color: #eeeeee; text-align: center;">���</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${UserList}">
							<tr>
								<td><c:out value="${user.id}"/></td>
								<td><c:out value="${user.nickname}"/></td>
								<td><c:out value="${user.email}"/></td>
								<td><c:out value="${user.date}"/></td>
								<td><a href='userUpdate.do?id=<c:out value="${user.id}"/>'/>����</td>
								<td><input type="checkbox" id='<c:out value="${user.id}"/>'/></td>							
							</tr>					
						</c:forEach>	
					</tbody>
				</table>
				<p class="p_400" style="color:#cccccc;">���� ������ Ŭ���Ͻø� �� ���Ⱑ �����մϴ�.</p>
				<ul class="pagination justify-content-center">
			  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
	    </div>
	    <div id="menu1" class="container tab-pane fade"><br>
	      <h3>Menu 1</h3>
	      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	    </div>
	    <div id="menu2" class="container tab-pane fade"><br>
		    <div id="home" class="container tab-pane active" ><br>
			    <ul class="pagination justify-content-center">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">1</a></li>
				  <li class="page-item"><a class="page-link" href="#">2</a></li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
		    </div>
	    </div>
	    <div id="menu3" class="container tab-pane fade"><br>
		    <div id="home" class="container tab-pane active" ><br>
			    <ul class="pagination justify-content-center">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">1</a></li>
				  <li class="page-item"><a class="page-link" href="#">2</a></li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
		    </div>
	    </div>
	    <div id="menu4" class="container tab-pane fade"><br>
		    <div id="home" class="container tab-pane active" ><br>
			    <ul class="pagination justify-content-center">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">1</a></li>
				  <li class="page-item"><a class="page-link" href="#">2</a></li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
		    </div>
	    </div>
	  </div>
  </div>
  <!-- /.container -->



	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white a_500">Copyright &copy;
				Web-Service 2020</p>
		</div>
		<!-- /.container -->
	</footer>
	
	
	
	
	
	<!-- MODAL  -->
	
	<!-- GUIDE -->
  <div class="modal fade" id="guideModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  <!-- ���� MODAL -->
  <div class="modal fade" id="mailModal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>




