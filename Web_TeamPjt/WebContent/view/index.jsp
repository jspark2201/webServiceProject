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
<link rel="stylesheet" href="../css/index/index.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="../css/googleFont.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Calligraffitti&family=Permanent+Marker&family=Special+Elite&display=swap"
	rel="stylesheet">

</head>
<body>
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
					<li class="nav-item active"><a class="nav-link a_400" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#aboutModal">About</a></li>
					<li class="nav-item"><a class="nav-link a_400"
						href='./join.jsp'>회원가입</a></li>
					<li class="nav-item"><a class="nav-link a_400"
						data-toggle="modal" data-target="#loginModal">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="img1" src="../img/index/index.jpg" alt="Los Angeles"
					width="100%" height="100%">
				<div class="carousel-caption">
					<p
						style="font-size: 5rem; font-family: 'Permanent Marker', cursive; color: #002b80;">CREATIVE</p>
					<p
						style="font-size: 3rem; font-family: 'Permanent Marker', cursive; margin-bottom: 40%; color: #003cb3;">creative!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="img1" src="../img/index/index2.jpg" alt="Chicago"
					width="100%" height="100%">
				<div class="carousel-caption">
					<p
						style="font-size: 5rem; color: #ffffff; margin-left: 50%; font-family: 'Special Elite', cursive;">IMAGINATION</p>
					<p
						style="font-size: 3rem; color: #f2f2f2; margin-left: 50%; font-family: 'Special Elite', cursive; margin-bottom: 20%;">imagine!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="img1" src="../img/index/index3.jpg" alt="New York"
					width="100%" height="100%">
				<div class="carousel-caption">
					<p
						style="font-size: 5rem; color: #00cc00; margin-right: 50%; font-family: 'Calligraffitti', cursive;">COLLABORATION</p>
					<p
						style="font-size: 3rem; color: #00e600; margin-right: 50%; font-family: 'Calligraffitti', cursive; margin-bottom: 20%;">collaboration!</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>



	<!-- The Modal -->
	<!-- 로그인 -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<div class="row" style="margin-top: 20px">
							<div
								class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
								<form role="form" method="post" action="../Login">
									<fieldset>
										<h2>Please Sign In</h2>
										<hr class="colorgraph">
										<div class="form-group">
											<input type="text" name="id"
												class="form-control input-lg" placeholder="Email Address">
										</div>
										<div class="form-group">
											<input type="password" name="pwd"
												class="form-control input-lg" placeholder="Password">
										</div>
										<img class="question_img" src="../img/login/question.png"
											alt=""> <a href="#" data-toggle="modal"
											data-target="#myModal">Forgot Password?</a>
										<hr class="colorgraph">
										<div class="row">
											<div class="col-xs-6 col-sm-6 col-md-6">
												<input type="hidden" name="action" value="checkid">
												<input type="submit"
													class="btn btn-lg btn-success btn-block" value="Sign In">
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6">
												<a href="" class="btn btn-lg btn-primary btn-block">Register</a>
											</div>
										</div>
									</fieldset>
								</form>
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



	<!-- ABOUT -->
	<!-- The Modal -->
	<div class="modal fade" id="aboutModal">
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










	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;
				Web-Service 2020</p>
		</div>
		<!-- /.container -->
	</footer>


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