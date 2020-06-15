<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>신청개발자->참여 개발자</title>
</head>
<body>
	<%
		if (request.getParameter("participantsId") == null || request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		String participantsId = request.getParameter("participantsId");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("participantsId :" + participantsId);
		System.out.println("boardNo :" + boardNo);
		Board board = new Board();
		BoardDao boardDao = new BoardDao();

		int n = boardDao.participantsCount(boardNo);//참가자 수

		board.setParticipants_num(n + 1);
		board.setId(boardNo);//아이디어 id
		board.setId2(participantsId);//참가자 id

		boardDao.UpdateParticipantsNum(board);//참가자 수 증가
		boardDao.updateParticipants(board);//신청 개발자->참여 개발자
		response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
	}
	%>
</body>
</html>