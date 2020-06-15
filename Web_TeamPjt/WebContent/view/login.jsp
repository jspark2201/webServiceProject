<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDEARIA</title>
<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">

<link href="/Web_TeamPjt/css/googleFont.css" rel="stylesheet">
<link href="/Web_TeamPjt/css/login/login.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/Web_TeamPjt/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<%
		User user = null;
	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
	}
	%>


	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<!-- <h1>Bootstrap Tutorial</h1>
			<p>Bootstrap is the most popular HTML, CSS...</p> -->
		</div>
	</div>


	<div class="container">

		<div class="row" style="margin-top: 20px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form">
					<fieldset>
						<h2>Please Sign In</h2>
						<hr class="colorgraph">
						<div class="form-group">
							<input type="text" name="id" value=<%=user.getId()%>
								class="form-control input-lg" placeholder="id" readonly>
						</div>
						<div class="form-group">
							<input type="password" name="pwd"
								class="form-control input-lg" placeholder="Password">
						</div>
						<hr class="colorgraph">
						<div class="row">
							<input type="hidden" name="action" value="mcheckid">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="Sign In">
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


	  

	<!-- Bootstrap core JavaScript -->
	<script src="/Web_TeamPjtvendor/jquery/jquery.min.js"></script>
	<script src="/Web_TeamPjtvendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
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