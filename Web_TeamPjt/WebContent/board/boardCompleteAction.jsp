<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���߿Ϸ� ��ư</title>
</head>
<body>
	<%
		if (request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath() + "/board/boardList.jsp");
	} else {
		int Id = Integer.parseInt(request.getParameter("boardNo"));//�۹�ȣ
		Board board = new Board();
		board.setId(Id);

		BoardDao boardDao = new BoardDao();
			
		if (boardDao.updateCompleteline(board) == 1) {
			boardDao.updateCompletedate(board);
			response.sendRedirect(request.getContextPath() + "/board/boardView.jsp?boardNo=" + Id);
		} else {
			response.sendRedirect(request.getContextPath() + "/board/boardList.jsp?boardNo=" + Id);
		}
	}
	%>


</body>
</html> --%>