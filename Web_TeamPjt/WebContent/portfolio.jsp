
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="mypage.portfolio"%>

<%@ page import="mypage.DBEventDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="./img/favicon/ecology.png">
<link rel="stylesheet" href="./css/all/all.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/googleFont.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>

<body>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

	String userID = "admin3";

	if (session.getAttribute("userID") != null) {

		userID = (String) session.getAttribute("userID");

	}

	int pageNumber = 1; //기본 페이지 넘버

	//페이지넘버값이 있을때

	if (request.getParameter("pageNumber") != null) {

		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

	}
	%>







	<!-- 네비게이션  -->

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
					<li class="nav-item active"><a class="nav-link a_400" href="#">아이디어
							보기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400" href="#">프로젝트
							시작하기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#guideModal">이용가이드 </a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="height: 100px; background-color: #FFCE1E;"></div>
	<div style="height: 5px; background-color: #b0aea9;"></div>

	<!-- Carousel -->
	<div class="bs-example">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Carousel indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="./img/main/main_1.jpg" alt="First Slide"
						style="height: 500px; width: 100%;">
					<div class="carousel-caption">
						<p class="a_500"
							style="font-size: 4rem; color: #ffffff; float: left;">아이디어
							랭킹전</p>
						<p class="a_500"
							style="font-size: 2rem; color: #ffffff; float: left;">아이디어내고
							해외여행가자!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="./img/main/main_2.jpg" alt="Second Slide"
						style="height: 500px; width: 100%;">
				</div>
				<div class="carousel-item">
					<img src="./img/main/main_3.jpg" alt="Third Slide"
						style="height: 500px; width: 100%;">
					<div class="carousel-caption">
						<p class="a_500"
							style="font-size: 4rem; color: #5353c6; float: right;">아이디어
							전시회</p>
						<p class="a_500"
							style="font-size: 2rem; color: #6666cc; float: right;">06.20~6.24
							지상최대 아이디어 전시회</p>
					</div>
				</div>
			</div>
			<!-- Carousel controls -->
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#myCarousel"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>

	<div
		style="height: 5px; background-color: #b0aea9; margin-bottom: 40px;">
	</div>


















	<!-- 게시판 -->

	<div class="container">
		<hr>
		<div class="row">
			<div class="write_portfolio">

				<a href="portfolio_write.jsp">외부 프로젝트 추가</a>
			</div>
			<%
				DBEventDAO bbsDAO = new DBEventDAO();

			ArrayList<portfolio> list = bbsDAO.getList(userID, pageNumber);

			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getBbs_id());
			%>
			<div class="col-lg-4 col-sm-6 portfolio-item"
				style="margin-bottom: 30px">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#"><a
								href="portfolioView.jsp?bbsID=<%=list.get(i).getBbs_id()%>"><%=list.get(i).getBbs_title()%></a>
						</h4>
						<p class="card-text">
							<%if(list.get(i).getBbsContent().length()>30){%>
								<%=list.get(i).getBbsContent().substring(0, 31) %>
							<%}else{%>
									<%=list.get(i).getBbsContent()%>
							<%} %>
							<br> 진행 기간 :
							<%=list.get(i).getRegistrationDate()%>
							~
							<%=list.get(i).getCompleteDate()%>
						</p>
					</div>
				</div>
			</div>



			<%
				}
			%>


			<ul class="pagination justify-content-center">
				<%
					if (pageNumber != 1) {
				%>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber - 1%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">이전</span>
				</a></li>

				<%
					}
				int totalPageNum = bbsDAO.totalPage(userID);
				if (pageNumber - 2 > 0) {
				%>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber - 2%>"> <%=pageNumber - 2%>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber - 1%>"> <%=pageNumber - 1%>
				</a></li>
				<%
					} else if (pageNumber - 1 > 0) {
				%>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber - 1%>"> <%=pageNumber - 1%>
				</a></li>
				<%
					}
				if (pageNumber + 2 <= totalPageNum) {
				%>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber + 1%>"> <%=pageNumber + 1%>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber + 2%>"> <%=pageNumber + 2%>
				</a></li>
				<%
					} else if (pageNumber + 1 <= totalPageNum) {
				%>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber + 1%>"> <%=pageNumber + 1%>
				</a></li>

				<%
					}

				if (bbsDAO.nextPage(userID, pageNumber)) {
				%>
				<li class="page-item"><a class="page-link"
					href="portfolio.jsp?pageNumber=<%=pageNumber + 1%>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">다음</span>
				</a></li>

				<%
					}
				%>
			</ul>
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

		<!-- Bootstrap core JavaScript -->
		<script src="./vendor/jquery/jquery.min.js"></script>
		<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
</body>
</html>






