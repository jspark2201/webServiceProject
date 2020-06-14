
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="mypage.PortfolioBean"%>

<%@ page import="mypage.DBEventDAO"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>
<%-- <%
      String userid = null;
	
   if (session.getAttribute("userid") != null) {
      userid = (String) session.getAttribute("userid");
   }else{
	   out.println("<script>alert('로그인하신 후 이용해주십시오.');</script>");
	   %>
	   <script type="text/javascript">setTimeout(response.sendRedirect("index.jsp"), 1000);</script>
	   <%
   }
%> --%>
<link rel="shortcut icon" href="../img/favicon/ecology.png">
<link rel="stylesheet" href="../css/detail/detail1.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/googleFont.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>

<body>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = "admin3";
	/*
		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

	

		}*/

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'mypage.jsp'");

			script.println("</script>");

		}

		PortfolioBean port = new DBEventDAO().getPortfolio(bbsID);

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
							보기 <span class="sr-only">(current)</span>
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
						onclick="logoutAlert()">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="height: 80px; background-color: #FFCE1E;"></div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1"><%= port.getBbs_title() %>.
			</h1>
		</div>
	</div>



	<!-- Page Content -->
	<div class="container"
		style="padding: 100px; background-color: #ffffff; border: 1px solid #a6a6a6; margin-bottom: 50px;">

		<hr class="hr1">
		<div class="row">
			<div class="row a_400" style="font-size: 2rem; margin: 30px;">
				<%= port.getBbs_title() %>.
			</div>


			<!-- Post Content Column -->
			<div>
				<!-- class="col-lg-8" -->

				<!-- Preview Image -->
				<img class="img-fluid rounded" src="http://placehold.it/900x300"
					alt="">

				<hr class="hr1">

				<!-- Date/Time -->
				<p>Posted on January 1, 2017 at 12:00 PM</p>

				<hr class="hr1">

				<div class="row a_400" style="font-size: 1.5rem; margin: 30px;">
					프로젝트 소개</div>
				<!-- Post Content -->
				<p class="lead">
					<%= port.getBbsContent() %>
				</p>

				<hr class="hr1">




			</div>
		</div>
		<!-- /.row -->

		<hr>
		<%if(userID != null && userID.equals(port.getUserID())){ %>


		<button type="button" class="btn btn-outline-warning" onclick="">글수정</button>
		<form action="portfolio_delete_action.jsp" method="post">
			<input name="bbsID" value="<%= bbsID %>" type="hidden" />
			<button type="submit" method="post" class="btn btn-outline-danger"
				style="position: absolute; right: 3%; bottom: 3%;" onclick="">
				<a class="a_400">삭제하기</a>
			</button>
		</form>
		<%}%>
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


	<!-- 참여자 명단 MODAL -->
	<div class="modal fade" id="memberModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<a class="a_400">명단관리</a>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<a class="a_400">개발자 : </a>
						</div>
						<div class="row">
							<a class="a_400">참여 개발자 : </a>
						</div>
						<hr>
						<a class="a_400" style="font-size: 1rem;">신청한 개발자</a>
						<div class="row" style="text-align: center;">
							<div class="row" style="text-align: center;">
								<div class="col-sm-3">
									<a class="a_400">능식</a>
								</div>
								<div class="col-sm-3" style="width: 600px;">
									<a class="a_400">ks1466@naver.com</a>
								</div>
								<div class="col-sm-3">
									<img src="../img/detail/check.png" alt="추가하기"
										onclick="alert('이전');" />
								</div>
								<div class="col-sm-3">
									<img src="../img/detail/cross.png" alt="삭제하기"
										onclick="alert('이전');" />
								</div>
							</div>
						</div>
						<hr>
						<a class="a_400" style="font-size: 1rem;">참여중 개발자</a>
						<div class="row" style="text-align: center;">
							<div class="row" style="text-align: center;">
								<div class="col-sm-3">
									<a class="a_400">능식</a>
								</div>
								<div class="col-sm-3" style="width: 600px;">
									<a class="a_400">ks1466@naver.com</a>
								</div>
								<div class="col-sm-3">
									<img src="../img/detail/check.png" alt="추가하기"
										onclick="alert('이전');" />
								</div>
								<div class="col-sm-3">
									<img src="../img/detail/cross.png" alt="삭제하기"
										onclick="alert('이전');" />
								</div>
							</div>
						</div>
					</div>
				</div>

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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="../js/alertScript.js"></script>
	<script type="text/javascript" src="../js/detail/detail.js"></script>

</body>
</html>


