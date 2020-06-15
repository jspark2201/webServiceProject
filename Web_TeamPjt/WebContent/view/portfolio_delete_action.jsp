
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="mypage.PortfolioBean"%>

<%@ page import="mypage.DBEventDAO"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");

	//response.setContentType("text/html; charset=UTF-8");

%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%
	DBEventDAO DAO = DBEventDAO.getInstance();
		String userID = "admin3";
/*
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.

		}*/

		if (userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} 

		int bbsID = 0;

		if(request.getParameter("bbsID") != null){

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if(bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다')");

			script.println("location.href='bbs.jsp'");

			script.println("</script>");

		}

		PortfolioBean port = DAO.getPortfolio(bbsID);
		System.out.println("bbsId:"+port.getUserID());
		if(!userID.equals(port.getUserID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('권한이 없습니다')");

			script.println("location.href='bbs.jsp'");

			script.println("</script>");			

		}

		else{



			int result = DAO.delete(bbsID);

			if (result == -1) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('글 삭제에 실패했습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("location.href='myPage.jsp'");

				script.println("</script>");

			}

		}

	%>

</body>

</html>
