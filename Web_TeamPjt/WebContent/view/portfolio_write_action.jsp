
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="mypage.DBEventDAO"%>
<%@ page import="mypage.PortfolioBean"%>


<!-- bbsdao의 클래스 가져옴 -->

<%@ page import="java.io.PrintWriter"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>

<!-- 자바 클래스 사용 -->

<%
	//	request.setCharacterEncoding("UTF-8");

//	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>



<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<%
	System.out.println("글작성중");
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

	String realFolder = "";
	String imgpath = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "UTF-8";
	String savefile = "img";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);

	PortfolioBean port = new PortfolioBean();
	MultipartRequest multi;

	try {
		int result = -1;
		int result2 = -1;
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		port.setBbs_title(multi.getParameter("bbs_title"));
		port.setRegistrationDate(multi.getParameter("registrationDate"));
		port.setCompleteDate(multi.getParameter("completeDate"));
		port.setBbsContent(multi.getParameter("bbsContent"));
		port.setProjectUrl(multi.getParameter("projectUrl"));
		port.setParticipantsNumber(Integer.parseInt(multi.getParameter("participantsNumber")));
		port.setBbs_title(multi.getParameter("bbs_title"));
		imgpath = multi.getFilesystemName("pictsrc");
		String imgFullPath = null;
		if (imgpath != null) {
			imgFullPath = "..\\img\\" + imgpath;
		}

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
		"C:/Users/ansdu/web_front/webServiceProject/Web_TeamPjt/WebContent/view/ex_detail.jsp"
		} else {}*/

		if (port.getBbs_title() == null || port.getBbsContent() == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('입력이 안된 사항이 있습니다')");

			script.println("history.back()");

			script.println("</script>");

		} else {

			DBEventDAO DAO = new DBEventDAO();
			boolean web = false, android = false, embeded = false, ios = false, health = false, psychology = false,
			game = false;
			result = DAO.writePortfolio(port.getBbs_title(), userID, port.getBbsContent(), port.getRegistrationDate(),
			port.getCompleteDate(), port.getParticipantsNumber(), port.getProjectUrl());

			int portID = DAO.getPortfolilID(userID, port.getRegistrationDate(), port.getCompleteDate());

			if (imgFullPath != null) {

		port.setPictsrc(imgFullPath);

		result2 = DAO.writePict(port.getPictsrc(), portID);
			}
			else
				result2 = 1;
			String[] favorite = multi.getParameterValues("favorite");
			for (int i = 0; i < favorite.length; i++) {

		if (favorite[i].equals("web"))
			web = true;
		else if (favorite[i].equals("android"))
			android = true;
		else if (favorite[i].equals("embeded"))
			embeded = true;
		else if (favorite[i].equals("ios"))
			ios = true;
		else if (favorite[i].equals("health"))
			health = true;
		else if (favorite[i].equals("psychology"))
			psychology = true;
		else if (favorite[i].equals("game"))
			game = true;
			}
			DAO.writeIdeaFavorite(portID, web, android, embeded, ios, health, psychology, game);
			if (result == -1 | result2 == -1) {

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

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>

</html>

