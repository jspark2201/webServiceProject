<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집종료</title>
</head>
<body>
	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(request.getParameter("boardNo"));//글번호
		Board board = new Board();
		board.setId(Id);

		BoardDao boardDao = new BoardDao();

		if (boardDao.updateDeadline(board) == 1) {
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + Id);
		} else {
			response.sendRedirect(request.getContextPath() + "/board/boardList.jsp?boardNo=" + Id);
		}
	}
	%>
</body>
</html>