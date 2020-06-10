<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="User.User"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	
		UserDAO userDAO = new UserDAO();
		User user = new User();
			
		user = userDAO.getDB(id);
	%>

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
	
	
	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="userUpdateAction.jsp">
					<h3 style="text-align: center;">회원 정보 수정</h3>
					<div class="form-group">
						<span>아이디</span>
						<input type="text" class="form-control" placeholder="아이디"
							name="userId" maxlength="20" value="<%=user.getId()%>" readonly>
					</div>
					<div class="form-group">
						<span>비밀번호</span>
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPwd" maxlength="20">
					</div>
					<div class="form-group">
						<span>닉네임</span>
						<input type="text" class="form-control" placeholder="닉네임"
							name="userNickname" maxlength="20" value="<%=user.getNickname()%>">
					</div>
					<div class="form-group">
						<span>이메일</span>
						<input type="text" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="50" value="<%=user.getEmail()%>">
					</div>
					<div class="form-group">
						<span>전화번호</span>
						<input type="text" class="form-control" placeholder="전화번호"
							name="userNumber" maxlength="50" value="<%=user.getNumber()%>">
					</div>

					<input type="submit" class="btn btn-primary form-control" value="저장">

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
