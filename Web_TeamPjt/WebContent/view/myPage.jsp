<%@page import="mypage.PortfolioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mypage.PortfolioDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">
<link rel="stylesheet" href="/Web_TeamPjt/css/myPage/myPage.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/bootstrap.min.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/googleFont.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/card.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

</head>
<body>
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

	String userID = "admin3";
	/*
		if (session.getAttribute("userid") != null) {

			userID = (String) session.getAttribute("userid");

		}*/
	System.out.println("myPage--------------");
	int pageNumber = 1; //기본 페이지 넘버

	//페이지넘버값이 있을때

	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#" style="color:#FFCE1E;" class="a_500">WEB SERVICE PJ</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">랭킹 보기
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">아이디어 보기
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" href="#">프로젝트 시작하기
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link a_400" data-toggle="modal" data-target="#guideModal">이용가이드
						</a>
					</li>
					<!-- <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li> -->
					<li class="nav-item"><a class="nav-link a_400" onclick="logoutAlert()">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div style="height:80px; background-color:#FFCE1E; margin-bottom:30px;	">
	</div>


	
	<!-- Page Content -->
  <div class="container" style="min-height:1000px; padding:80px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">

  
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active a_500" style="color:#FFCE1E;" data-toggle="tab" href="#home">쪽지</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu1">개인정보</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu2">아이디어</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu3">포트폴리오</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="home" class="container tab-pane active" ><br>
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
				<p class="p_400" style="color:#cccccc;">쪽지 내용을 클릭하시면 상세 보기가 가능합니다.</p>
				<ul class="pagination justify-content-center">
			  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
	    </div>
	    <div id="menu1" class="container tab-pane fade"><br>
	      <p class="p_400" style="color:#cccccc;">개인정보 조회 및 수정은 인증이 필요합니다.</p>
	      <button type="button" class="btn btn-outline-dark" style="margin-right:20px;">개인정보 조회</button>
	      <button type="button" class="btn btn-outline-dark">개인정보 수정</button>
	    </div>
	    <hr>
	    
	    <div id="menu2" class="container tab-pane fade"><br>
	    	<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px;">
				<div class="card h-100">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project One</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur eum quasi sapiente
							nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
							dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
						<div>
							<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400">삭제하기</a>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Two</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Three</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quos quisquam, error quod sed cumque, odio
							distinctio velit nostrum temporibus necessitatibus et facere
							atque iure perspiciatis mollitia recusandae vero vel quam!</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Four</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Five</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100">
					
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_1.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Six</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Itaque earum nostrum suscipit ducimus nihil
							provident, perferendis rem illo, voluptate atque, sit eius in
							voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400" style="margin-bottom:5px;">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
		</div>
	    	
	    	
	    	
		    <div id="home" class="container tab-pane active" ><br>
			    <ul class="pagination justify-content-center">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">1</a></li>
				  <li class="page-item"><a class="page-link" href="#">2</a></li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
		    </div>
	    </div>
	    
	    <!-- 포트폴리오 포트폴리오 포트폴리오 포트폴리오 포트폴리오 포트폴리오 포트폴리오  -->
	    <div id="menu3" class="container tab-pane fade">
	    	<p class="p_400" style="color:#cccccc;">외부 홈페이지의 포트폴리오 업로드가 가능합니다.</p>
	      	<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#portfolioModal">
	      		<a class="a_400">추가하기</a>
	      	</button>
	      	<button type="button" class="btn btn-outline-info a_400" data-toggle="modal" data-target="#infoModal">도움말</button>
		    <hr>
		    
		    <div class="row">
		    <%
					PortfolioDAO bbsDAO = PortfolioDAO.getInstance();
					System.out.println(userID);
					ArrayList<PortfolioDTO> list = bbsDAO.getList(userID, pageNumber);

					for (int i = 0; i < list.size(); i++) {
						//System.out.println(list.get(i).getBbs_id());
						String imgSRC;
						if (bbsDAO.getPic(list.get(i).getBbs_id()) == null)
							imgSRC = "http://placehold.it/700x400";
						else
							imgSRC =bbsDAO.getPic(list.get(i).getBbs_id());
						System.out.println(imgSRC);
			%>
					<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom: 30px;">
						<div class="card h-100" style="border-color:
							<%int Ptype = bbsDAO.getPtype(list.get(i).getBbs_id(),userID);
							String state = null;
							if(list.get(i).getState()==1 &&Ptype ==0) {
							state ="모집 중";%>
							#ADFF2F
							<%}else if(list.get(i).getState()==2 &&Ptype ==0) {
							state ="진행 중";%>
							#008000 
							<%}else if(list.get(i).getState()==3 &&Ptype ==0) {
							state ="완료";%>
							#006400 
							<%}else if(list.get(i).getState()==1 &&Ptype ==1) {
								state ="모집 중(신청)";%>
							#FFA07A 
							<%}else if(list.get(i).getState()==1 &&Ptype ==2) {
							state ="모집 중(참가)";%>
							#FF7F50 
							<%}else if(list.get(i).getState()==2 &&Ptype ==2) {
							state ="진행 중";%>
							#FFA500 
							<%}else if(list.get(i).getState()==3 &&Ptype ==2) {
							state ="완료";%>
							#FF8C00 
							<%}else if(list.get(i).getState()==4) {
							state ="개발중단";%>
							#A9A9A9 
							<%}else if(list.get(i).getState()==5) {
							state ="외부 프로젝트";%>
							#0000FF
							<%} %>"; border-width: 5px;">

							<div class="card_img">
							
							<!-- 포트폴리오 이미지 입력  포트폴리오 이미지 입력 포트폴리오 이미지 입력 포트폴리오 이미지 입력-->
							<% String link;
							if(list.get(i).getState()==5){ 
								  link =  "portfolioView.jsp?bbsID="+ list.get(i).getBbs_id();
								 }
								 else{
									 link = "../board/boardView.jsp?boardNo="+list.get(i).getBbs_id();
								 }%>
								<a href="<%=link%>"> <img
									style="width: 100%; height: 100%;" alt="" src="<%=imgSRC%>">
								</a>
							</div>
							<div class="card-body">
								<h4 class="card-title">
									<a href="<%=link%>" class="a_400"
										style="color: #FFCE1E"> <%=list.get(i).getBbs_title()%>
									</a>
								</h4>
								<p class="card-text">
									<%
										if (list.get(i).getBbsContent().length() > 30) {
									%>
									
									<%//=list.get(i).getBbsContent().substring(0, 31)%>
									<%
										} else {
									%>
									<%=list.get(i).getBbsContent()%>
									<%
										}
									%>
									<br> 진행 기간 :
									<%=list.get(i).getRegistrationDate()%>
									~
									<%=list.get(i).getCompleteDate()%>
								</p>

								<div>
									<form action="portfolio_delete_action.jsp" method="post">
										<input name="bbsID" value="<%=list.get(i).getBbs_id()%>"
											type="hidden" />
											<a class="a_400"><%=state %></a>
										<button type="submit" method="post"
											class="btn btn-outline-danger btn-sm"
											style="position: absolute; right: 3%; bottom: 3%;" onclick="">
											<a class="a_400">삭제하기</a>
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
		    
			<!-- <div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px;">
				<div class="card h-100" style="border-color:red; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project One</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur eum quasi sapiente
							nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
							dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
							<a class="a_400">상태값!</a>
							<div><button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400">삭제하기</a>
						</button></div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:green; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Two</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:blue; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Three</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quos quisquam, error quod sed cumque, odio
							distinctio velit nostrum temporibus necessitatibus et facere
							atque iure perspiciatis mollitia recusandae vero vel quam!</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:#5e3b4b; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Four</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;"onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:#e600e6; border-width:5px;">
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_2.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Five</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400">삭제하기</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100" style="border-color:#e2d0d8; border-width:5px;">
					
					<div class="card_img">
						<img style="width:100%; height:100%;" alt="" src="/Web_TeamPjt/img/main/main_1.jpg">
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" class="a_400" style="color:#FFCE1E">Project Six</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Itaque earum nostrum suscipit ducimus nihil
							provident, perferendis rem illo, voluptate atque, sit eius in
							voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
						<button type="button" class="btn btn-outline-danger btn-sm" style="position: absolute; left: 60%; top: 90%;" onclick="">
							<a class="a_400" style="margin-bottom:5px;">삭제하기</a>
						</button>
					</div>
				</div> -->
			</div>
		</div>
		    
		    <hr>
		    <div id="home" class="container tab-pane active" ><br>
			    <ul class="pagination justify-content-center">
					<%
						if (pageNumber != 1) {
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber - 1%>"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">이전</span>
					</a></li>

					<%
						}
					int totalPageNum = bbsDAO.totalPage(userID);
					if (pageNumber - 2 > 0) {
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber - 2%>"> <%=pageNumber - 2%>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber - 1%>"> <%=pageNumber - 1%>
					</a></li>
					<%
						} else if (pageNumber - 1 > 0) {
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber - 1%>"> <%=pageNumber - 1%>
					</a></li>
					<%
						}
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber%>"> <%=pageNumber%>
					</a></li>
					<%
						if (pageNumber + 2 <= totalPageNum) {
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber + 1%>"> <%=pageNumber + 1%>
					</a></li>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber + 2%>"> <%=pageNumber + 2%>
					</a></li>


					<%
						} else if (pageNumber + 1 <= totalPageNum) {
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber + 1%>"> <%=pageNumber + 1%>
					</a></li>

					<%
						}

					if (bbsDAO.nextPage(userID, pageNumber)) {
					%>
					<li class="page-item"><a class="page-link"
						href="myPage.jsp?pageNumber=<%=pageNumber + 1%>"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">다음</span>
					</a></li>

					<%
						}
					%>
				</ul>
			    <!-- <ul class="pagination justify-content-center">
				  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				  <li class="page-item"><a class="page-link" href="#">1</a></li>
				  <li class="page-item"><a class="page-link" href="#">2</a></li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul> -->
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
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  <!-- 도움말 ( 색깔 설명 ) MODAL -->
	<div class="modal fade" id="infoModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="text-align:center;">
	
				<!-- Modal body -->
				<hr>
				<p class="p_400" style="background-color:#ADFF2F;">모집중</p>
				<p class="p_400" style="background-color:#008000;">진행중/모집 완료</p>
				<p class="p_400" style="background-color:#006400;">개발 완료</p>
				<p class="p_400" style="background-color:#FFA07A;">모집중/신청</p>
				<p class="p_400" style="background-color:#FF7F50;">모집중/참가</p>
				<p class="p_400" style="background-color:#FFA500;">진행중/모집완료</p>
				<p class="p_400" style="background-color:#FF8C00;">개발완료</p>
				<p class="p_400" style="background-color:#0000FF;">외부프로젝트</p>
				<p class="p_400" style="background-color:#A9A9A9;">중단된 아이디어</p>

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
          <h4 class="modal-title">쪽지 제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <p class="a_500">작성자 : </p>
        <hr>
          	<p class="a_400">쪽지 내용..</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#response_mailModal"><a class="a_400">답장하기</a></button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">닫기</a></button>
        </div>
        
      </div>
    </div>
  </div>
  
  <!-- 쪽지 작성 MODAL -->
    <div class="modal fade" id="response_mailModal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쪽지 제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <hr>
          	<textarea class="a_400" "id="field" placeholder="보내실 내용을 입력하여 주세요.(200자)" maxlength="200" rows="10" cols="40"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">보내기</a></button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">닫기</a></button>
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

						<form method="post" action="/Web_TeamPjt/view/portfolio_write_action.jsp"
							name="writeport" enctype="multipart/form-data">
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 제목</a>
								</div>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="usr"
										placeholder="글 제목" name="bbs_title" style="width: 50%">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">이미지 첨부</a> <label
										class="btn-bs-file btn btn-lg btn-warning"> Browse <input
										type="file" name="pictsrc" id="pictsrc" />
								</div>
								<div class="col-sm-8">
									<img class="img-fluid rounded mb-4 mb-lg-0" id='preview' style="height:100%; width:400px;"
					src="http://placehold.it/400x400" alt="">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 진행 기간</a>
								</div>
								<div class="col-sm-8">
									<input type="date" class="form-control" placeholder="시작 날짜"
										name="registrationDate"><a> ~ </a><input type="date"
										class="form-control" placeholder="종료 날짜" name="completeDate">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 플랫폼</a>
								</div>
								<div class="col-sm-8">
									<div class="form-group ">
										<select id="interest_1" name="favorite"
											class="form-control a_400" style="width: 50%">
											<option value="web">WEB</option>
											<option value="android">안드로이드</option>
											<option value="embeded">임베디드</option>
											<option value="ios">IOS</option>
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
										<select id="interest_1" name="favorite"
											class="form-control a_400" style="width: 50%">
											<option value="health">건강</option>
											<option value="pychology">심리학</option>
											<option value="game">게임</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 참여자 수</a>
								</div>
								<div class="col-sm-8">
									<input type="number" style="width: 50%" placeholder="참여 인원"
										name="participantsNumber" min="1" max="10">
								</div>
							</div>
							<!--  -->
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 링크</a>
								</div>
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="프로젝트 링크"
										name="projectUrl" id="usr">
								</div>
							</div>
							<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
								<div class="col-sm-4">
									<a class="a_500">프로젝트 소개</a>
								</div>
								<div class="col-sm-8">
									<textarea class="form-control" class="a_400" "id="field"
										placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오."
										name="bbsContent" maxlength="3000" rows="10" cols="40"></textarea>

									<div class="message"></div>
								</div>
							</div>
							<!-- <div class="row margin30">
				<div class="col-sm-4"><a class="a_500">해시태그</a></div>
				<div class="col-sm-8">.col-sm-8</div>
			</div> -->
							<hr class="hr1" style="margin-top: 20px; margin-bottom: 30px;">
							<div style="text-align: center; margin-bottom: 30px;">
								<button type="submit" class="btn btn-warning a_400"
									onclick="document.location.reload()">게시하기</button>
							</div>
						</form>

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
<!-- 	<div class="modal fade" id="portfolioModal">
    <div class="modal-dialog modal-dialog-scrollable" style="max-width:1024px;">
      <div class="modal-content">
      
        Modal Header
        <div class="modal-header">
          <h4 class="modal-title a_400">포트폴리오 추가</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        Modal body
        <div class="modal-body">
          CONTAINER
	<div class="container" style="background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
		<hr class="hr1" style="margin-top:50px;">
		
		<form>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4"><a class="a_500">프로젝트 제목</a></div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr" style="width:50%">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">이미지 첨부</a> 
					<label class="btn-bs-file btn btn-lg btn-warning"> 
						Browse 
					<input type="file" />
				</div>
				<div class="col-sm-8">
					<img class="img-fluid rounded mb-4 mb-lg-0"
					src="http://placehold.it/400x400" alt="">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 진행 기간</a> 
				</div>
				<div class="col-sm-8">
					<input type="date"><a> ~ </a><input type="date">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 플랫폼</a> 
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<select id="interest_1" class="form-control a_400" style="width:50%">
							<option>WEB</option>
							<option>안드로이드</option>
							<option>임베디드</option>
							<option>IOS</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">흥미 분야</a> 
				</div>
				<div class="col-sm-8">
					<div class="form-group ">
						<select id="interest_1" class="form-control a_400" style="width:50%">
							<option>건강</option>
							<option>심리학</option>
							<option>게임</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4">
					<a class="a_500">프로젝트 참여자 수</a> 
				</div>
				<div class="col-sm-8">
					<input type="number" style="width:50%" min="1" max="10">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4"><a class="a_500">프로젝트 간략 소개</a></div>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="usr">
				</div>
			</div>
			<div class="row" style="margin-top:30px;margin-bottom:30px;">
				<div class="col-sm-4"><a class="a_500">프로젝트 소개</a></div>
				<div class="col-sm-8">
					 <textarea class="a_400" "id="field" placeholder="소개하시려는 아이디어 프로젝트를 쉽게 풀어서 작성하여 주십시오." maxlength="3000" rows="10" cols="40"></textarea>
    
    <div class="message"></div>
				</div>
			</div>
			<div class="row margin30">
				<div class="col-sm-4"><a class="a_500">해시태그</a></div>
				<div class="col-sm-8">.col-sm-8</div>
			</div>
		</form>
		<hr class="hr1" style="margin-top:20px;margin-bottom:30px;">
		<div style="text-align:center; margin-bottom:30px;">
			<button type="button" class="btn btn-warning a_400" onclick="uploadAlert()">게시하기</button>
		</div>
	</div>
        </div>
        
        Modal footer
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> -->
	
	
	<!-- Bootstrap core JavaScript -->
	<script src="/Web_TeamPjt/vendor/jquery/jquery.min.js"></script>
	<script src="/Web_TeamPjt/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="/Web_TeamPjt/js/alertScript.js" ></script>
	<script src="/Web_TeamPjt/js/myPage/myPage.js"></script>

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




