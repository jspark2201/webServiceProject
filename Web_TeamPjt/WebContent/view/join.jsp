<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDEARIA</title>
<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">

<link href="/Web_TeamPjt/css/googleFont.css" rel="stylesheet">
<link href="/Web_TeamPjt/css/join/join.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/Web_TeamPjt/css/bootstrap.min.css" rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

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
			<a class="navbar-brand" href="index.html" style="color: #FFCE1E;"
				class="a_500">WEB SERVICE PJ</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link a_400" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container info_container">

		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post" action="../Login">
					<h2>
						Please Sign Up <small>It's free and always will be.</small>
					</h2>
					<hr class="colorgraph">

					<div class="form-group">
						<input type="text" name="id" class="form-control input-lg"
							style="width: 50%;" placeholder="Username" tabindex="3">
						
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="pwd" class="form-control input-lg"
									placeholder="Password" tabindex="5">
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="text" name="nickname"
									class="form-control input-lg" placeholder="Nickname"
									tabindex="6">
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="email" name="email" class="form-control input-lg"
							placeholder="Email Address" tabindex="4">
					</div>
					<div class="form-group">
						<input type="phone" name="number" class="form-control input-lg"
							placeholder="Phone Number" tabindex="4">
					</div>
					<div class="row" style="margin-top:30px;margin-bottom:30px;">
            <div class="col-sm-4">
               <a class="a_500">프로젝트 플랫폼</a> 
            </div>
            <div class="col-sm-8">
               <div class="form-group ">
                  <select name="interest" class="form-control a_400" style="width:50%">
                     <option value=web>WEB</option>
                     <option value=android>안드로이드</option>
                     <option value=embebed>임베디드</option>
                     <option value=ios>IOS</option>
                  </select>
               </div>
            </div>
         </div>
         
         <div class="row" style="margin-top:30px;margin-bottom:30px;">
            <div class="col-sm-4">
               <a class="a_500">흥미 분야</a> 
            </div>
            <div class="col-sm-8">
               <div class="form-group ">
                  <select name="interest1" class="form-control a_400"
                   style="width:50%">
                     <option value=health>건강</option>
                     <option value=psychology>심리학</option>
                     <option value=game>게임</option>
                  </select>
                  
               </div>
            </div>
         </div>
               <div class="row">
                  <div class="col-xs-8 col-sm-9 col-md-9">
                     By clicking <strong class="label label-primary">Register</strong>,
                     you agree to the 
                     <a href="#" data-toggle="modal" data-target="#myModal">
                     Terms and Conditions</a>
                      set out by this site, including our Cookie Use.
                  </div>
               </div>
               

               <hr class="colorgraph">
               <div class="row">
                  <div class="col-xs-12 col-md-6">
                  	<input type="hidden" name="action" value="add">
                     <input type="submit" value="Register"
                        class="btn btn-primary btn-block btn-lg" tabindex="7">
                  </div>
               </div>
            </form>
            
         </div>
      </div>
      </div>
      
      <!-- The Modal -->
      <div class="modal" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header">
                  <h1 class="modal-title">Modal Heading</h1>
                  <button type="button" class="close" data-dismiss="modal">×</button>
               </div>

               <!-- Modal body -->
               <div class="modal-body">
                  <h3>Some text to enable scrolling..</h3>
                  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet,
                     consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                     labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                     nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                     commodo consequat. Duis aute irure dolor in reprehenderit in
                     voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum consectetur
                     adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                     dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                     exercitation ullamco laboris nisi ut aliquip ex ea commodo
                     consequat.</p>
                  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet,
                     consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                     labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                     nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                     commodo consequat. Duis aute irure dolor in reprehenderit in
                     voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum consectetur
                     adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                     dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                     exercitation ullamco laboris nisi ut aliquip ex ea commodo
                     consequat.</p>

                  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet,
                     consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                     labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                     nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                     commodo consequat. Duis aute irure dolor in reprehenderit in
                     voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                     Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                     officia deserunt mollit anim id est laborum consectetur
                     adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                     dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                     exercitation ullamco laboris nisi ut aliquip ex ea commodo
                     consequat.</p>
               </div>

               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
      <script src="vendor/jquery/jquery.min.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

     
</html>