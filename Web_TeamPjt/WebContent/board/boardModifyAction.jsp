<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
	<%
		String realFolder = "";
	String filename1 = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "UTF-8";
	String savefile = "upload";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	if (multi.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(multi.getParameter("boardNo"));//글 번호

		Board board = new Board();
		board.setId(Id);
		String uid = (String) session.getAttribute("userID");//사용자 세션
		String Title = multi.getParameter("title");
		board.setWriter(uid);
		String[] platform = multi.getParameterValues("interest_1");
		if (platform.length == 1) {
			if (platform[0].equals("web")) {
		board.setWeb(true);
		board.setAndroid(false);
		board.setEmbeded(false);
		board.setIos(false);
			} else if (platform[0].equals("android")) {
		board.setWeb(false);
		board.setAndroid(true);
		board.setEmbeded(false);
		board.setIos(false);
			} else if (platform[0].equals("embeded")) {
		board.setWeb(false);
		board.setAndroid(false);
		board.setEmbeded(true);
		board.setIos(false);
			} else {
		board.setWeb(false);
		board.setAndroid(false);
		board.setEmbeded(false);
		board.setIos(true);
			}

		}

		String[] genre = multi.getParameterValues("interest_2");
		if (genre.length == 1) {
			if (genre[0].equals("health")) {
		board.setHealth(true);
		board.setPsychology(false);
		board.setGame(false);
			} else if (genre[0].equals("psychology")) {
		board.setHealth(false);
		board.setPsychology(true);
		board.setGame(false);
			} else if (genre[0].equals("game")) {
		board.setHealth(false);
		board.setPsychology(false);
		board.setGame(true);
			}
		}

		String Content = multi.getParameter("content");

		try {
			Enumeration<?> files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			filename1 = multi.getFilesystemName(file1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String Src = realFolder + "\\" + filename1;
		
		String Requirements = multi.getParameter("requirements");

		board.setTitle(Title);
		board.setContent(Content);
		board.setSrc(Src);
		board.setRequirements(Requirements);

		if (board.getWriter() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else if (board.getTitle() == null || board.getContent() == null || board.getSrc() == null
				|| board.getRequirements() == null) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");

		}else {
			
			BoardDao boardDao = new BoardDao();
			boardDao.updateBoard(board);//아이디어 삽입

			boardDao.updatePicturesBoard(board);//사진 삽입
			boardDao.updateTypeBoard(board);//타입 삽입

			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + Id);
		}
		
		
		

	}
	%>
</body>
</html>