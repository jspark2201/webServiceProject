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
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));//아이디어 테이블 기본키
		String id = (String)session.getAttribute("userID");//사용자 세션
		if (request.getParameter("boardNo") == null || request.getParameter("comment") == null || id==null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp?boardNo=" + boardNo);
	} else {
		boardNo = Integer.parseInt(request.getParameter("boardNo"));//아이디어 테이블 기본키
		String comment = request.getParameter("comment");

		
		
		Board board = new Board();
		board.setId(boardNo);
		board.setContent2(comment);
		board.setId2(id);

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