
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>


<%@ page import="mypage.DBEventDAO"%>

<!-- bbsdao의 클래스 가져옴 -->

<%@ page import="java.io.PrintWriter"%>

<!-- 자바 클래스 사용 -->

<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.

%>



<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="port" class="mypage.portfolio" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="port" property="bbs_title" /><!-- bbs.setBbsTitle(requrst) -->

<jsp:setProperty name="port" property="bbsContent" />

<jsp:setProperty name="port" property="participantsNumber" />

<jsp:setProperty name="port" property="registrationDate" />

<jsp:setProperty name="port" property="completeDate" />

<jsp:setProperty name="port" property="projectUrl" />

<jsp:setProperty name="port" property="pictsrc"/>

<%

	System.out.println(port);

%>

<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%

		String userID = "admin3";
/*
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.

		}

		if (userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} else {}*/



			if (port.getBbs_title() == null || port.getBbsContent() == null) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('입력이 안된 사항이 있습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				DBEventDAO DAO = new DBEventDAO();

				int result = DAO.writePortfolio(port.getBbs_title(), userID, port.getBbsContent(),port.getRegistrationDate(),port.getCompleteDate(),port.getParticipantsNumber(),port.getProjectUrl());
				//System.out.println(result);
				//int result2 = DAO.writePict(port.getPictsrc(),port.get);
				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글쓰기에 실패했습니다')");

					script.println("history.back()");

					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글쓰기 성공')");

					script.println("history.back()");

					script.println("</script>");

				}
				
				

			}



		

	%>

</body>

</html>

