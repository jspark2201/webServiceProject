<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contact action</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int Id = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+Id);
    Board board = new Board();
    board.setId(Id);
    
    
    BoardDao boardDao = new BoardDao();
    int n= boardDao.participantsCount(Id);
    
    
    System.out.println("참가자수 :" + n);
    board.setParticipants_num(n);
    
    boardDao.UpdateParticipantsNum(board);
    if(boardDao.InsertParticipants(board)==1){
        response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+Id);
    } else {
        response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+Id);
    }
}
%>


</body>
</html>