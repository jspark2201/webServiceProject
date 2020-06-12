<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title>jsp 게시판 웹사이트</title>

</head>

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

			<a class="navbar-brand" href="main.jsp">JSP 게시판</a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">메인</a></li>

				<li class="active"><a href="bbs.jsp">게시판</a></li>

			</ul>







			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"


 
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul></li>



	</nav>

	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form method="post" action="portfolio_write_action.jsp">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"

								style="background-color: #eeeeee; text-align: center;">게시판

								글쓰기 양식</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control" placeholder="글 제목" name="bbs_title" maxlength="50"/></td>

						</tr>
						<tr>

							<td><input type="number" class="form-control" placeholder="참여 인원" name="participantsNumber" maxlength="50"/></td>

						</tr>
						<tr>

							<td><input type="date" class="form-control" placeholder="시작 날짜" name="registrationDate" maxlength="50"/></td>
							<td><input type="date" class="form-control" placeholder="종료 날짜" name="completeDate" maxlength="50"/></td>

						</tr>
						<tr><label for = "favorite">플랫폼 : </label>
						        <input type = "checkbox" name = "favorite" value = "web">web
        <input type = "checkbox" name = "favorite" value = "android">android
        <input type = "checkbox" name = "favorite" value = "embeded">embeded
      <input type = "checkbox" name = "favorite" value = "ios">ios
						</tr>
						    <label for = "favorite">장르 : </label>
        <input type = "checkbox" name = "favorite" value = "health">health
        <input type = "checkbox" name = "favorite" value = "psychology">psychology
        <input type = "checkbox" name = "favorite" value = "game">game
						
						<tr>
						
						</tr>
						<tr>

							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
						<tr>

							<td><input type="text" class="form-control" placeholder="프로젝트 링크" name="projectUrl" maxlength="50"/></td>

						</tr>
						<tr>
						<td><input type="file" name="pictsrc"/></td>
						</tr>
					</tbody>

				</table>	

				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

			</form>

		</div>

	</div>









	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>



</body>

</html>