<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="User.User"%>
<%@ page import="Idea.Idea"%>
<%@ page import="Idea.IdeaDAO"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">
<link rel="stylesheet" href="/Web_TeamPjt/css/main/main.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/bootstrap.min.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/googleFont.css">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/Web_TeamPjt/css/main/landing-page.min.css" rel="stylesheet">
  <link href="/Web_TeamPjt/css/main/simple-line-icons.css" rel="stylesheet">

</head>
<body>

	<%
		User user = null;
	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
	}
		System.out.println(user.getId()+"!!!");
	%>
   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="/Web_TeamPjt/service" style="color: #FFCE1E;"
            class="a_500">WEB SERVICE PJ</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active"><a class="nav-link a_400" href="/Web_TeamPjt/board/boardList.jsp">아이디어
                     보기 <span class="sr-only">(current)</span>
               </a></li>
               <li class="nav-item active"><a class="nav-link a_400" href="/Web_TeamPjt/board/boardAddForm.jsp">프로젝트
                     시작하기 <span class="sr-only">(current)</span>
               </a></li>
               <li class="nav-item active"><a class="nav-link a_400"
                  data-toggle="modal" data-target="#guideModal">이용가이드 </a></li>
               <li class="nav-item"><a class="nav-link a_400"
                  onclick="logoutAlert()">로그아웃</a></li>
               <li class="nav-item"><a class="nav-link a_400" href="/Web_TeamPjt/mypage?id=<%=user.getId()%>">마이페이지</a></li>
            </ul>
         </div>
      </div>
   </nav>

   <div style="height: 100px; background-color: #FFCE1E;"></div>
   <div style="height: 5px; background-color: #b0aea9;"></div>

   <!-- Carousel -->
   <div class="bs-example">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
         <!-- Carousel indicators -->
         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
         </ol>
         <!-- Wrapper for carousel items -->
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="/Web_TeamPjt/img/main/main_1.jpg" alt="First Slide"
                  style="height: 500px; width: 100%;">
               <div class="carousel-caption">
                  <p class="a_500"
                     style="font-size: 2rem; color: #ffffff; float: left;">아이디어내고
                     해외여행가자!</p>
               </div>
            </div>
            <div class="carousel-item">
               <img src="/Web_TeamPjt/img/main/main_2.jpg" alt="Second Slide"
                  style="height: 500px; width: 100%;">
            </div>
            <div class="carousel-item">
               <img src="/Web_TeamPjt/img/main/main_3.jpg" alt="Third Slide"
                  style="height: 500px; width: 100%;">
               <div class="carousel-caption">
                  <p class="a_500"
                     style="font-size: 4rem; color: #5353c6; float: right;">아이디어
                     전시회</p>
                  <p class="a_500"
                     style="font-size: 2rem; color: #6666cc; float: right;">06.20~6.24
                     지상최대 아이디어 전시회</p>
               </div>
            </div>
         </div>
         <!-- Carousel controls -->
         <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
         </a> <a class="carousel-control-next" href="#myCarousel"
            data-slide="next"> <span class="carousel-control-next-icon"></span>
         </a>
      </div>
   </div>

   <div style="height: 5px; background-color: #b0aea9;"></div>

   <%
      IdeaDAO ideaDAO = new IdeaDAO();
      ArrayList<Idea> ideas = null;      
   %>
   <!-- Page Content -->
   <div class="rank_div">
               <p class="rank_a a_500" style="font-family: 'Black Han Sans', sans-serif;">RANK</p>
            </div>
     
             <%
				Integer id[] = new Integer[3];
				String imageSrc[] = new String[3];
				String title[] = new String[3];
				int goodCnt[] = new int[3];
				
				ideas = ideaDAO.getDBTopList();
				
				for (int i=0; i<3; i++) {
					if (i < ideas.size()) {
						id[i] = ideas.get(i).getId();
						imageSrc[i] = ideas.get(i).getImageSrc();
						
						System.out.println(imageSrc[i]);
						
						title[i] = ideas.get(i).getTitle();
						goodCnt[i] = ideas.get(i).getGoodCount();
					}
					else {
						id[i] = 0;
						imageSrc[i] = "/Web_TeamPjt/img/main/main_1.jpg";
						title[i] = "title";
						goodCnt[i] = 0;
					}
				}	
				
				
			%>
   <!-- Image Showcases -->
  <section class="showcase" style="margin: 20px 50px;">
    <div class="container-fluid p-0">
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('/Web_TeamPjt/img/main/smart.jfif');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h1 style="font-family: 'Black Han Sans', sans-serif; font-size:4rem;">1</h1>
          <a style="font-family: 'Black Han Sans', sans-serif; font-size:4rem;" class="a_400" href="#">체중 관리 어플리케이션</a>
          <h2 class="lead mb-0 a_400" style="font-family: 'Black Han Sans', sans-serif; font-size:3rem;">482개의 좋아요를 받았습니다.</h2>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" style="background-image: url('/Web_TeamPjt/img/main/gps.jfif');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h1 style="font-family: 'Black Han Sans', sans-serif; font-size:4rem;">2</h1>
          <a style="font-family: 'Black Han Sans', sans-serif; font-size:4rem;" class="a_400" href="#">사커 GPS 연동 어플리케이션</a>
          <h2 class="lead mb-0" style="font-family: 'Black Han Sans', sans-serif; font-size:3rem;">420개의 좋아요를 받았습니다.</h2>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('/Web_TeamPjt/img/main/paranormal.gif');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h1 style="font-family: 'Black Han Sans', sans-serif; font-size:4rem;">3</h1>
          <a style="font-family: 'Black Han Sans', sans-serif; font-size:4rem;" class="a_400" href="#">파라노말[보드게임]</a>
          <h2 class="lead mb-0" style="font-family: 'Black Han Sans', sans-serif; font-size:3rem;">351개의 좋아요를 받았습니다.</h2>
        </div>
      </div>
    </div>
  </section>
   
   

   
   <!-- Testimonials -->
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5" style="font-family: 'Black Han Sans', sans-serif; font-size:3rem;">NEW</h2>
      <div class="row">
      
        <%--  <%
         String content[] = new String[3];
         
      	ideas = ideaDAO.getDBList();
      	for (int i=0;i<3; i++) {
			if (i < ideas.size()) {
				id[i] = ideas.get(i).getId();
				imageSrc[i] = ideas.get(i).getImageSrc();
				title[i] = ideas.get(i).getTitle();
				content[i] = ideas.get(i).getContent();
			}
			else {
				id[i] = 0;
				imageSrc[i] = "/Web_TeamPjt/img/main/main_1.jpg";
				title[i] = "title";
				content[i] = "None";
			}
      %> --%>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" style="height:200px; width:200px;" src="/Web_TeamPjt/img/main/printer.jfif" alt="">
            <p  style="font-family: 'Black Han Sans', sans-serif; font-size:2rem;" class="font-weight-light mb-0">핸드 프린터 어플</p>
          </div>
        </div>
       <%--    <%
	      	}

        %> --%>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" style="height:200px; width:200px;" src="/Web_TeamPjt/img/main/ad.jfif" alt="">
            <p  style="font-family: 'Black Han Sans', sans-serif; font-size:2rem;" class="font-weight-light mb-0">광고 차단 프로젝트</p>
          </div>
        </div>
  		<div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" style="height:200px; width:200px;" src="/Web_TeamPjt/img/main/record.jfif" alt="">
            <p  style="font-family: 'Black Han Sans', sans-serif; font-size:2rem;" class="font-weight-light mb-0">활동 기록 어플</p>
          </div>
        </div>
    </div>
  </section>
  
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

   <!-- Bootstrap core JavaScript -->
   <script src="/Web_TeamPjt/vendor/jquery/jquery.min.js"></script>
   <script src="/Web_TeamPjt/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
   <script type="text/javascript" src="/Web_TeamPjt/js/alertScript.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>
</html>


