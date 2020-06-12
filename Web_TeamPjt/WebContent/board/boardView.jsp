<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>

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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">


</head>
<body>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    BoardDao boardDao = new BoardDao();
	System.out.println("view"+boardNo);
    Board board = boardDao.selectBoardByKey(boardNo);
    List<Board> mlist = boardDao.selectComments(boardNo);
    int goodCount = boardDao.goodCount(boardNo);
    int participantsCount = boardDao.participantsCount(boardNo);
    int cnt=mlist.size();
 
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
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div style="height:80px; background-color:#FFCE1E;">
	</div>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="a_500 p1"><%=board.getTitle()%></h1>
		</div>
	</div>

	<!-- Page Content -->
  <div class="container" style="padding:100px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
    <hr class="hr1">
    <div class="row">
		<div class="row a_400" style="font-size:2rem; margin:30px; ">
			<%=board.getTitle()%>
		</div>
		<div class="row a_400" style="font-size:2rem; margin:30px; ">
			좋아요수<%=goodCount%>
		</div>
		
    	<form action="<%=request.getContextPath()%>/board/boardGoodAction.jsp" method="post">
             <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
             <button type="submit" class="btn btn-primary">좋아요</button>
       </form>
    	
    
        <form action="<%=request.getContextPath()%>/board/boardContactAction.jsp" method="post">
        	<input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        	<div>
            <button type="submit" class="btn btn-primary">모집 완료 미구현</button>    
        	</div>
   		 </form>
    
      <!-- Post Content Column -->
      <div><!-- class="col-lg-8" -->

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="<%=board.getSrc()%>" alt="">

        <hr class="hr1">

        <!-- Date/Time -->
        <p><%=board.getRegistration_date()%> <%=board.getWriter()%></p>

        <hr class="hr1">
		
		<div class="row a_400" style="font-size:1.5rem; margin:30px; ">
			프로젝트 소개
		</div>
		<div>플랫폼 및 장르</div>
		<div class="row a_200" style="font-size:1.5rem; margin:5px; ">
	    <p><%=board.isWeb()%></p>
	  	<p><%=board.isAndroid()%></p>
	    <p><%=board.isEmbeded()%></p>
	    <p><%=board.isIos()%></p>
	    <p><%=board.isHealth()%></p>
	    <p><%=board.isPsychology()%></p>
	    <p><%=board.isGame()%></p>
		</div>
		
		
        <!-- Post Content -->
        <p class="lead">
         <%=board.getContent()%></p>

        <blockquote class="blockquote">
          <p class="mb-0"><%=board.getRequirements()%></p>
        </blockquote>
        <hr class="hr1">
        <hr class="hr1">

        <!-- Comments Form -->

        
       <form action="<%=request.getContextPath()%>/board/boardContactAction.jsp" method="post">
             <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
             <button type="submit" class="btn btn-primary">컨택 하기</button>
       </form>

        <form action="<%=request.getContextPath()%>/board/participantsManagerAction.jsp" method="post">
             <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
             <button type="submit" class="btn btn-primary">명단 관리</button>
       </form>
       
       <form action="<%=request.getContextPath()%>/board/boardModifyForm.jsp" method="post">
             <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
             <button type="submit" class="btn btn-primary">글 수정</button>
       </form>
       
       <form action="<%=request.getContextPath()%>/board/boardRemoveAction.jsp" method="post">
             <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
             <button type="submit" class="btn btn-primary">글 삭제</button>
       </form>

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form action="<%=request.getContextPath()%>/board/boardCommentAction.jsp" method="post">
              <div class="form-group">
               <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
                <textarea class="form-control" name="comment" id="comment" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
        <%
            for(Board comment : mlist) {
		%>
              
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0"><%=comment.getWriter()%> <%=comment.getRegistration_date()%></h5>
            <%=comment.getContent2()%>
          </div>
          <form action="<%=request.getContextPath()%>/board/boardCommentDeleteAction.jsp" method="post">
              <div class="form-group">
			        <input name="commentNo" value="<%=comment.getId()%>" type="hidden"/>
			        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
              </div>
              <button type="submit" class="btn btn-primary" value="댓글삭제">댓글 삭제</button>
            </form>
        </div>
        <%        
            }
		%>
        
		</div>
      </div>
    </div>
    <!-- /.row -->

  
  <!-- /.container -->



	 <div>댓글개수 : <%=cnt%></div>
    <div>좋아요수 : <%=goodCount%></div>
    
         <form action="<%=request.getContextPath()%>/board/boardContactAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div>
            <input type="submit" value="모집완료버튼(미구현)"/>
           
        </div>
    </form>
    
    <form action="<%=request.getContextPath()%>/board/boardGoodAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div>
            <input type="submit" value="좋아요"/>
           
        </div>
    </form>
    
    <div>board_no :</div>
    <div><%=board.getId()%></div>
    <div>제목:</div>
    <div><%=board.getTitle()%></div>
    <div>글쓴이 :</div>
    <div><%=board.getWriter()%></div>
    <div>내용:</div>
    <div><%=board.getContent()%></div>
    <div>요구사항:</div>
    <div><%=board.getRequirements()%></div>
    <div>등록일 :</div>
    <div><%=board.getRegistration_date()%></div>
    <div>완료일 :</div>
    <div><%=board.getComplete_date()%></div>
    <div>참가자 수 :</div>
    <div><%=participantsCount%></div>
    <div>상태</div>
    <div><%=board.getState()%></div>
    <div>사진</div>
    <div><img src="<%=board.getSrc()%>" style="width: 100px; height: 75px;"></div> 
    <div>플랫폼 및 장르</div>

    <div><%=board.isWeb()%></div>
  	<div><%=board.isAndroid()%></div>
    <div><%=board.isEmbeded()%></div>
    <div><%=board.isIos()%></div>
    <div><%=board.isHealth()%></div>
    <div><%=board.isPsychology()%></div>
    <div><%=board.isGame()%></div>

     <form action="<%=request.getContextPath()%>/board/boardContactAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div>
            <input type="submit" value="컨택하기"/>
           
        </div>
    </form>
    
    <form action="<%=request.getContextPath()%>/board/participantsManagerAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div>
            <input type="submit" value="명단관리"/>
           
        </div>
    </form>
    
    
    
     <form action="<%=request.getContextPath()%>/board/boardCommentAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div><textarea name="comment" id="comment" rows="5" cols="50"></textarea></div>
        <div>
            <input type="submit" value="댓글등록"/>
           
        </div>
    </form>
    
        <table border="1">
        <thead>
            <tr>
            	<th>댓글</th>
                <th>글쓴이</th>
                <th>댓글일</th>
            </tr>
        </thead>
        <tbody>
<%
            for(Board comment : mlist) {
%>
                <tr>
              	<td><%=comment.getContent2()%></td>
                <td><%=comment.getWriter()%></td>
                <td><%=comment.getRegistration_date()%></td>
             	<td>
		        <form action="<%=request.getContextPath()%>/board/boardCommentDeleteAction.jsp" method="post">
			        <input name="commentNo" value="<%=comment.getId()%>" type="hidden"/>
			        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
			        <div>
			            <input type="submit" value="댓글삭제"/>
			           
			        </div>
		    	</form>
    			</td>
                </tr> 
<%        
            }
%>
        </tbody>
    </table>
    
    <div>
        <a href="<%=request.getContextPath()%>/board/boardModifyForm.jsp?boardNo=<%=board.getId()%>">글수정</a>
    </div>
    
     <form action="<%=request.getContextPath()%>/board/boardRemoveAction.jsp" method="post">
        <input name="boardNo" value="<%=request.getParameter("boardNo")%>" type="hidden"/>
        <div>
            <input type="submit" value="글삭제"/>
           
        </div>
    </form>

<%
}
%>
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

	
</body>
</html>