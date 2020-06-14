
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="mypage.PortfolioBean"%>

<%@ page import="mypage.DBEventDAO"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>

<%

	request.setCharacterEncoding("UTF-8");

	//sresponse.setContentType("text/html; charset=UTF-8");

%>

<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%

		String userID = null;

		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.

		}

		if (userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} 
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
			imgFullPath =  "..\\img\\" + imgpath;
		}
		

		//글이 유효한지 판별

		int bbsID = 0;

		if (multi.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(multi.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'portfolio.jsp'");

			script.println("</script>");

		}

		PortfolioBean bbs = new DBEventDAO().getPortfolio(bbsID);

		if (!userID.equals(bbs.getUserID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('권한이 없습니다.')");

			script.println("location.href = 'portfolio.jsp'");

			script.println("</script>");				

		} else {

			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null ) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('입력이 안된 사항이 있습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				DBEventDAO DAO = new DBEventDAO();

				int result = DAO.update(bbsID, port.getBbs_title(),port.getBbsContent(),port.getRegistrationDate(),port.getCompleteDate(),port.getParticipantsNumber(),port.getProjectUrl());
				
				int result2 = DAO.updatePict(bbsID, imgFullPath);
				
				
				if (result == -1 | result2 == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글수정에 실패했습니다')");

					script.println("history.back()");

					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href='mypage.jsp'");

					//script.println("history.back()");

					script.println("</script>");

				}



			}



		}

	%>

</body>

</html>

