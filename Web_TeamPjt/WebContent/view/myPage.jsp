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
<link rel="stylesheet" href="../css/myPage/myPage.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/googleFont.css">
<link rel="stylesheet" href="../css/card.css">
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
						<a class="nav-link a_400" href="#">프로젝트 시작하기
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
	
	<div style="height:80px; background-color:#FFCE1E; margin-bottom:30px;	">
	</div>


	
	<!-- Page Content -->
  <div class="container" style="min-height:1000px; padding:80px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">

  
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active a_500" style="color:#FFCE1E;" data-toggle="tab" href="#home">쪽지</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu1">개인정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu2">아이디어</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu3">포트폴리오</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="home" class="container tab-pane active" ><br>
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
				<p class="p_400" style="color:#cccccc;">쪽지 내용을 클릭하시면 상세 보기가 가능합니다.</p>
				<ul class="pagination justify-content-center">
			  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
	    </div>
	    <div id="menu1" class="container tab-pane fade"><br>
	      <p class="p_400" style="color:#cccccc;">개인정보 조회 및 수정은 인증이 필요합니다.</p>
	      <button type="button" class="btn btn-outline-dark" style="margin-right:20px;">개인정보 조회</button>
	      <button type="button" class="btn btn-outline-dark">개인정보 수정</button>
	    </div>
	    <hr>
	    <div id="menu2" class="container tab-pane fade"><br>
		    <div id="home" class="container tab-pane active" ><br>
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
	    	<p class="p_400" style="color:#cccccc;">외부 홈페이지의 포트폴리오 업로드가 가능합니다.</p>
	      	<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#portfolioModal">
	      		<a class="a_400">추가하기</a>
	      	</button>
	      	<button type="button" class="btn btn-outline-info a_400" data-toggle="modal" data-target="#infoModal">도움말</button>
		    <hr>
		    
		    <div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px;">
				<div class="card h-100" style="border-color:red; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="../img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project One</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur eum quasi sapiente
							nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
							dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
							<div><button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400">삭제하기</a>
						</button></div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:green; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="../img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Two</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:blue; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="../img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Three</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quos quisquam, error quod sed cumque, odio
							distinctio velit nostrum temporibus necessitatibus et facere
							atque iure perspiciatis mollitia recusandae vero vel quam!</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:#5e3b4b; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="../img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Four</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:#e600e6; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="../img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Five</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:#e2d0d8; border-width:5px;">
					
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="../img/main/main_1.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Six</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Itaque earum nostrum suscipit ducimus nihil
							provident, perferendis rem illo, voluptate atque, sit eius in
							voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400" style="margin-bottom:5px;">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
		</div>
		    
		    <hr>
		    <div id="home" class="container tab-pane active" ><br>
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
  
  <!-- 도움말 ( 색깔 설명 ) MODAL -->
	<div class="modal fade" id="infoModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="text-align:center;">
	
				<!-- Modal body -->
				<hr>
				<p class="p_400" style="background-color:#e2d0d8;">모집중</p>
				<p class="p_400" style="background-color:#e6f5ff;">모집 완료</p>
				<p class="p_400" style="background-color:#0099ff;">개발 완료</p>
				<p class="p_400" style="background-color:#ff4d4d;">개발 중단</p>
				<p class="p_400" style="background-color:#9933ff;">외부프로젝트</p>

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
          <h4 class="modal-title">쪽지 제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <p class="a_500">작성자 : </p>
        <hr>
          	<p class="a_400">쪽지 내용..</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#response_mailModal"><a class="a_400">답장하기</a></button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">닫기</a></button>
        </div>
        
      </div>
    </div>
  </div>
  
  <!-- 쪽지 작성 MODAL -->
    <div class="modal fade" id="response_mailModal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쪽지 제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <hr>
          	<textarea class="a_400" "id="field" placeholder="보내실 내용을 입력하여 주세요.(200자)" maxlength="200" rows="10" cols="40"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">보내기</a></button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">닫기</a></button>
        </div>
        
      </div>
    </div>
  </div>

	<!-- 포트폴리오 추가 모달 -->
	<div class="modal fade" id="portfolioModal">
    <div class="modal-dialog modal-dialog-scrollable" style="max-width:1024px;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title a_400">포트폴리오 추가</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <!-- CONTAINER -->
	<div class="container" style="background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
		<hr class="hr1" style="margin-top:50px;">
		
		<form>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4"><a class="a_500">프로젝트 제목</a></div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr" style="width:50%">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
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
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 진행 기간</a> 
				</div>
				<div class="col-sm-8">
					<input type="date"><a> ~ </a><input type="date">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
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
			
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
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
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 참여자 수</a> 
				</div>
				<div class="col-sm-8">
					<input type="number" style="width:50%" min="1" max="10">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4"><a class="a_500">프로젝트 간략 소개</a></div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
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
		<hr class="hr1" style="margin-top:20px;margin-bottom:30px;">
		<div style="text-align:center; margin-bottom:30px;">
			<button type="button" class="btn btn-warning a_400" onclick="uploadAlert()">게시하기</button>
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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="../js/alertScript.js" ></script>
	<script src="../js/myPage/myPage.js"></script>

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




