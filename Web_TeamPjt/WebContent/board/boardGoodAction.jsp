<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 기능</title>
</head>
<body>
	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(request.getParameter("boardNo"));
		String id = (String)session.getAttribute("id");//사용자 세션
		//String userID = "admin";
		System.out.println("boardNo :" + Id);
		Board board = new Board();
		board.setId(Id);//게시판 번호
		board.setId2(id);//사용자 아이디

		BoardDao boardDao = new BoardDao();
		//똑같은 사용자가 똑같은 아이디어에 좋아요 누를 수 없음
		if (boardDao.InsertGood(board) == 1) {
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + Id);
		} else {
			response.sendRedirect(request.getContextPath() + "/board/boardList.jsp?boardNo=" + Id);
		}
	}
	%>

</body>
</html>