<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="../img/favicon/ecology.png">
<link rel="stylesheet" href="../css/myPage/myPage1.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/googleFont.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>
<body>
	<%
		String userid = null;
	if (session.getAttribute("userid") != null) {
		userid = (String) session.getAttribute("userid");
	}
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#" style="color: #FFCE1E;"
				class="a_500">WEB SERVICE PJ</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link a_400" href="#">랭킹
							보기 <%= userid %><span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400" href="#">아이디어
							보기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400" href="#">프로젝트
							시작하기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#guideModal">이용가이드 </a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400"
						href="../Login?action=logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400"
						href="../Login?action=mypage">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div
		style="height: 80px; background-color: #FFCE1E; margin-bottom: 30px;">
	</div>



	<!-- Page Content -->
	<div class="container"
		style="height: 1000px; padding: 80px; background-color: #ffffff; border: 1px solid #a6a6a6; margin-bottom: 50px;">


		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#home">쪽지</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu1">개인정보</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu2">아이디어</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu3">임시저장</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu4">알림</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="container tab-pane active">
				<br>
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>Email</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Kent</td>
							<td>clarkkent@mail.com</td>
							<td><a data-toggle="modal" data-target="#mailModal">a</a></td>
						</tr>
						<tr>
							<td>2</td>

							<td>Carter</td>
							<td>johncarter@mail.com</td>
							<td><a data-toggle="modal" data-target="#mailModal">b</a></td>
						</tr>
						<tr>
							<td>3</td>
							<td>Parker</td>
							<td>peterparker@mail.com</td>
							<td><a data-toggle="modal" data-target="#mailModal">c</a></td>
						</tr>
						<tr>
							<td>4</td>
							<td>Parker</td>
							<td>peterparker@mail.com</td>
							<td><a data-toggle="modal" data-target="#mailModal">d</a></td>
						</tr>
						<tr>
							<td>5</td>
							<td>Parker</td>
							<td>peterparker@mail.com</td>
							<td><a data-toggle="modal" data-target="#mailModal">e</a></td>
						</tr>
						<tr>
							<td>6</td>
							<td>Parker</td>
							<td>peterparker@mail.com</td>
							<td><a data-toggle="modal" data-target="#mailModal">f</a></td>
						</tr>
					</tbody>
				</table>
				<p class="p_400" style="color: #cccccc;">쪽지 내용을 클릭하시면 상세 보기가
					가능합니다.</p>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
			<div id="menu1" class="container tab-pane fade">
				<br>
				<p class="p_400" style="color: #cccccc;">개인정보 조회 및 수정은 인증이
					필요합니다.</p>
				<button type="button" class="btn btn-outline-dark"
					onclick="location.href='../Login?action=view&id=<%=userid %>'"
					style="margin-right: 20px;">개인정보 조회</button>
				<button type="button" class="btn btn-outline-dark">개인정보 수정</button>
			</div>
			<div id="menu2" class="container tab-pane fade">
				<br>
				<div id="home" class="container tab-pane active">
					<br>
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
			</div>
			<div id="menu3" class="container tab-pane fade">
				<br>
				<div id="home" class="container tab-pane active">
					<br>
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
			</div>
			<div id="menu4" class="container tab-pane fade">
				<br>
				<div id="home" class="container tab-pane active">
					<br>
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
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 쪽지 MODAL -->
	<div class="modal fade" id="mailModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>




