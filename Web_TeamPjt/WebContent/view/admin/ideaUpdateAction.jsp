<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Idea.Idea"%>
<%@ page import="Idea.IdeaDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("ideaId"));
	String title = request.getParameter("ideaTitle");
	String content = request.getParameter("ideaContent");
	String requirements = request.getParameter("ideaRequirements");
	int number_participants = Integer.parseInt(request.getParameter("ideaNumber_participants"));
	String url = request.getParameter("ideaUrl");
	String state = request.getParameter("ideaState");
	
	
	Idea idea = new Idea();
	
	idea.setId(id);
	idea.setTitle(title);
	idea.setContent(content);
	idea.setRequirements(requirements);
	idea.setNumber_participants(number_participants);
	idea.setUrl(url);
	idea.setState(state);

	
	if (idea.getId() == 0 || idea.getTitle() == null
		|| idea.getContent() == null || idea.getState() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			IdeaDAO ideaDAO = new IdeaDAO(); //�ν��Ͻ�����
			boolean result = ideaDAO.updateDB(idea);				
			
			if(!result){ // ���̵� �⺻Ű��. �ߺ��Ǹ� ����.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ �߻��߽��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//���Լ���
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'ideaManage.jsp'");
				script.println("</script>");
			}
		}
	 %>
	
</body>
</html>