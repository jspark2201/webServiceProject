<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- ��Ʈ ��ũ -->
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

	<!-- �׺���̼�  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">JSP �Խ���</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">����</a></li>
				<li class="active"><a href="userManage.jsp">ȸ������</a></li>
				<li class="active"><a href="ideaManage.jsp">���̵�����</a></li>
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

	<!-- ��Ʈ��Ʈ�� -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"> </script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"> </script>
	
	<!-- ��Ʈ -->
	<script>
		var ctx = document.getElementById('userChart');
		var myChart = new Chart(ctx,
				{ type: 'bar',
					data:
					{ labels: ['�̹��� ������ ��', '�̹��� ������ ��', '���� ������ ��'],
						datasets: [{
							label: '������ ���',
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
					{ labels: ['������', '�����Ϸ�', '����Ϸ�', '�ߵ�����'],
						datasets: [{
							label: '���̵�� ���',
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
