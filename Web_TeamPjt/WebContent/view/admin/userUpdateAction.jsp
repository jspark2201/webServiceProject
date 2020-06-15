<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="User.UserDTO"%>
<%@ page import="User.UserDAO"%>
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
		
		
		User.UserDTO user = new User.UserDTO();
		
		user.setId(id);
		user.setPwd(pwd);
		user.setNickname(nickname);
		user.setEmail(email);
		user.setNumber(number);

		
		if (user.getId() == null || user.getNickname() == null
			|| user.getEmail() == null || user.getNumber() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else{
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		boolean result = userDAO.updateDB(user);				
		
		if(!result){ // 아이디가 기본키기. 중복되면 오류.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//가입성공
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