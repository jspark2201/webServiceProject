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

<jsp:useBean id="event" class="User.User" scope="request" />
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
         <h1 class="a_500 p1">개인정보조회</h1>
      </div>
   </div>


   
   <!-- Page Content -->
  <div class="container" style="padding:100px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
    
    <hr class="hr1">
    <div class="row">
       
      
     
      <!-- Post Content Column -->
      <div><!-- class="col-lg-8" -->
      <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         아이디
      </div>
        <p class="lead"><jsp:getProperty name="event" property="id" /></p>

      <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         비밀번호
      </div>
        <p class="lead"><jsp:getProperty name="event" property="pwd" /></p>
        
        <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         닉네임
      </div>
        <p class="lead"><jsp:getProperty name="event" property="nickname" /></p>
        
        <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         이메일
      </div>
        <p class="lead"><jsp:getProperty name="event" property="email" /></p>
        
        <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         전화번호
      </div>
        <p class="lead"><jsp:getProperty name="event" property="number" /></p>
        
        <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         플랫폼
      </div>
        <p class="lead"><jsp:getProperty name="event" property="platform" /></p>
        
        <div class="row a_400" style="font-size:1.5rem; margin:30px; ">
         흥미분야
      </div>
        <p class="lead"><jsp:getProperty name="event" property="genre" /></p>
        
        <hr class="hr1">
        
       
    </div>
    <!-- /.row -->
    
    <hr>
    
    <button type="button" class="btn btn-outline-warning" href="/teamproject/Login?action=list">메인페이지로 돌아가기</button>

  </div>
  <!-- /.container -->

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
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript" src="/Web_TeamPjt/js/alertScript.js" ></script>
   
</body>

</html>

