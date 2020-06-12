<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="../img/favicon/ecology.png">
<link rel="stylesheet" href="../css/all/all.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/googleFont.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
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
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div style="height:100px; background-color:#FFCE1E;">
	</div>
	<div style="height:5px; background-color:#b0aea9;">
	</div>
	
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
                <img src="../img/main/main_1.jpg" alt="First Slide" style="height:500px; width:100%;">
            	<div class="carousel-caption">
			        <p class="a_500" style="font-size:4rem; color:#ffffff; float:left;">아이디어 랭킹전</p>
			        <p class="a_500" style="font-size:2rem; color:#ffffff; float:left;">아이디어내고 해외여행가자!</p>
			    </div>   
            </div>
            <div class="carousel-item">
                <img src="../img/main/main_2.jpg" alt="Second Slide" style="height:500px; width:100%;">
            </div>
            <div class="carousel-item">
                <img src="../img/main/main_3.jpg" alt="Third Slide" style="height:500px; width:100%;">
            	<div class="carousel-caption">
			        <p class="a_500" style="font-size:4rem; color:#5353c6; float:right;">아이디어 전시회</p>
			        <p class="a_500" style="font-size:2rem; color:#6666cc; float:right;">06.20~6.24 지상최대 아이디어 전시회 </p>
			    </div> 
            </div>
        </div>
        <!-- Carousel controls -->
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>
	
	<div style="height:5px; background-color:#b0aea9; margin-bottom:40px;">
	</div>
	
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
BoardDao boardDao = new BoardDao();
int totalRowCount = boardDao.selectTotalRecruitBoardCount();
int pagePerRow = 4; 
int beginRow = (currentPage-1)*pagePerRow;
List<Board> list = boardDao.selectRecruitBoardListPerPage(beginRow, pagePerRow);
%>
	<div>
	   <td><a href="<%=request.getContextPath()%>/board/boardRecruitList.jsp">모집중</a></td>
	   <td><a href="<%=request.getContextPath()%>/board/boardCompleteList.jsp">완료된</a></td>
    </div>
    <div>
	   <a href="<%=request.getContextPath()%>/board/boardGoodList.jsp">좋아요순으로 보기</a>
	   <a href="<%=request.getContextPath()%>/board/boardList.jsp">등록일순으로 보기</a>
    </div>
    
    	<div class="row">
            <div class="col-md-12">
                <div class="card acik-renk-form">
                    <div class="card-body">
                    	<p class="font-weight-light text-dark">흥미분야</p>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group ">
                                    <select id="interest_1" class="form-control a_400" >
                                        <option>없음</option>
                                        <option>인공지능</option>
                                        <option>안드로이드</option>
                                        <option>IOS</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group ">
                                    <select id="interest_2" class="form-control a_400" >
                                        <option>없음</option>
                                        <option>인공지능</option>
                                        <option>안드로이드</option>
                                        <option>IOS</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group ">
                                    <select id="interest_3" class="form-control a_400" >
                                        <option>없음</option>
                                        <option>인공지능</option>
                                        <option>안드로이드</option>
                                        <option>IOS</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <p class="font-weight-light text-dark">검색</p>
                        <FORM name='search' method='post' action='<%=request.getContextPath()%>/board/boardSearchAction.jsp'>
                        <div class="row">
	                        <div class="col-md-9">
	                            <div class="form-group ">
	                                <input type="text" class="form-control" name='search' placeholder="특수문자는 사용할수 없습니다.">
	                            </div>
	                         </div>
	                          <div class="col-md-3">
	                             <button type="submit" class="btn btn-warning  pl-5 pr-5 a_500">검색</button>
	                          </div>                
                        </div>
                       </FORM>
                    </div>
                </div>
            </div>
        </div> 
        
    <div>
     <form action = "result.jsp">
    <label for = "platform">플랫폼 : </label>
        <input type = "radio" name = "platform" value = "web">web
        <input type = "radio" name = "platform" value = "android">android
        <input type = "radio" name = "platform" value = "embeded">embeded
		<input type = "radio" name = "platform" value = "ios">iso
    </div>
    <div>
    <label for = "genre">장르 : </label>
        <input type = "radio" name = "genre" value = "health">health
        <input type = "radio" name = "genre" value = "psychology">psychology
        <input type = "radio" name = "genre" value = "game">game
    </div>
    
  <FORM name='search' method='post' action='<%=request.getContextPath()%>/board/boardSearchAction.jsp'>
    <ASIDE style='float: right;'>
      <input type='text' name='search' placeholder="특수문자는 사용할수 없습니다.">
      <button type='submit'>검색</button>    
    </ASIDE> 
  </FORM>

		<div class="row">
		<%
            for(Board b : list) {
		%>
			<div class="col-lg-4 col-sm-6 portfolio-item" style="margin-bottom:30px">
				<div class="card h-100">
					<a href="<%=request.getContextPath()%>/board/boardView.jsp?boardNo=<%=b.getId()%>"><img class="card-img-top"
						src="<%=b.getSrc()%>" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="<%=request.getContextPath()%>/board/boardView.jsp?boardNo=<%=b.getId()%>"><%=b.getTitle()%></a>
						</h4>
						<p class="card-text"><%=b.getWriter()%>  </p>
						<p class="card-text"><%=b.getRegistration_date()%> </p>
					</div>
				</div>
			</div>
<%        
            }
%>
 		</div>
    <div>
        <a href="<%=request.getContextPath()%>/board/boardAddForm.jsp">작성하기</a>
    </div>
<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
    <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/board/boardRecruitList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage < lastPage) {
%>
 
            <a href="<%=request.getContextPath()%>/board/boardRecruitList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
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

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>	



</body>
</html>