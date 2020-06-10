<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Idea.Idea"%>
<%@ page import="Idea.IdeaDAO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>jsp �Խ��� ������Ʈ</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
	
		IdeaDAO ideaDAO = new IdeaDAO();
		Idea idea = new Idea();
			
		idea = ideaDAO.getDB(id);
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
	
	
	<!-- �α��� -->
	<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<!-- ����Ʈ�� -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- �α��� ������ ����鼭 ����post -->
				<form method="post" action="ideaUpdateAction.jsp">
					<h3 style="text-align: center;">�� ���� ����</h3>
					<input type="hidden" name="ideaId", value="<%=idea.getId()%>">
					<div class="form-group">
						<span>�ۼ���</span>
						<input type="text" class="form-control" placeholder="�ۼ���"
							name="ideaWriter" maxlength="20" value="<%=idea.getWriter()%>" readonly>
					</div>
					<div class="form-group">
						<span>����</span>
						<input type="text" class="form-control" placeholder="����"
							name="ideaTitle" maxlength="20" value="<%=idea.getTitle()%>">
					</div>
					<div class="form-group">
						<span>����</span>
						<input type="text" class="form-control" placeholder="����"
							name="ideaContent" maxlength="20" value="<%=idea.getContent()%>">
					</div>
					<div class="form-group">
						<span>�䱸����</span>
						<input type="text" class="form-control" placeholder="�䱸����"
							name="ideaRequirements" maxlength="20" value="<%=idea.getRequirements()%>">
					</div>
					<div class="form-group">
						<span>���� ��</span>
						<input type="text" class="form-control" placeholder="���� ��"
							name="ideaNumber_participants" maxlength="20" value="<%=idea.getNumber_participants()%>">
					</div>
					<div class="form-group">
						<span>���� ��ũ</span>
						<input type="text" class="form-control" placeholder="���� ��ũ"
							name="ideaUrl" maxlength="20" value="<%=idea.getUrl()%>">
					</div>
					<div class="form-group">
						<span>����</span>
						<input type="text" class="form-control" placeholder="����"
							name="ideaState" maxlength="20" value="<%=idea.getState()%>">
					</div>

					<input type="submit" class="btn btn-primary form-control" value="����">

				</form>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>



	<!-- �ִϸ��̼� ��� JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
		
	
	</script>
	<!-- ��Ʈ��Ʈ�� JS  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>
