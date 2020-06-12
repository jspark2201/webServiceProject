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
<link rel="stylesheet" href="../css/write/write1.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/googleFont.css">
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
						<a class="nav-link a_400" href="#">랭킹 보기
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">아이디어 보기
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" data-toggle="modal" data-target="#guideModal">이용가이드
						</a>
					</li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400" onclick="logoutAlert()">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div style="height:80px; background-color:#FFCE1E;">
	</div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1">프로젝트 신청하기</h1>
		</div>
	</div>



	<!-- CONTAINER -->
	<div class="container" style="background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
		<div class="col-md-12" style="text-align:right">
			<button type="button" class="btn btn-labeled btn-warning a_400" style="margin-top:30px;margin-right:5px;" data-toggle="modal" data-target="#upGuideModal">업로드 가이드</button>
		</div>
		<hr class="hr1">
		
		<form>
			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">프로젝트 제목</a></div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr" style="width:50%">
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">이미지 첨부</a> 
					<label class="btn-bs-file btn btn-lg btn-warning"> 
						Browse 
					<input type="file" />
				</div>
				<div class="col-sm-8">
					<img class="img-fluid rounded mb-4 mb-lg-0"
					src="http://placehold.it/400x400" alt="">
				</div>
			</div>
			<div class="row margin15">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 플랫폼</a> 
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<select id="interest_1" class="form-control a_400" style="width:50%">
							<option>WEB</option>
							<option>안드로이드</option>
							<option>임베디드</option>
							<option>IOS</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin15">
				<div class="col-sm-4">
					<a class="a_500">흥미 분야</a> 
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<select id="interest_1" class="form-control a_400" style="width:50%">
							<option>건강</option>
							<option>심리학</option>
							<option>게임</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">프로젝트 간략 소개</a></div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr">
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">프로젝트 소개</a></div>
				<div class="col-sm-8">
					 <textarea class="a_400" "id="field" placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오." maxlength="3000" rows="10" cols="40"></textarea>
    
    <div class="message"></div>
				</div>
			</div>
			<!-- <div class="row margin30">
				<div class="col-sm-4"><a class="a_500">해시태그</a></div>
				<div class="col-sm-8">.col-sm-8</div>
			</div> -->
		</form>
		<hr class="hr1" style="margin-top:20px;margin-bottom:80px;">
		<div style="text-align:center; margin-bottom:80px;">
			<!-- <button type="button" class="btn btn-secondary a_400">임시저장</button> -->
			<button type="button" class="btn btn-warning a_400">게시하기</button>
			<!-- <p class="p_400" style="color:#cccccc;">임시저장한 아이디어 프로젝트는 [마이페이지]에서 재 작성 하실 수 있습니다.</p> -->
		</div>
	</div>

	



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
  
  	<!-- UPLOAD GUIDE -->
  <div class="modal fade" id="upGuideModal">
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

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="../js/alertScript.js" ></script>
	
	<script type="text/javascript">
	/*global $, console*/
	
	
		$(function() {
			"use strict";
			var maxText = $("textarea").attr("maxlength"),
			ourMessage = $(".message");
			ourMessage
					.html('<span>' + maxText + '</span> / 3000');
			$("textarea").keyup(
					function() {
						var textLength = $(this).val().length,
						remText = maxText - textLength;
						ourMessage.html('<span>' + remText
								+ '</span> / 3000');
					});
		});
	</script>
</body>
</html>




