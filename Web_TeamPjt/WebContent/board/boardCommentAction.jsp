<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 달기</title>
</head>
<body>
	<%
		if (request.getParameter("boardNo") == null || request.getParameter("comment") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));//아이디어 테이블 기본키
		String comment = request.getParameter("comment");
		//String id = (String)session.getAttribute("id");//사용자 세션
		String userID = "admin";
		
		Board board = new Board();
		board.setId(boardNo);
		board.setContent2(comment);
		board.setId2(userID);

		BoardDao boardDao = new BoardDao();

		if (boardDao.InsertComment(board) == 1) {//댓글 등록
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
		} else {//등록 댓글이 없을 시 페이지로 돌아감
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
		}
	}
	%>

</body>
</html>