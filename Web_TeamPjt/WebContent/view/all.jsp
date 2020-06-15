<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>

<link rel="shortcut icon" href="../img/favicon/ecology.png">
<link rel="stylesheet" href="/Web_TeamPjt/css/all/new-age.min.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/all/one-page-wonder.min.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/all/all.css">

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
               <li class="nav-item"><a class="nav-link a_400" onclick="logoutAlert()">로그아웃</a></li>
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
   
   <div class="container">
      <!-- 필터링 박스  -->
      <div class="row">
            <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                  <label class="btn btn-warning">
                     <input type="radio" name="jb-radio" id="jb-radio-1" checked><a class="a_400" style="color:#333333;">전체 아이디어 보기</a>
                  </label>
                  <label class="btn btn-warning">
                     <input type="radio" name="jb-radio" id="jb-radio-2"><a class="a_400" style="color:#333333;">모집 중 아이디어 보기</a>
                  </label>
                  <label class="btn btn-warning">
                     <input type="radio" name="jb-radio" id="jb-radio-3"><a class="a_400" style="color:#333333;">모집 완료 아이디어 보기</a>
                  </label>
               </div>
            </div>
        </div>
      
        
        <!-- 검색 박스  -->
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
                                        <option>WEB</option>
                                        <option>안드로이드</option>
                                        <option>임베디드</option>
                                        <option>IOS</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group ">
                                    <select id="interest_2" class="form-control a_400" >
                                        <option>없음</option>
                                        <option>건강</option>
                                        <option>심리학</option>
                                        <option>게임</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <p class="font-weight-light text-dark">검색</p>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group ">
                                    <input type="text" class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-warning  pl-5 pr-5 a_500">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </div>
   
      
        
        
    <section>
       <div class="container">
         <div class="row align-items-center">
           <div class="col-lg-6 order-lg-2">
             <div class="p-5">
               <img style="height:400px;width:400px;" class="img-fluid rounded-circle" src="/Web_TeamPjt/img/main/main_1.jpg" alt="">
             </div>
           </div>
           <div class="col-lg-6 order-lg-1">
             <div class="p-5">
               <h2 class="display-4">For those about to rock...</h2>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                <a href="#contact" class="btn btn-outline btn-xl js-scroll-trigger" style="color:#FFCE1E;">Let's Get Started!</a>
             </div>
           </div>
         </div>
       </div>
     </section>
      <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="p-5">
            <img style="height:400px;width:400px;" class="img-fluid rounded-circle" src="/Web_TeamPjt/img/main/main_1.jpg" alt="">
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5">
            <h2 class="display-4">We salute you!</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
             <a href="#contact" class="btn btn-outline btn-xl js-scroll-trigger" style="color:#FFCE1E;">Let's Get Started!</a>
          </div>
        </div>
      </div>
    </div>
     </section>
      <section>
       <div class="container">
         <div class="row align-items-center">
           <div class="col-lg-6 order-lg-2">
             <div class="p-5">
               <img style="height:400px;width:400px;" class="img-fluid rounded-circle" src="/Web_TeamPjt/img/main/main_1.jpg" alt="">
             </div>
           </div>
           <div class="col-lg-6 order-lg-1">
             <div class="p-5">
               <h2 class="display-4">For those about to rock...</h2>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                <a href="#contact" class="btn btn-outline btn-xl js-scroll-trigger" style="color:#FFCE1E;">Let's Get Started!</a>
             </div>
           </div>
         </div>
       </div>
     </section>
      <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="p-5">
            <img style="height:400px;width:400px;" class="img-fluid rounded-circle" src="/Web_TeamPjt/img/main/main_1.jpg" alt="">
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5">
            <h2 class="display-4">We salute you!</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
             <a href="#contact" class="btn btn-outline btn-xl js-scroll-trigger" style="color:#FFCE1E;">Let's Get Started!</a>
          </div>
        </div>
      </div>
    </div>
     </section>
      <section>
       <div class="container">
         <div class="row align-items-center">
           <div class="col-lg-6 order-lg-2">
             <div class="p-5">
               <img style="height:400px;width:400px;" class="img-fluid rounded-circle" src="/Web_TeamPjt/img/main/main_1.jpg" alt="">
             </div>
           </div>
           <div class="col-lg-6 order-lg-1">
             <div class="p-5">
               <h2 class="display-4">For those about to rock...</h2>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
                <a href="#contact" class="btn btn-outline btn-xl js-scroll-trigger" style="color:#FFCE1E;">Let's Get Started!</a>
             </div>
           </div>
         </div>
       </div>
     </section>
      <section>
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="p-5">
            <img style="height:400px;width:400px;" class="img-fluid rounded-circle" src="/Web_TeamPjt/img/main/main_1.jpg" alt="">
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5">
            <h2 class="display-4">We salute you!</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod aliquid, mollitia odio veniam sit iste esse assumenda amet aperiam exercitationem, ea animi blanditiis recusandae! Ratione voluptatum molestiae adipisci, beatae obcaecati.</p>
             <a href="#contact" class="btn btn-outline btn-xl js-scroll-trigger" style="color:#FFCE1E;">Let's Get Started!</a>
          </div>
        </div>
      </div>
    </div>
     </section>
     
  
  
  


  <!-- Pagination -->
      <ul class="pagination justify-content-center">
         <li class="page-item"><a class="page-link" href="#"
            aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
               class="sr-only">Previous</span>
         </a></li>
         <li class="page-item"><a class="page-link" href="#">1</a></li>
         <li class="page-item"><a class="page-link" href="#">2</a></li>
         <li class="page-item"><a class="page-link" href="#">3</a></li>
         <li class="page-item"><a class="page-link" href="#"
            aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
               class="sr-only">Next</span>
         </a></li>
      </ul>

   
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
        <div class="modal-header" style="text-align:center;" >
          <h4 class="modal-title a_400">-이용가이드-</h4>
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
   <!-- alert -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript" src="../js/alertScript.js" ></script> 
</body>
</html>