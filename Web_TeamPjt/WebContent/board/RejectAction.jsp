<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>신청한 개발자 거절</title>
</head>
<body>
	<%
		if (request.getParameter("participantsId") == null || request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		String participantsId = request.getParameter("participantsId");

		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		Board board = new Board();
		BoardDao boardDao = new BoardDao();

		board.setId(boardNo);//아이디어 id
		board.setId2(participantsId);//참가자 id

		boardDao.deleteParticipants(board);//신청 개발자 삭제
		response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
	}
	%>
</body>
</html>