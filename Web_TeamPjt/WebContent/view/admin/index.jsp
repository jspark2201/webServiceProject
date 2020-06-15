<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="User.UserDTO"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>IDEARIA</title>
	
	<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">
	<link rel="stylesheet" href="/Web_TeamPjt/css/myPage/myPage1.css">
	<link rel="stylesheet" href="/Web_TeamPjt/css/bootstrap.min.css">
	<link rel="stylesheet" href="/Web_TeamPjt/css/googleFont.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<style>
		.table td { text-align: center; }
		.tab-content > .container {
			text-align: center;
		}
		.userDiv, .ideaDiv {
			display: inline-block;
			width: 45%;
			min-width: 380px;
			margin: 80px 20px 60px 20px;
		}
	</style>
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
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div style="height:80px; background-color:#FFCE1E; margin-bottom:30px;	">
	</div>


	
	<!-- Page Content -->
  <div class="container" style="padding:80px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">

  
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active a_500" style="color:#FFCE1E;" href="main.do">Home</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" href="users.do">회원관리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" href="ideas.do">아이디어관리</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="home" class="container tab-pane active" ><br>
			<div class="userDiv">
				<canvas id="userChart"></canvas>
			</div>
			<div class="ideaDiv">
				<canvas id="ideaChart"></canvas>			
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
  
  <!-- 쪽지 MODAL -->
  <div class="modal fade" id="mailModal">
    <div class="modal-dialog modal-xl">
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
	<script src="/Web_TeamPjt/vendor/jquery/jquery.min.js"></script>
	<script src="/Web_TeamPjt/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
		<!-- 차트 -->
	<script>
		var ctx = document.getElementById('userChart');
		var myChart = new Chart(ctx,
				{ type: 'bar',
					data:
					{ labels: ['이번주 가입자 수', '이번달 가입자 수', '누적 가입자 수'],
						datasets: [{
							label: '가입자 통계',
							data: [
									<c:out value="${UserCount[0]}"/>,
									<c:out value="${UserCount[1]}"/>,
									<c:out value="${UserCount[2]}"/>,
								],
							backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)'],
							borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
							borderWidth: 1
						}]
					},
					options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } }
				}
		);
	</script>
	
		<script>
		var ctx = document.getElementById('ideaChart');
		var myChart = new Chart(ctx,
				{ type: 'bar',
					data:
					{ labels: ['모집중', '모집완료', '진행완료', '중도포기'],
						datasets: [{
							label: '아이디어 통계',
							data: [
									<c:out value="${IdeaCount[0]}"/>,
									<c:out value="${IdeaCount[1]}"/>,
									<c:out value="${IdeaCount[2]}"/>,
									<c:out value="${IdeaCount[2]}"/>
								],
							backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)'],
							borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'],
							borderWidth: 1
						}]
					},
					options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } }
				}
		);
	</script>
</body>
</html>




