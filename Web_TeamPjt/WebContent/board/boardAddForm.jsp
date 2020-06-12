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
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
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

		<form action="<%=request.getContextPath()%>/board/boardAddAction.jsp" method="post"  enctype="multipart/form-data">
    			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">프로젝트 제목</a></div>
				<div class="col-sm-8">
					<input name="title" id="title" type="text" class="form-control" style="width:50%">
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">이미지 첨부</a> 
					<label class="btn-bs-file btn btn-lg btn-warning"> 
						Browse 
					   <input type="file" name="filename1" size=40>
    				</label>
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
						<label for= "platform" style="width:5%"></label>
				        <input type = "checkbox" name = "platform" value = "web">web
				        <input type = "checkbox" name = "platform" value = "android">android
				        <input type = "checkbox" name = "platform" value = "embeded">embeded
						<input type = "checkbox" name = "platform" value = "ios">ios
					</div>
				</div>
			</div>
			<div class="row margin15">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 분야</a> 
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<label for= "genre" style="width:5%"></label>
				        <input type = "checkbox" name = "genre" value = "health">health
				        <input type = "checkbox" name = "genre" value = "psychology">psychlogy
				        <input type = "checkbox" name = "genre" value = "game">game
					</div>
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">프로젝트 간략 소개</a></div>
				<div class="col-sm-8">
					<input name="content" id="content" type="text" class="form-control" id="usr">
				</div>
			</div>

			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">프로젝트 요구사항</a></div>
				<div class="col-sm-8">
					 <textarea class="a_400" name="requirements" id="requirements" placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오." maxlength="3000" rows="10" cols="40"></textarea>
    
        <div class="message"></div>
				</div>
 			</div>
			<!-- <div class="row margin30">
				<div class="col-sm-4"><a class="a_500">해시태그</a></div>
				<div class="col-sm-8">.col-sm-8</div>
			</div> -->
    		<hr class="hr1" style="margin-top:20px;margin-bottom:80px;">
		<div style="text-align:center; margin-bottom:80px;">
			<button type="reset" class="btn btn-secondary a_400">초기화</button>
			<button type="submit" class="btn btn-warning a_400">게시하기</button>
		</div>
</form>

</body>
</html>