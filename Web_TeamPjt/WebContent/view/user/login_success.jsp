<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<jsp:useBean id="userinfo" class="User.User" scope="request" />
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
		response.sendRedirect("/Web_TeamPjt/service"); 
	%>
</body>
</html>