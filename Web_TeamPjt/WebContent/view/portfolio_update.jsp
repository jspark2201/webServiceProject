<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="mypage.PortfolioBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="mypage.DBEventDAO"%>

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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>

<body>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;
		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");



		} 

		//로그인 안한 경우

		if(userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

			

		}

		

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'portfolio.jsp'");

			script.println("</script>");

		}
		DBEventDAO DAO = DBEventDAO.getInstance();
		PortfolioBean port = DAO.getPortfolio(bbsID);
		
		String picsrc = DAO.getPict(bbsID);
		System.out.println("테스트 : " +picsrc);
		if (!userID.equals(port.getUserID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('권한이 없습니다.')");

			script.println("location.href = 'portfolio.jsp'");

			script.println("</script>");				

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

	<div style="height: 80px; background-color: #FFCE1E;"></div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1">포트폴리오 수정하기</h1>
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

		<form method="post"
			action="portfolio_update_action.jsp?bbsID=<%= bbsID %> ">


			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 제목</a>
				</div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr" style="width: 50%"
						name="bbsTitle" value="<%= port.getBbs_title() %>">
				</div>

			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">이미지 첨부</a> <label
						class="btn-bs-file btn btn-lg btn-warning"> Browse <input
						type="file" name="pictsrc" id="pictsrc" />
				</div>
				<div class="col-sm-8">
				
					<img class="img-fluid rounded mb-4 mb-lg-0" id='preview'
						style="height: 100%; width: 400px;"
						src="<%if(picsrc==null) {%>http://placehold.it/400x400<%}else{ %> <%=picsrc %><%} %>" alt="">
				</div>
			</div>

			<div class="row margin15">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 진행 기간</a>
				</div>
				<div class="col-sm-8">
					<input type="date" class="form-control" placeholder="시작 날짜"
						name="registrationDate" value="<%=port.getRegistrationDate()%>"><a> ~ </a><input type="date"
						class="form-control" placeholder="종료 날짜" value="<%=port.getCompleteDate()%>" name="completeDate">
				</div>
			</div>
			<%Vector tmp =DAO.getFavorite(bbsID); %>
			<div class="row margin15">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 플랫폼</a>
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<select id="interest_1" name="favorite" class="form-control a_400"
							style="width: 50%">
							<option value="web" <%if(tmp.get(0).equals("web")){%>
												selected
												<%} %>
							>WEB</option>
							<option value="android"<%if(tmp.get(0).equals("android")){%>
												selected
												<%} %>>안드로이드</option>
							<option value="embeded"<%if(tmp.get(0).equals("embeded")){%>
												selected
												<%} %>>임베디드</option>
							<option value="ios"<%if(tmp.get(0).equals("ios")){%>
												selected
												<%} %>>IOS</option>
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
						<select id="interest_1" name="favorite" class="form-control a_400"
							style="width: 50%">
							<option value="health"<%if(tmp.get(1).equals("health")){%>
												selected
												<%} %>>건강</option>
							<option value="pychology"<%if(tmp.get(1).equals("pychology")){%>
												selected
												<%} %>>심리학</option>
							<option value="game"<%if(tmp.get(1).equals("game")){%>
												selected
												<%} %>>게임</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 팀원 수</a>
				</div>
				<div class="col-sm-8">
					<input type="number" style="width: 50%" placeholder="참여 인원"
										name="participantsNumber" value="<%=port.getParticipantsNumber()%>" min="1" max="10" id="usr">
								
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 링크</a>
				</div>
				<div class="col-sm-8">
					<input type="text" class="form-control" placeholder="프로젝트 링크"
										name="projectUrl" value="<%=port.getProjectUrl()%>" id="usr">
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 소개</a>
				</div>
				<div class="col-sm-8">
					<textarea class="a_400" id="field" name="bbsContent"
						 maxlength="3000" rows="10"
						cols="40" placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오."><%= port.getBbsContent() %></textarea>

					<div class="message"></div>
				</div>
			</div>
			<!-- <div class="row margin30">
				<div class="col-sm-4"><a class="a_500">해시태그</a></div>
				<div class="col-sm-8">.col-sm-8</div>
			</div> -->
		</form>
		<hr class="hr1" style="margin-top: 20px; margin-bottom: 80px;">
		<div style="text-align: center; margin-bottom: 80px;">
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
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
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
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
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
	<script type="text/javascript" src="../js/alertScript.js"></script>

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
	
        var upload = document.querySelector('#pictsrc');
        var preview = document.querySelector('#preview');
        upload.addEventListener('change', function(e) {
           var get_file = e.target.files;
           var image = document.createElement('img');
           /* FileReader 객체 생성 */
           var reader = new FileReader();
           /* reader 시작시 함수 구현 */
           reader.onload = (function(aImg) {
              console.log(1);

              return function(e) {
                 console.log(3);
                 /* base64 인코딩 된 스트링 데이터 */
                 aImg.src = e.target.result
              }
           })(preview)

           if (get_file) {
              /* 
                  get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                  onload 에 설정했던 return 으로 넘어간다.
                  이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
               */
              reader.readAsDataURL(get_file[0]);
              console.log(2);
           }else{
        	   
        	   reader.readAsDataURL("http://placehold.it/400x400");
           }
			
        })

	</script>
</body>
</html>