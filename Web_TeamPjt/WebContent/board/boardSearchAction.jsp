<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search action</title>
</head>
<body>

<%
if(request.getParameter("search") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    String Search = request.getParameter("search");
    System.out.println("검색어 :"+Search);
   
    Board board = new Board();
    board.setSearch(Search);
    
    BoardDao boardDao = new BoardDao();
    boardDao.selectTotalSearchBoardCount(Search);

	
    response.sendRedirect(request.getContextPath()+"/board/boardSearchList.jsp?Search="+Search);
  
}
%>
</body>
</html>