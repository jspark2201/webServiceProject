<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="note.*" %>
    <%@page import="notification.*" %>
    <%@page import="java.util.ArrayList" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>IDEARIA</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="shortcut icon" href="/Web_TeamPjt/img/favicon/ecology.png">
<link rel="stylesheet" href="/Web_TeamPjt/css/myPage/myPage1.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/bootstrap.min.css">
<link rel="stylesheet" href="/Web_TeamPjt/css/googleFont.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
/* $(function(){
  $('#noteModalTitle').text('이름을 입력하세요');
}); */
var title2;
var receiveID;

function sendTitle(title, giveID, comment) {
	$('#noteModalTitle').text(title);
	$('#noteModalWriter').text(giveID);
	$('#noteModalContent').text(comment);
	title2 = title;
	receiveID = giveID;
}

function writeTitle() {	//모달창에서 보내기를 눌렀을 
	$('#reSendTitle').val("re:"+title2);
	$('#writeModalTitle').text("re:"+title2);
	$('#receiveID').val(receiveID);
}
</script>

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
					<li class="nav-item"><a class="nav-link a_400" href="#">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link a_400" href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
		
	<div style="height:80px; background-color:#FFCE1E; margin-bottom:30px;	">
	</div>


	
	<!-- Page Content -->
  <div class="container" style="padding:80px; background-color:#ffffff; border:1px solid #a6a6a6; margin-bottom:50px;">
		
  
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
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu3">임시저장</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link a_500" style="color:#FFCE1E;" data-toggle="tab" href="#menu4">알림</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="home" class="container tab-pane active" ><br>
				<table class="table">
					<thead>
						<tr>
							<th>보낸 사람</th>
							<th>이메일</th>
							<th>제목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
					
<%--  					<%
					NoteDAO dao = new NoteDAO();
					
					ArrayList<NoteDTO> list = dao.noteList();
					for(NoteDTO dto:list) {
					%> --%>
					
					<%
					NoteDAO dao = new NoteDAO();
					ArrayList<NoteDTO> list = dao.noteList();
					request.setAttribute("list", list);
					%>
					
					<c:forEach var="n" items="${list}">
						<tr>
							<td ><a name="giveID">${n.giveID}</a></td>
							<td><a name="giveEmail">${n.giveEmail}</a></td>
							<td>${n.title} </td>
							<td><a id="noteContent" data-toggle="modal" data-target="#mailModal" onclick="sendTitle('${n.title}', '${n.giveID}', '${n.comment}')">${n.comment}</a></td>
						</tr>
					</c:forEach>
					

<%-- 					<%
					}
					%> --%>
					
					
					
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
	      <h3>Menu 1</h3>
	      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	    </div>
	    <div id="menu2" class="container tab-pane fade"><br>
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
	    <div id="menu3" class="container tab-pane fade"><br>
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
	    <div id="menu4" class="container tab-pane fade"><br>
	    <table class="table">
					<thead>
						<tr>

							<th>보낸 사람</th>
							<th>이메일</th>
							<th>내용</th>
							<th>아이디어 제목</th>
							<th>아이디어 링크</th>
						</tr>
					</thead>
					<tbody>
					<%
						NotificationDAO dao2 = new NotificationDAO();
					
						ArrayList<NotificationDTO> list2 = dao2.notificationList();
						for(NotificationDTO dto:list2) {
					%>
						<tr>
							<td><%=dto.getGiveID() %></td>
							<td><%=dto.getGiveEmail() %></td>
							<td>컨택 요청이 들어왔습니다.</td>
							<td><%=dto.getIdeaTitle() %></td>
							<%-- <td><a href="../Notification?data=<%=dto.getIdeaLink() %>"><%=dto.getIdeaLink() %></a></td> --%>
							<td><a href=""><%=dto.getIdeaLink() %></a></td>
						</tr>
					<%
						}	
					%>

					</tbody>
				</table>
	    
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

  
  <!-- 쪽지 MODAL -->
  <form>
  <div class="modal fade" id="mailModal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      

        <!-- Modal Header -->
       <div class="modal-header">
          <h4 class="modal-title" id="noteModalTitle">쪽지 제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <p id="noteModalWriter" class="a_500">작성자 : </p>
        <hr>
          	<p id="noteModalContent" class="a_400">쪽지 내용..</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#response_mailModal" ><a onclick="writeTitle()" class="a_400">답장하기</a></button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">닫기</a></button>
        </div>
        
      </div>
    </div>
  </div>
  </form>
  
       
    <!-- 쪽지 작성 MODAL -->
    <form action="../SendNote?action=send" method="post">
   		<div class="modal fade" id="response_mailModal">
    		<div class="modal-dialog modal-xl">
      			<div class="modal-content">
      	        	<!-- Modal Header -->
        			<div class="modal-header">
				         <h4 id="writeModalTitle" class="modal-title">쪽지 제목</h4>
				         <button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>
        	
			        <!-- Modal body -->
			        <div class="modal-body">
			        <hr>
			          	<textarea name="sendContent" class="a_400" id="field" placeholder="보내실 내용을 입력하여 주세요.(200자)" maxlength="200" rows="10" cols="40"></textarea>
			        </div>
        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			        	<input id="receiveID" name="noteRecevieID" type="hidden" value="aaa"></input>
			        	<input id="reSendTitle" name="sendTitle" type="hidden" value="abc"></input>
			          <button type="submit" class="btn btn-secondary">보내기</button>
			          <button type="button" class="btn btn-secondary" data-dismiss="modal"><a class="a_400">닫기</a></button>
			        </div>
      			</div>
    		</div>
  		</div>
    </form>


    
  
  

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>




