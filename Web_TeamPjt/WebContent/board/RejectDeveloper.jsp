<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개발 중 참가자 삭제</title>
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

		int n = boardDao.participantsCount(boardNo);//참가자 수

		board.setParticipants_num(n - 1);

		boardDao.UpdateParticipantsNum(board);//참가자 수 감소
		boardDao.deleteParticipants(board);//참여중 개발자 삭제
		response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
	}
	%>


</body>
</html>