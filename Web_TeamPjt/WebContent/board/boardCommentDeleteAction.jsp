<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 삭제</title>
</head>
<body>
	<%
		if (request.getParameter("commentNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(request.getParameter("commentNo"));//댓글 번호
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));//글 번호
		Board board = new Board();
		board.setId(Id);

		BoardDao boardDao = new BoardDao();
		boardDao.deleteComment(Id);//댓글삭제

		if (boardDao.deleteComment(Id) == 1) {
			response.sendRedirect(request.getContextPath() + "/board/boardList.jsp?boardNo=" + boardNo);
		}
	}
	%>
</body>
</html>