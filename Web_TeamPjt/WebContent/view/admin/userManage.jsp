<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="User.User"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<%
	String type = request.getParameter("type");
	String search = request.getParameter("search");
	String order = request.getParameter("order");
	int curPageNum = (Integer)request.getAttribute("curPageNum");
	int pageCount = (Integer)request.getAttribute("PageCount");
		
		
		String src = "users.do?";
		
		if (search != null) {
			if (!search.equals("")) {
				src += "type=" + type + "&";
				src += "search=" + search + "&";
			}
		}

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
   				<div class="col-md-4 text-left">
   					<button type="button" class="btn" onclick="location.href='userAdd.do' ">ȸ���߰�</button>
					<button type="button" class="btn" onclick="groupDel();">����</button>
   				</div>
   				<div class="col-md-8 text-right">
					<form class="form" method="get" action="userManage.jsp">
						<div style="display:inline-block">
							<select class="mdb-select md-form colorful-select dropdown-primary" searchable="Search here.." name="type">
								<option value="id">���̵�</option>
								<option value="nickname">�г���</option>
								<option value="email">�̸���</option>
							</select>
						</div>
						<div style="display:inline-block">
	   						<%
								String tmp = search;
								if (search == null)
									tmp = "";
							%>
							<input type="text" class="form-control" name="search" value="<%=tmp%>"/>
						</div>
						<div style="display:inline-block">
	   						<button type="submit" class="btn btn-default" id="searchBtn">Search</button>
	   					</div>
					</form>
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
							<a href="<%=src%>order=id">���̵�</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="<%=src%>order=nickname">�г���</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="<%=src%>order=email">�̸���</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">
							<a href="<%=src%>order=date">������</a>
						</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">���</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${UserList}">
						<tr>
							<td><c:out value="${user.id}"/></td>
							<td><c:out value="${user.nickname}"/></td>
							<td><c:out value="${user.email}"/></td>
							<td><c:out value="${user.date}"/></td>
							<td><a href='userUpdate.do?id=<c:out value="${user.id}"/>'/>����</td>
							<td><input type="checkbox" id='<c:out value="${user.id}"/>'/></td>							
						</tr>					
					</c:forEach>
				</tbody>
			</table>
			
			<div class="row">
				<%
					// ������ �ѹ���
				
					int pageNum = 0;
					
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
			url: "userDelete.do",
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
