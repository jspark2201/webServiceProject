<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board comment action</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null || request.getParameter("comment") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+boardNo);
    String comment = request.getParameter("comment");
    System.out.println("댓글 :"+comment);
    Board board = new Board();
    board.setId(boardNo);
    board.setContent2(comment);
    
    
    BoardDao boardDao = new BoardDao();
    
    if(boardDao.InsertComment(board)==1){
        response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
    } else {
        response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
    }
}
%>

</body>
</html>