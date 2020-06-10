<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Web_TeamPjt.User"%>
<%@ page import="Web_TeamPjt.UserDAO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"

 					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>

					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="userAddAction.jsp">
					<h3 style="text-align: center;">회원 추가</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userId" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPwd" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임"
							name="userNickname" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="전화번호"
							name="userNumber" maxlength="50">
					</div>

					<input type="submit" class="btn btn-primary form-control" value="등록">

				</form>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>



	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
		
	
	</script>
	<!-- 부트스트랩 JS  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>
