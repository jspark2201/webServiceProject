<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getParameter("commentNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int Id = Integer.parseInt(request.getParameter("commentNo"));
    System.out.println("commentNo :"+Id);
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    Board board = new Board();
    board.setId(Id);
    
    
    BoardDao boardDao = new BoardDao();
    boardDao.deleteComment(Id);


    
    if(boardDao.deleteComment(Id)==1){
        response.sendRedirect(request.getContextPath()+"/board/boardList.jsp?boardNo="+boardNo);
    } else {
        response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
    }
}
%>
</body>
</html>