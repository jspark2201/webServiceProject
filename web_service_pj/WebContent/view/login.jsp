<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDEARIA</title>
<link rel="shortcut icon" href="../img/favicon/ecology.png">

<link href="../css/login/login.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<!-- <h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS...</p> -->
		</div>
	</div>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">Start Bootstrap</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="services.html">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					</li>
					<li class="nav-item active dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Portfolio </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="portfolio-1-col.html">1 Column
								Portfolio</a> <a class="dropdown-item" href="portfolio-2-col.html">2
								Column Portfolio</a> <a class="dropdown-item active"
								href="portfolio-3-col.html">3 Column Portfolio</a> <a
								class="dropdown-item" href="portfolio-4-col.html">4 Column
								Portfolio</a> <a class="dropdown-item" href="portfolio-item.html">Single
								Portfolio Item</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Blog </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
							<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
							<a class="dropdown-item" href="blog-post.html">Blog Post</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Other Pages </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="full-width.html">Full Width
								Page</a> <a class="dropdown-item" href="sidebar.html">Sidebar
								Page</a> <a class="dropdown-item" href="faq.html">FAQ</a> <a
								class="dropdown-item" href="404.html">404</a> <a
								class="dropdown-item" href="pricing.html">Pricing Table</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">

		<div class="row" style="margin-top: 20px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form">
					<fieldset>
						<h2>Please Sign In</h2>
						<hr class="colorgraph">
						<div class="form-group">
							<input type="email" name="email" id="email"
								class="form-control input-lg" placeholder="Email Address">
						</div>
						<div class="form-group">
							<input type="password" name="password" id="password"
								class="form-control input-lg" placeholder="Password">
						</div>
							<img class="question_img" src="../img/login/question.png" alt="">
							<a href="#" data-toggle="modal" data-target="#myModal">Forgot Password?</a>
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="Sign In">
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

	<div class="info_div"></div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;
				Web-Service 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<form role="forgot_form">
						<hr class="colorgraph">
						<label>Current Password</label>
						<div class="form-group pass_show">
							<input type="password" value="faisalkhan@123"
								class="form-control" placeholder="Current Password">
						</div>
						<label>New Password</label>
						<div class="form-group pass_show">
							<input type="password" value="faisal.khan@123"
								class="form-control" placeholder="New Password">
						</div>
						<label>Confirm Password</label>
						<div class="form-group pass_show">
							<input type="password" value="faisal.khan@123"
								class="form-control" placeholder="Confirm Password">
						</div>
						<hr class="colorgraph">
						<button type="button" class="btn btn-info conFirm_alert">CONFIRM</button>
					</form>
				</div>
			</div>
		</div>
				<!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

	  

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$('.pass_show').append('<span class="ptxt">Show</span>');  
			});
			  
			
			$(document).on('click','.pass_show .ptxt', function(){ 
			
			$(this).text($(this).text() == "Show" ? "Hide" : "Show"); 
			
			$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 
			
		});  
	</script>

</body>

</html>