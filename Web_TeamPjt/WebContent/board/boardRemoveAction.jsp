<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
</head>
<body>
	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(request.getParameter("boardNo"));

		Board board = new Board();
		board.setId(Id);

		BoardDao boardDao = new BoardDao();
		boardDao.deleteCommentBoard(board);//댓글 삭제
		boardDao.deleteIdea_Favorite_Board(board);//글 플랫폼 및 분야 삭제
		boardDao.deleteGoodBoard(board);//좋아요 삭제
		boardDao.deleteParticipantsBoard(board);//참가자 삭제
		boardDao.deletePictureBoard(board);//사진 삭제

		if (boardDao.deleteBoard(board) == 1) {//아이디어 삭제
			response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
		}
	}
	%>

</body>
</html>