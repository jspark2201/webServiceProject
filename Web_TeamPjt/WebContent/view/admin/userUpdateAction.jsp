<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Web_TeamPjt.User"%>
<%@ page import="Web_TeamPjt.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	String nickname = request.getParameter("userNickname");
	String email = request.getParameter("userEmail");
	String number = request.getParameter("userNumber");
	
	
	User user = new User();
	
	user.setId(id);
	user.setPwd(pwd);
	user.setNickname(nickname);
	user.setEmail(email);
	user.setNumber(number);

	
	if (user.getId() == null || user.getNickname() == null
		|| user.getEmail() == null || user.getNumber() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO(); //�ν��Ͻ�����
			boolean result = userDAO.updateDB(user);				
			
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
				script.println("location.href = 'userManage.jsp'");
				script.println("</script>");
			}
		}
	 %>
	
</body>
</html>