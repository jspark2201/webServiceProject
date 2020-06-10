<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Web_TeamPjt.Idea"%>
<%@ page import="Web_TeamPjt.IdeaDAO"%>
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
		IdeaDAO ideaDAO = new IdeaDAO();

		// �˻� ����  (default: "writer")
		String type = "writer";
		
		if (request.getParameter("type") != null)
			type = request.getParameter("type");
		
		switch(type) {
			case "writer": case "title": case "state":
				break;
			default:
				type = "writer";
		}
	
		
		// �˻���
		String search = null;
	
		if (request.getParameter("search") != null)
			search = request.getParameter("search");
		
	
	
		// ������ �ѹ� (default: 1)
		int curPageNum = 1;

		if (request.getParameter("pageNum") != null)
			curPageNum = Integer.parseInt(request.getParameter("pageNum"));
		

		int pageCount = (ideaDAO.getDBCount(type, search) - 1) / 10 + 1;
		
		if (curPageNum < 0 || curPageNum > pageCount)
			curPageNum = 1;

		
		// ���� ��� (default: "date")
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


	<!-- �׺���̼�  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">JSP �Խ���</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">����</a></li>
				<li class="active"><a href="userManage.jsp">ȸ������</a></li>
				<li class="active"><a href="ideaManage.jsp">���̵�����</a></li>
			</ul>
	</nav>


	<!-- �Խ��� -->
	<div class="container">
	
		<div class="search_div">
			<div class="row">
   				<div class="col-md-8">
					<form class="form" method="get" action="ideaManage.jsp">
						<div class="col-md-2">
							<select class="mdb-select md-form colorful-select dropdown-primary" searchable="Search here.." name="type">
								<option value="writer">�ۼ���</option>
								<option value="title">����</option>
								<option value="state">����</option>
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
					<button type="button" class="btn" onclick="groupDel();">����</button>
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
							<a href="ideaManage.jsp?order=writer">�ۼ���</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="ideaManage.jsp?order=title">����</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							��� �ð�
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							�Ϸ� �ð�
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							���� ��
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="ideaManage.jsp?order=state">����</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">��ȸ/����</th>
						<th style="background-color: #eeeeee; text-align: center;">���</th>
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
						<td><a href="ideaUpdate.jsp?id=<%=list.get(i).getId()%>">��ȸ/����</td>
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
					// ������ �ѹ���
				
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
						<a href="<%=src + (curPageNum-1)%>" class="btn btn-success btn-arrow-left">����</a>
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
						<a href="<%=src + (curPageNum+1)%>" class="btn btn-success btn-arrow-left">����</a>
					</div>
					<%
						}
					%>
			</div>	
		</div>
	</div>




	<!-- �ִϸ��̼� ��� JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- ��Ʈ��Ʈ�� JS  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script>
	
	function groupDel() {
		
		if (!confirm("������ �����Ͻðڽ��ϱ�?"))
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
				alert("�����Ǿ����ϴ�.");
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
