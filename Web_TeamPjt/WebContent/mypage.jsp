
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="mypage.PortfolioBean"%>

<%@ page import="mypage.DBEventDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="./img/favicon/ecology.png">
<link rel="stylesheet" href="./css/myPage/myPage.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/googleFont.css">
<link rel="stylesheet" href="./css/card.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>
<body>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

	String userID = "admin3";
/*
	if (session.getAttribute("userid") != null) {

		userID = (String) session.getAttribute("userid");

	}*/

	int pageNumber = 1; //기본 페이지 넘버

	//페이지넘버값이 있을때

	if (request.getParameter("pageNumber") != null) {

		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

	}
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
					<li class="nav-item active"><a class="nav-link a_400" href="#">프로젝트
							시작하기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#guideModal">이용가이드 </a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400"
						onclick="logoutAlert()">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div
		style="height: 80px; background-color: #FFCE1E; margin-bottom: 30px;">
	</div>



	<!-- Page Content -->
	<div class="container"
		style="min-height: 1000px; padding: 80px; background-color: #ffffff; border: 1px solid #a6a6a6; margin-bottom: 50px;">


		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#home">쪽지</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu1">개인정보</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu2">아이디어</a></li>
			<li class="nav-item"><a class="nav-link a_500"
				style="color: #FFCE1E;" data-toggle="tab" href="#menu3">포트폴리오</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="container tab-pane active">
				<br>
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
				<p class="p_400" style="color: #cccccc;">쪽지 내용을 클릭하시면 상세 보기가
					가능합니다.</p>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
			<div id="menu1" class="container tab-pane fade">
				<br>
				<p class="p_400" style="color: #cccccc;">개인정보 조회 및 수정은 인증이
					필요합니다.</p>
				<button type="button" class="btn btn-outline-dark"
					style="margin-right: 20px;">개인정보 조회</button>
				<button type="button" class="btn btn-outline-dark">개인정보 수정</button>
			</div>
			<hr>
			<div id="menu2" class="container tab-pane fade">
				<br>
				<div id="home" class="container tab-pane active">
					<br>
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
				<p class="p_400" style="color: #cccccc;">외부 홈페이지의 포트폴리오 업로드가
					가능합니다.</p>
				<button type="button" class="btn btn-outline-dark"
					data-toggle="modal" data-target="#portfolioModal">
					<a class="a_400">추가하기</a>
				</button>
				<hr>

				<div class="row">
			<c:forEach items="${Plist}" var="item">


					<div class="col-lg-4 col-sm-6 portfolio-item"
						style="margin-bottom: 30px;">
						<div class="card h-100"
							style="border-color: red; border-width: 5px;">
							<div class="card_img">
								<img style="width: 100%; height: 100%;" alt=""
									src=
									<c:choose>
									<c:when test="${empty item.pictsrc}">
						"http://placehold.it/700x400"
						</c:when>
							<c:otherwise>
						${item.pictsrc}
						</c:otherwise> 
							</c:choose>		>
							</div>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#" class="a_400" style="color: #FFCE1E">Project
										One</a>
								</h4>
								<p class="card-text">
																	<c:choose>
									<c:when test="${fn:length(item.bbsContent)>30}">
								${item.bbsContent.substring(0,31)}
								</c:when>
									<c:otherwise>
							${item.bbsContent}
							</c:otherwise>
								</c:choose>
								<br> 진행 기간 : {item..registrationDate} ~
								${item.completeDate}

								</p>

								<div>
									<button type="button" class="btn btn-outline-danger btn-sm"
										style="position: absolute; left: 60%; top: 90%;" onclick="">
										<a class="a_400">삭제하기</a>
									</button>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>

				</div>

				<hr>
				<div id="home" class="container tab-pane active">
					<br>
					<ul class="pagination justify-content-center">
					
<ul class="pagination justify-content-center">
				<%
					if (pageNumber != 1) {
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber - 1%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">이전</span>
				</a></li>

				<%
					}
				int totalPageNum = (int) session.getAttribute("totalPage");
				if (pageNumber - 2 > 0) {
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber - 2%>"> <%=pageNumber - 2%>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber - 1%>"> <%=pageNumber - 1%>
				</a></li>
				<%
					} else if (pageNumber - 1 > 0) {
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber - 1%>"> <%=pageNumber - 1%>
				</a></li>
				<%
					}
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber%>"> <%=pageNumber%>
				</a></li>
				<%
				if (pageNumber + 2 <= totalPageNum) {
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber + 1%>"> <%=pageNumber + 1%>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber + 2%>"> <%=pageNumber + 2%>
				</a></li>


				<%
					} else if (pageNumber + 1 <= totalPageNum) {
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber + 1%>"> <%=pageNumber + 1%>
				</a></li>

				<%
					}
				boolean isNext = (boolean) session.getAttribute("isNext");
				if (isNext) {
				%>
				<li class="page-item"><a class="page-link"
					href="mypage.jsp?pageNumber=<%=pageNumber + 1%>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">다음</span>
				</a></li>

				<%
					}
				%>
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
				<div class="modal-body">Modal body..</div>

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
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 포트폴리오 추가 모달 -->
	<div class="modal fade" id="portfolioModal">
		<div class="modal-dialog modal-dialog-scrollable"
			style="max-width: 1024px;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title a_400">포트폴리오 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<!-- CONTAINER -->
					<div class="container"
						style="background-color: #ffffff; border: 1px solid #a6a6a6; margin-bottom: 50px;">
						<hr class="hr1" style="margin-top: 50px;">

						<form>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 제목</a>
								</div>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="usr"
										style="width: 50%">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">이미지 첨부</a> <label
										class="btn-bs-file btn btn-lg btn-warning"> Browse <input
										type="file" />
								</div>
								<div class="col-sm-8">
									<img class="img-fluid rounded mb-4 mb-lg-0"
										src="http://placehold.it/400x400" alt="">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 플랫폼</a>
								</div>
								<div class="col-sm-8">
									<div class="form-group ">
										<select id="interest_1" class="form-control a_400"
											style="width: 50%">
											<option>WEB</option>
											<option>안드로이드</option>
											<option>임베디드</option>
											<option>IOS</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">흥미 분야</a>
								</div>
								<div class="col-sm-8">
									<div class="form-group ">
										<select id="interest_1" class="form-control a_400"
											style="width: 50%">
											<option>건강</option>
											<option>심리학</option>
											<option>게임</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 간략 소개</a>
								</div>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="usr">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 소개</a>
								</div>
								<div class="col-sm-8">
									<textarea class="a_400" "id="field"
										placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오."
										maxlength="3000" rows="10" cols="40"></textarea>

									<div class="message"></div>
								</div>
							</div>
							<!-- <div class="row margin30">
				<div class="col-sm-4"><a class="a_500">해시태그</a></div>
				<div class="col-sm-8">.col-sm-8</div>
			</div> -->
						</form>
						<hr class="hr1" style="margin-top: 20px; margin-bottom: 30px;">
						<div style="text-align: center; margin-bottom: 30px;">
							<button type="button" class="btn btn-warning a_400"
								onclick="uploadAlert()">게시하기</button>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="./vendor/jquery/jquery.min.js"></script>
	<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="./js/alertScript.js"></script>
	<script src="./js/myPage/myPage.js"></script>

	<script type="text/javascript">
		/*global $, console*/

		$(function() {
			"use strict";
			var maxText = $("textarea").attr("maxlength"), ourMessage = $(".message");
			ourMessage.html('<span>' + maxText + '</span> / 3000');
			$("textarea")
					.keyup(
							function() {
								var textLength = $(this).val().length, remText = maxText
										- textLength;
								ourMessage.html('<span>' + remText
										+ '</span> / 3000');
							});
		});
	</script>
</body>
</html>