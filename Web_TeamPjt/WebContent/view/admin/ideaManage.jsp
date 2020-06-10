<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Idea.Idea"%>
<%@ page import="Idea.IdeaDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

	<%
	/*
		// admin이 아닌 경우	
		String sessId = (String)session.getAttribute("id");            // request에서 id 파라미터를 가져온다
		
		if (sessId == null || !sessId.equals("admin")) {
			response.sendRedirect("../index.jsp");    // 로그인 페이지로 리다이렉트 한다.
		}
	*/
		
		IdeaDAO ideaDAO = new IdeaDAO();

		// 검색 조건  (default: "writer")
		String type = "writer";
		
		if (request.getParameter("type") != null)
			type = request.getParameter("type");
		
		switch(type) {
			case "writer": case "title": case "state":
				break;
			default:
				type = "writer";
		}
	
		
		// 검색어
		String search = null;
	
		if (request.getParameter("search") != null)
			search = request.getParameter("search");
		
	
	
		// 페이지 넘버 (default: 1)
		int curPageNum = 1;

		if (request.getParameter("pageNum") != null)
			curPageNum = Integer.parseInt(request.getParameter("pageNum"));
		

		int pageCount = (ideaDAO.getDBCount(type, search) - 1) / 10 + 1;
		
		if (curPageNum < 0 || curPageNum > pageCount)
			curPageNum = 1;

		
		// 정렬 방식 (default: "date")
		String order = "id";

		if (request.getParameter("id") != null)
			order = request.getParameter("id");
		
		switch(order) {
			case "id": case "writer": case "title":
			case "date": case "state":
				break;
			default:
				order = "id";
		}

		
		PrintWriter printer = response.getWriter();

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


	<!-- 게시판 -->
	<div class="container">
	
		<div class="search_div">
			<div class="row">
   				<div class="col-md-8">
					<form class="form" method="get" action="ideaManage.jsp">
						<div class="col-md-2">
							<select class="mdb-select md-form colorful-select dropdown-primary" searchable="Search here.." name="type">
								<option value="writer">작성자</option>
								<option value="title">제목</option>
								<option value="state">상태</option>
							</select>
						</div>
	   					<div class="col-md-3">
	   						<%
								String tmp = search;
								if (search == null)
									tmp = "";
							%>
							<input type="text" class="form-control" name="search" value="<%=tmp%>"/>
						</div>
						<div class="col-md-1">
	   						<button type="submit" class="btn btn-default" id="searchBtn">Search</button>
	   					</div>
					</form>
				</div>
   				<div class="col-md-4 text-right">
					<button type="button" class="btn" onclick="groupDel();">삭제</button>
   				</div>
			</div>
		</div>

		</br>

		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="ideaManage.jsp?order=writer">작성자</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="ideaManage.jsp?order=title">제목</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							등록 시간
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							완료 시간
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							팀원 수
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="ideaManage.jsp?order=state">상태</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">조회/수정</th>
						<th style="background-color: #eeeeee; text-align: center;">비고</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<Idea> list = ideaDAO.getDBList(type, search, order, curPageNum);
					
						for (int i = 0; i < list.size(); i++) {
							if (list.get(i) != null) {
					%>
					<tr>
						<td><%=list.get(i).getWriter()%></td>
						<td><%=list.get(i).getTitle()%></td>
						<td><%=list.get(i).getRegistration_date()%></td>
						<td><%=list.get(i).getComplete_date()%></td>
						<td><%=list.get(i).getNumber_participants()%></td>
						<td><%=list.get(i).getState()%></td>
						<td><a href="ideaUpdate.jsp?id=<%=list.get(i).getId()%>">조회/수정</td>
						<td><input type="checkbox" id="<%=list.get(i).getId()%>"></td>
						
					</tr>
					<%
							}
						}
					%>

				</tbody>
			</table>
			
			<div class="row">
				<%
					// 페이지 넘버링
				
					String src = "ideaManage.jsp?";
					int pageNum = 0;
					
					if (search != null) {
						src += "type=" + type + "&";
						src += "search=" + search + "&";
					}
					src += "pageNum=";
					
				%>
					<div class="col-md-4 text-right">
				<%
					if (curPageNum != 1) {
					%>
						<a href="<%=src + (curPageNum-1)%>" class="btn btn-success btn-arrow-left">이전</a>
					<%
					}
				%>
					</div>
					<div class="col-md-4 text-center">
				<%	
					for (int i=0; i<5; i++)
					{
						pageNum = curPageNum + i -2;						
						if (0 < pageNum && pageNum <= pageCount)
						{
					%>
					<a href="<%=src + pageNum%>" class="btn btn-success btn-arrow-left"><%=pageNum%></a>
					<%
						}						
					}
					%>
					</div>
					<div class="col-md-4 text-left">
					<%
					if (curPageNum != pageCount) {
					%>
						<a href="<%=src + (curPageNum+1)%>" class="btn btn-success btn-arrow-left">다음</a>
					</div>
					<%
						}
					%>
			</div>	
		</div>
	</div>




	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script>
	
	function groupDel() {
		
		if (!confirm("정말로 삭제하시겠습니까?"))
			return;
		
		var array = [];
		
		var id = '';
		 $('input:checkbox').each(function() {
		     if(this.checked){
		    	 id = this.id;
		    	 array.push(id);
		    	 console.log(id);
		      }
		 });
		 
		 console.log(array);
		 
		$.ajax({
			url: "ideaDelAction.jsp",
			data: { 'idArray' : array },
			type: "post",
			success: function(data) {
				alert("삭제되었습니다.");
			},
			error: function(request, status, error) {
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
		location.reload();

	}


	
	</script>

</body>
</html>
