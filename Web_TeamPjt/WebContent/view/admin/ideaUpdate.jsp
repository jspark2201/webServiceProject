<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Web_TeamPjt.Idea"%>
<%@ page import="Web_TeamPjt.IdeaDAO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
	
		IdeaDAO ideaDAO = new IdeaDAO();
		Idea idea = new Idea();
			
		idea = ideaDAO.getDB(id);
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
				<form method="post" action="ideaUpdateAction.jsp">
					<h3 style="text-align: center;">글 정보 수정</h3>
					<input type="hidden" name="ideaId", value="<%=idea.getId()%>">
					<div class="form-group">
						<span>작성자</span>
						<input type="text" class="form-control" placeholder="작성자"
							name="ideaWriter" maxlength="20" value="<%=idea.getWriter()%>" readonly>
					</div>
					<div class="form-group">
						<span>제목</span>
						<input type="text" class="form-control" placeholder="제목"
							name="ideaTitle" maxlength="20" value="<%=idea.getTitle()%>">
					</div>
					<div class="form-group">
						<span>내용</span>
						<input type="text" class="form-control" placeholder="내용"
							name="ideaContent" maxlength="20" value="<%=idea.getContent()%>">
					</div>
					<div class="form-group">
						<span>요구사항</span>
						<input type="text" class="form-control" placeholder="요구사항"
							name="ideaRequirements" maxlength="20" value="<%=idea.getRequirements()%>">
					</div>
					<div class="form-group">
						<span>팀원 수</span>
						<input type="text" class="form-control" placeholder="팀원 수"
							name="ideaNumber_participants" maxlength="20" value="<%=idea.getNumber_participants()%>">
					</div>
					<div class="form-group">
						<span>참고 링크</span>
						<input type="text" class="form-control" placeholder="참고 링크"
							name="ideaUrl" maxlength="20" value="<%=idea.getUrl()%>">
					</div>
					<div class="form-group">
						<span>상태</span>
						<input type="text" class="form-control" placeholder="상태"
							name="ideaState" maxlength="20" value="<%=idea.getState()%>">
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
