
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="mypage.PortfolioBean"%>

<%@ page import="mypage.DBEventDAO"%>

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

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

	

		}

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");

		}

		PortfolioBean port = new DBEventDAO().getPortfolio(bbsID);

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

			<a class="navbar-brand" href="portfolio.jsp">JSP 게시판</a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">메인</a></li>

				<li class="active"><a href="portfolio.jsp">게시판</a></li>

			</ul>





			<%

				//라긴안된경우

				if (userID == null) {

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"


 
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="login.jsp">로그인</a></li>

						<li><a href="join.jsp">회원가입</a></li>

					</ul></li>

			</ul>

			<%

				} else {

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"


 
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul></li>

			</ul>

			<%

				}

			%>

		</div>

	</nav>

	<!-- 게시판 -->

	<div class="container">

		<div class="row">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="3"

								style="background-color: #eeeeee; text-align: center;">글 보기 </th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td style="width: 20%;"> 글 제목 </td>

							<td colspan="2"><%= port.getBbs_title() %></td>

						</tr>

						<tr>

							<td>작성자</td>	

							<td colspan="2"><%= port.getUserID() %></td>

						</tr>

						<tr>

							<td>프로젝트 시작 일</td>	

							<td colspan="2"><%= port.getRegistrationDate()%></td>

						</tr>
						<tr>

							<td>프로젝트 종료 일</td>	

							<td colspan="2"><%= port.getCompleteDate()%></td>

						</tr>
						<tr>

							<td>내용</td>	

							<td colspan="2" style="min-height: 200px; text-align: left;"><%= port.getBbsContent() %></td>

						</tr>

						

					</tbody>

				</table>	

				<a href = "portfolio.jsp" class="btn btn-primary">목록</a>

				

				

				<%

				//글작성자 본인일시 수정 삭제 가능 

					if(userID != null && userID.equals(port.getUserID())){

				%>

						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>

						<a href="delete.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>

				<%					

					}

				%>

		</div>

	</div>









	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>



</body>

</html>
