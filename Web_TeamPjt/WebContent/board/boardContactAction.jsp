<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨택하기</title>
</head>
<body>
	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("boardNo :" + Id);
		//String id = (String)session.getAttribute("id");//사용자 세션
		String userID = "admin";
		Board board = new Board();
		board.setId(Id);
		board.setId2(userID);

		BoardDao boardDao = new BoardDao();
		int n = boardDao.participantsCount(Id);//참가자 수

		board.setParticipants_num(n);

		//참가를 신청한 경우이기 때문에 참가자 수를 증가하지않음
		if (boardDao.InsertParticipants(board) == 1) {//참가자를 삽입
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + Id);

		} else {//참가자 삽입 안되었을 경우
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + Id);

		}
	}
	%>


</body>
</html>