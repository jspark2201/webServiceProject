<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��û�� ������ ����</title>
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

		board.setId(boardNo);//���̵�� id
		board.setId2(participantsId);//������ id

		boardDao.deleteParticipants(board);//��û ������ ����
		response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + boardNo);
	}
	%>
</body>
</html>