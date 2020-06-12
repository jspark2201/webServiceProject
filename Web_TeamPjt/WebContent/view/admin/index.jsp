<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<style>
	.userDiv, .ideaDiv {
		display: inline-block;
		width: 45%;
	}
</style>

<body>

	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">JSP 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li class="active"><a href="userManage.jsp">회원관리</a></li>
				<li class="active"><a href="ideaManage.jsp">아이디어관리</a></li>
			</ul>
	</nav>


	<div class="container">
		<div class="userDiv">
			<canvas id="userChart"></canvas>
		</div>
		<div class="ideaDiv">
			<canvas id="ideaChart"></canvas>			
		</div>
	</div>

	<!-- 부트스트랩 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"> </script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"> </script>
	
	<!-- 차트 -->
	<script>
		var ctx = document.getElementById('userChart');
		var myChart = new Chart(ctx,
				{ type: 'bar',
					data:
					{ labels: ['이번주 가입자 수', '이번달 가입자 수', '누적 가입자 수'],
						datasets: [{
							label: '가입자 통계',
							data: [3, 12, 19],
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
							data: [19, 15, 8, 2],
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
