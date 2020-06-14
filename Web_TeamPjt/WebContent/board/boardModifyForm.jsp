<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*"%>

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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">
</head>
<body>

	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		BoardDao boardDao = new BoardDao();

		System.out.println("modify form" + boardNo);
		Board board = boardDao.selectBoardByKey(boardNo);
		board.setId(boardNo);
		List<Board> mlist = boardDao.selectComments(boardNo);
		int cnt = mlist.size();
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#" style="color: #FFCE1E;"
				class="a_500">WEB SERVICE PJ</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link a_400" href="#">랭킹
							보기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400" href="#">아이디어
							보기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#guideModal">이용가이드 </a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="height: 80px; background-color: #FFCE1E;"></div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1">프로젝트 수정하기</h1>
		</div>
	</div>

	<!-- CONTAINER -->
	<div class="container"
		style="background-color: #ffffff; border: 1px solid #a6a6a6; margin-bottom: 50px;">
		<div class="col-md-12" style="text-align: right">
			<button type="button" class="btn btn-labeled btn-warning a_400"
				style="margin-top: 30px; margin-right: 5px;" data-toggle="modal"
				data-target="#upGuideModal">업로드 가이드</button>
		</div>
		<hr class="hr1">

		<form
			action="<%=request.getContextPath()%>/board/boardModifyAction.jsp"
			method="post" enctype="multipart/form-data">
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 제목</a>
				</div>
				<div class="col-sm-8">
					<textarea name="title" id="title" class="form-control"
						style="width: 50%"><%=board.getTitle()%></textarea>
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">이미지 첨부</a> <label
						class="btn-bs-file btn btn-lg btn-warning"> Browse <input
						type="file" name="filename1" size=40>
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
						<select name="interest_1" id="interest_1"
							class="form-control a_400" style="width: 50%">
							<option value="web">WEB</option>
							<option value="android">안드로이드</option>
							<option value="embeded">임베디드</option>
							<option value="ios">IOS</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin15">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 분야</a>
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<select id="interest_2" name="interest_2"
							class="form-control a_400" style="width: 50%">
							<option value="health">건강</option>
							<option value="psychology">심리학</option>
							<option value="game">게임</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 간략 소개</a>
				</div>
				<div class="col-sm-8">
					<textarea name="content" id="content" class="form-control"><%=board.getContent()%></textarea>
				</div>
			</div>

			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 요구사항</a>
				</div>
				<div class="col-sm-8">
					<textarea class="a_400" name="requirements" id="requirements"
						placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오." maxlength="3000"
						rows="10" cols="40"><%=board.getRequirements()%></textarea>

					<div class="message"></div>
				</div>
			</div>
			<!-- <div class="row margin30">
					<div class="col-sm-4"><a class="a_500">해시태그</a></div>
					<div class="col-sm-8">.col-sm-8</div>
				</div> -->
			<hr class="hr1" style="margin-top: 20px; margin-bottom: 80px;">
			<div style="text-align: center; margin-bottom: 80px;">
				<button type="submit" class="btn btn-warning a_400">
					<input name="boardNo" value="<%=boardNo%>" type="hidden" />수정하기
				</button>

			</div>
		</FORM>

		<%
			}
		%>
	
</body>
</html>