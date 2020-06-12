<<<<<<< HEAD:Web_TeamPjt/WebContent/index.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>안녕하세요</p>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<jsp:useBean id="userinfo" class="user.UserBean" scope="request" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	body {text-align:center;}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 실패  다시 시도해 주세요')");
		script.println("history.back()");
		script.println("</script>");
	%>
</body>
>>>>>>> front:Web_TeamPjt/WebContent/view/login_fail.jsp
</html>