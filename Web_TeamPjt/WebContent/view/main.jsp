<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="../img/favicon/ecology.png">
<link rel="stylesheet" href="../css/main/main.css">
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
					<li class="nav-item active"><a class="nav-link a_400" href="#">아이디어
							보기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400" href="#">프로젝트
							시작하기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#guideModal">이용가이드 <%= userid %></a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400"
						href="../Login?action=logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400"
						href="mypage.jsp">마이페이지</a></li>
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
					<img src="../img/main/main_1.jpg" alt="First Slide"
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
					<img src="../img/main/main_2.jpg" alt="Second Slide"
						style="height: 500px; width: 100%;">
				</div>
				<div class="carousel-item">
					<img src="../img/main/main_3.jpg" alt="Third Slide"
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

	<div style="height: 5px; background-color: #b0aea9;"></div>


	<!-- Page Content -->
	<div class="container">
		<div style="width: 100%; padding: 30px; margin: 30px;">
			<div class="rank_div">
				<img class="rank_img" alt="alt" src="../img/main/crown.png">
				<p class="rank_a a_500">실시간 랭킹</p>
			</div>

			<!-- Heading Row -->
			<div class="row align-items-center my-5">
				<div class="col-lg-7">
					<img class="img-fluid rounded mb-4 mb-lg-0"
						src="http://placehold.it/900x400" alt="">
				</div>
				<!-- /.col-lg-8 -->
				<div class="col-lg-5 a_500">
					<h1 class="font-weight-light a_400">Business Name or Tagline</h1>
					<p>This is a template that is great for small businesses. It
						doesn't have too much fancy flare to it, but it makes a great use
						of the standard Bootstrap core components. Feel free to use this
						template for any project you want!</p>
					<a class="btn btn-primary" href="#">Call to Action!</a>
				</div>
				<!-- /.col-md-4 -->
			</div>
			<!-- /.row -->

			<!-- Call to Action Well -->
			<div class="card text-white bg-secondary my-5 py-4 text-center">
				<div class="card-body">
					<p class="text-white m-0 a_400">This call to action card is a
						great place to showcase some important information or display a
						clever tagline!</p>
				</div>
			</div>


			<hr>

			<div class="new_div">
				<img class="new_img" alt="alt" src="../img/main/new.png">
				<p class="new_p a_500">새 게시물</p>
			</div>

			<!-- Content Row -->
			<div class="row">
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<div class="card-body">
							<h2 class="card-title a_500">Card One</h2>
							<p class="card-text a_400">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Rem magni quas ex numquam, maxime
								minus quam molestias corporis quod, ea minima accusamus.</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary btn-sm a_500">More Info</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<div class="card-body">
							<h2 class="card-title a_500">Card Two</h2>
							<p class="card-text a_400">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Quod tenetur ex natus at dolorem
								enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in
								id dolore voluptates quos eligendi labore.</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary btn-sm a_500">More Info</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<div class="card-body">
							<h2 class="card-title a_500">Card Three</h2>
							<p class="card-text a_400">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit. Rem magni quas ex numquam, maxime
								minus quam molestias corporis quod, ea minima accusamus.</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary btn-sm a_500">More Info</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->

			</div>
			<!-- /.row -->
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

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>

</body>
</html>



