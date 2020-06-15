<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<%-- <%
      String userid = null;
	
   if (session.getAttribute("userid") != null) {
      userid = (String) session.getAttribute("userid");
   }else{
	   out.println("<script>alert('로그인하신 후 이용해주십시오.');</script>");
	   %>
	   <script type="text/javascript">setTimeout(response.sendRedirect("index.jsp"), 1000);</script>
	   <%
   }
%> --%>

<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">
<link rel="stylesheet" href="/Web_TeamPjt/css/detail/detail1.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/bootstrap.min.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/googleFont.css">
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
	
	<div style="height:80px; background-color:#FFCE1E;">
	</div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1">프로젝트 제목 ...</h1>
		</div>
	</div>


	
	<!-- Page Content -->
  <div class="container" style="padding:100px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
    
    <button type="button" class="btn btn-outline-success" onclick="finAlert()" style="margin-left:80%;" id="finBtn">
    	<a class="a_400">모집완료</a><img alt="" src="../img/detail/finish.png" style="margin-left:5px; margin-bottom:5px; height:15px; width:15px;">
    </button>
    <hr class="hr1">
    <div class="row">
    	<div class="col-sm-2" style="width:100%; text-align:right; margin-left:80%;">
    		<a class="text-muted" style="font-size:10px;">Number of likes</a><br>
      		<a class="h4">9,123</a>
      		<img alt="" src="../img/heart.png" style="height:32px; width:32px; margin-bottom:10px;">
  		</div>
		<div class="row a_400" style="font-size:2rem; margin:30px; ">
			프로젝트 제목
		</div>
		
  	
      <!-- Post Content Column -->
      <div><!-- class="col-lg-8" -->
	
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

        <hr class="hr1">

        <!-- Date/Time -->
        <p>Posted on January 1, 2017 at 12:00 PM</p>

        <hr class="hr1">
		
		<div class="row a_400" style="font-size:1.5rem; margin:30px; ">
			프로젝트 소개
		</div>
        <!-- Post Content -->
        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?</p>

        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>

        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>

        <blockquote class="blockquote">
          <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
          <footer class="blockquote-footer">Someone famous in
            <cite title="Source Title">Source Title</cite>
          </footer>
        </blockquote>

        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem obcaecati?</p>

        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione tempore quidem voluptates cupiditate voluptas illo saepe quaerat numquam recusandae? Qui, necessitatibus, est!</p>

        <hr class="hr1">
        
        <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#memberModal"><a class="a_400">명단관리</a></button>
        
        <hr class="hr1">
        	
        <button type="button" class="btn btn-outline-danger" id="likeBtn"><a class="a_400">좋아요</a><img alt="" src="../img/heart2.png" style="margin-bottom:5px;"></button>
        
        <hr class="hr1">
		
		
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-warning">Submit</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>
          </div>
        </div>
		</div>
    </div>
    <!-- /.row -->
    
    <hr>
    
    <button type="button" class="btn btn-outline-warning" onclick="">글수정</button>
    <button type="button" class="btn btn-outline-danger" onclick="deleteAlert()">글삭제</button>

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
  
  
  	<!-- 참여자 명단 MODAL -->
  <div class="modal fade" id="memberModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><a class="a_400">명단관리</a></h4>
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
	        	<a class="a_400" style="font-size:1rem;">신청한 개발자</a>
	        	<div class="row" style="text-align:center;">
	        		<div class="row" style="text-align:center;">
					  <div class="col-sm-3"><a class="a_400">능식</a></div>
					  <div class="col-sm-3" style="width:600px;"><a class="a_400">ks1466@naver.com</a></div>
					  <div class="col-sm-3"><img src="../img/detail/check.png" alt="추가하기" onclick="alert('이전');"/></div>
					  <div class="col-sm-3"><img src="../img/detail/cross.png" alt="삭제하기" onclick="alert('이전');"/></div>
					</div>
	        	</div>
	        	<hr>
	        	<a class="a_400" style="font-size:1rem;">참여중 개발자</a>
	        	<div class="row" style="text-align:center;">
	        		<div class="row" style="text-align:center;">
					  <div class="col-sm-3"><a class="a_400">능식</a></div>
					  <div class="col-sm-3" style="width:600px;"><a class="a_400">ks1466@naver.com</a></div>
					  <div class="col-sm-3"><img src="../img/detail/check.png" alt="추가하기" onclick="alert('이전');"/></div>
					  <div class="col-sm-3"><img src="../img/detail/cross.png" alt="삭제하기" onclick="alert('이전');"/></div>
					</div>
	        	</div>
        	</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  

	<!-- Bootstrap core JavaScript -->
	<script src="/Web_TeamPjt/vendor/jquery/jquery.min.js"></script>
	<script src="/Web_TeamPjt/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="/Web_TeamPjt/js/alertScript.js" ></script>
	<script type="text/javascript" src="/Web_TeamPjt/js/detail/detail.js" ></script>
	
</body>
	<script>
		$(document).ready(function(){
		  $("#likeBtn").click(function(){
		    $('.toast').toast('show');
		  });
		});
	</script>
</html>

