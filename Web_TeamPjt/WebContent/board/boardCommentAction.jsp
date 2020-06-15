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
<title>댓글 달기</title>
</head>
<body>
	<%
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));//아이디어 테이블 기본키
		String id = (String)session.getAttribute("userID");//사용자 세션

		boardNo = Integer.parseInt(request.getParameter("boardNo"));//아이디어 테이블 기본키
		String comment = request.getParameter("comment");

		Board board = new Board();
		board.setId(boardNo);
		board.setContent2(comment);
		board.setId2(id);

		BoardDao boardDao = new BoardDao();
		
		if (board.getId2() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else{
			boardDao.InsertComment(board);
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
		}
		
		
	%>

</body>
</html>