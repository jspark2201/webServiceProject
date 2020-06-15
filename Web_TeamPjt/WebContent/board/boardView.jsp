<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="../img/favicon/ecology.png">
<link rel="stylesheet" href="../css/detail/detail1.css">
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
		System.out.println("view" + boardNo);
		Board board = boardDao.selectBoardByKey(boardNo);//아이디어
		List<Board> mlist = boardDao.selectComments(boardNo);//댓글 리스트
		int cnt = mlist.size();//댓글 수
		String id = (String) session.getAttribute("userID");//사용자 세션

		if (id == null) {
			id = "admin";
		}

		int goodCount = boardDao.goodCount(boardNo);//좋아요 수
		int participantsState = boardDao.participantsState(boardNo);//아이디어의 상태(모집 중, 모집 완료)
		int participantsCount = boardDao.participantsCount(boardNo);//참여자 수

		List<Board> clist = boardDao.SelectParticipantsBoard(boardNo);//참여중 개발자
		List<Board> tlist = boardDao.SelectTempParticipantsBoard(boardNo);//신청한 참여자
		String[] platform = new String[4];
		int goodState = boardDao.goodState(boardNo, id);//사용자의 종아요 상태

		if (board.isWeb()) {//
			platform[0] = "WEB";
		} else {
			platform[0] = "";
		}
		if (board.isAndroid()) {
			platform[1] = "안드로이드";
		} else {
			platform[1] = "";
		}
		if (board.isIos()) {
			platform[2] = "임베디드";
		} else {
			platform[2] = "";
		}
		if (board.isIos()) {
			platform[3] = "IOS";
		} else {
			platform[3] = "";
		}
		String[] type = new String[3];
		if (board.isHealth()) {//
			type[0] = "건강";
		} else {
			type[0] = "";
		}

		if (board.isPsychology()) {
			type[1] = "심리학";
		} else {
			type[1] = "";
		}
		if (board.isGame()) {
			type[2] = "게임";
		} else {
			type[2] = "";
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
					<li class="nav-item active"><a class="nav-link a_400"
						href="<%=request.getContextPath()%>/board/boardList.jsp">아이디어
							보기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						href="<%=request.getContextPath()%>/board/boardAddForm.jsp">프로젝트
							시작하기 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link a_400"
						data-toggle="modal" data-target="#guideModal">이용가이드 </a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400"
						onclick="logoutAlert()">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400"
						href="<%=request.getContextPath()%>/view/myPage.jsp">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="height: 80px; background-color: #FFCE1E;"></div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1"><%=board.getTitle()%></h1>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container"
		style="padding: 100px; background-color: #ffffff; border: 1px solid #a6a6a6; margin-bottom: 50px;">
		<%
			if (id.equals(board.getWriter()) || id.equals("admin")) {//세션 추가
		%>
		<div class="row">
			<form
				action="<%=request.getContextPath()%>/board/boardDeadlineAction.jsp"
				method="post">
				<button type="submit" class="btn btn-primary" onclick="finAlert()"
					style="margin-left: 80%;" id="finBtn">
					<input name="boardNo" value="<%=request.getParameter("boardNo")%>"
						type="hidden" /> <a class="a_400">모집완료</a><img alt=""
						src="../img/detail/finish.png"
						style="margin-left: 5px; margin-bottom: 5px; height: 15px; width: 15px;">
				</button>
			</form>


			<form
				action="<%=request.getContextPath()%>/board/boardCompleteAction.jsp"
				method="post">
				<button type="submit" class="btn btn-primary" onclick="finAlert()"
					style="margin-left: 80%;" id="finBtn">
					<input name="boardNo" value="<%=request.getParameter("boardNo")%>"
						type="hidden" /> <a class="a_400">개발완료</a><img alt=""
						src="../img/detail/finish.png"
						style="margin-left: 5px; margin-bottom: 5px; height: 15px; width: 15px;">
				</button>
			</form>
		</div>


		<%
			}
		%>
		<hr class="hr1">
		<div class="row">
			<div class="col-sm-2"
				style="width: 100%; text-align: right; margin-left: 80%;">
				<a class="text-muted" style="font-size: 10px;">Number of likes</a><br>
				<a class="h4"><%=goodCount%></a>
				<form
					action="<%=request.getContextPath()%>/board/boardGoodAction.jsp"
					method="post">
					<input name="boardNo" value="<%=request.getParameter("boardNo")%>"
						type="hidden" />

					<button type="submit" class="btn btn-outline-danger" id="likeBtn"
						onclick="changeImage();">
						<%
							if (goodState == 1) {
						%>
						<img id="image" alt="" src="../img/heart.png" width="50"
							height="50" style="margin-bottom: 5px;">
						<%
							} else {
						%>
						<img id="image" alt="" src="../img/heart2.png" width="50"
							height="50" style="margin-bottom: 5px;">
						<%
							}
						%>
					</button>
				</form>

			</div>
			<div class="row a_400" style="font-size: 2rem; margin: 30px;">
				<%=board.getTitle()%>
			</div>

			<!-- Post Content Column -->
			<div>
				<!-- class="col-lg-8" -->

				<!-- Preview Image -->
				<img class="img-fluid rounded" src="<%=board.getSrc()%>" alt="">

				<hr class="hr1">

				<!-- Date/Time -->
				<p>
					Posted on
					<%=board.getRegistration_date()%>
					<%=board.getWriter()%></p>

				<hr class="hr1">
				<%=platform[0]%>
				<%=platform[1]%>
				<%=platform[2]%>
				<%=platform[3]%>
				<%=type[0]%>
				<%=type[1]%>
				<%=type[2]%>

				<div class="row a_400" style="font-size: 1.5rem; margin: 30px;">프로젝트
					소개</div>

				<!-- Post Content -->
				<p class="lead">
					<%=board.getContent()%></p>

				<blockquote class="blockquote">
					<p class="mb-0">요구사항</p>
					<footer class="blockquote-footer">
						<%=board.getRequirements()%>
					</footer>
				</blockquote>

				<%
					if (id.equals(board.getWriter()) || id.equals("admin")) {//세션 추가
				%>
				<button type="submit" class="btn btn-outline-dark"
					data-toggle="modal" data-target="#memberModal">
					<a class="a_400">명단 관리</a>
				</button>
				<%
					}
				%>
				<hr class="hr1">


				<form
					action="<%=request.getContextPath()%>/board/boardContactAction.jsp"
					method="post">
					<input name="boardNo" value="<%=request.getParameter("boardNo")%>"
						type="hidden" />
					<button type="submit" class="btn btn-primary">컨택 하기</button>
				</form>
				<hr class="hr1">

				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>
					<div class="card-body">
						<form
							action="<%=request.getContextPath()%>/board/boardCommentAction.jsp"
							method="post">
							<div class="form-group">
								<input name="boardNo"
									value="<%=request.getParameter("boardNo")%>" type="hidden" />
								<textarea class="form-control" name="comment" id="comment"
									rows="3"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>

				<!-- Single Comment -->
				<div class="media mb-4">
					<%
						for (Board comment : mlist) {
					%>

					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0"><%=comment.getWriter()%>
							<%=comment.getRegistration_date()%></h5>
						<%=comment.getContent2()%>
					</div>
					<%
						if (id.equals("admin") || id.equals(board.getWriter()) || id.equals(comment.getWriter())) {//세션 추가
					%>
					<form
						action="<%=request.getContextPath()%>/board/boardCommentDeleteAction.jsp"
						method="post">
						<div class="form-group">
							<input name="commentNo" value="<%=comment.getId()%>"
								type="hidden" /> <input name="boardNo"
								value="<%=request.getParameter("boardNo")%>" type="hidden" />
						</div>
						<button type="submit" class="btn btn-primary" value="댓글삭제">댓글
							삭제</button>
					</form>
					<%
						}
					%>
				</div>
				<%
					}
				%>

			</div>
		</div>
	</div>
	<!-- /.row -->

	<%
		if (id.equals("admin") || id.equals(board.getWriter())) {//세션 추가
	%>
	<div class="row">
		<form action="<%=request.getContextPath()%>/board/boardModifyForm.jsp"
			method="post">
			<input name="boardNo" value="<%=request.getParameter("boardNo")%>"
				type="hidden" />
			<button class="btn btn-outline-warning" onclick="" type="submit">글
				수정</button>
		</form>

		<form
			action="<%=request.getContextPath()%>/board/boardRemoveAction.jsp"
			method="post">
			<input name="boardNo" value="<%=request.getParameter("boardNo")%>"
				type="hidden" />
			<button onclick="deleteAlert()" type="submit"
				class="btn btn-outline-danger">글 삭제</button>
		</form>

	</div>
	<%
		}
	%>

	<%
		}
	%>
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

	<!-- 참여자 명단 MODAL -->
	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		BoardDao boardDao = new BoardDao();
		System.out.println("view" + boardNo);
		Board board = boardDao.selectBoardByKey(boardNo);//아이디어
		List<Board> mlist = boardDao.selectComments(boardNo);//댓글 리스트
		int goodCount = boardDao.goodCount(boardNo);//좋아요 수
		int participantsCount = boardDao.participantsCount(boardNo);//참여자 수
		int cnt = mlist.size();
		List<Board> clist = boardDao.SelectParticipantsBoard(boardNo);//완료된 참여자
		List<Board> tlist = boardDao.SelectTempParticipantsBoard(boardNo);//신청한 참여자
	%>

	<div class="modal fade" id="memberModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<a class="a_400">명단관리</a>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<a class="a_400">개발자 : </a>
						</div>
						<div class="row">
							<a class="a_400">참여 개발자 : </a>
						</div>
						<hr>
						<a class="a_400" style="font-size: 1rem;">신청한 개발자</a>
						<%
							for (Board participant : tlist) {
						%>
						<div class="row" style="text-align: center;">
							<div class="row" style="text-align: center;">
								<div class="col-sm-3">
									<a class="a_400"><%=participant.getNickname()%></a>
								</div>
								<div class="col-sm-3" style="width: 600px;">
									<a class="a_400"><%=participant.getRegistration_date()%></a>
								</div>
								<div class="col-sm-3">
									<form
										action="<%=request.getContextPath()%>/board/AcceptAction.jsp"
										method="post">
										<button type="submit">
											<input name="participantsId"
												value="<%=participant.getId2()%>" type="hidden" /> <input
												name="boardNo" value="<%=request.getParameter("boardNo")%>"
												type="hidden" /> <img src="../img/detail/check.png"
												alt="추가하기" onclick="alert('이전');" />
										</button>
									</form>
								</div>
								<div class="col-sm-3">
									<form
										action="<%=request.getContextPath()%>/board/RejectAction.jsp"
										method="post">
										<button type="submit">
											<input name="participantsId"
												value="<%=participant.getId2()%>" type="hidden" /> <input
												name="boardNo" value="<%=request.getParameter("boardNo")%>"
												type="hidden" /> <img src="../img/detail/cross.png"
												alt="삭제하기" onclick="alert('이전');" />
										</button>
									</form>
								</div>
							</div>
						</div>
						<%
							}
						%>


						<hr>
						<a class="a_400" style="font-size: 1rem;">참여중 개발자</a>

						<%
							for (Board participant : clist) {
						%>
						<div class="row" style="text-align: center;">
							<div class="row" style="text-align: center;">
								<div class="col-sm-3">
									<a class="a_400"><%=participant.getNickname()%></a>
								</div>
								<div class="col-sm-3" style="width: 600px;">
									<a class="a_400"><%=participant.getRegistration_date()%></a>
								</div>
								<div class="col-sm-3">

									<form
										action="<%=request.getContextPath()%>/board/RejectAction.jsp"
										method="post">
										<button type="submit">
											<input name="participantsId"
												value="<%=participant.getId2()%>" type="hidden" /> <input
												name="boardNo" value="<%=request.getParameter("boardNo")%>"
												type="hidden" /> <img src="../img/detail/cross.png"
												alt="삭제하기" onclick="alert('이전');" />
										</button>
									</form>
								</div>
							</div>
						</div>
						<%
							}
						%>
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
	<%
		}
	%>
	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="../js/alertScript.js"></script>
	<script type="text/javascript" src="../js/detail/detail.js"></script>

</body>
<script>
	$(document).ready(function() {
		$("#likeBtn").click(function() {
			$('.toast').toast('show');
		});
	});

	function changeImage() {
		var img = document.getElementById("image");
		img.src = "../img/heart.png";
		return false;
	}
</script>
</body>
</html>