<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deadline action</title>
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
    //똑같은 사용자가 똑같은 아이디어에 좋아요 누를 수 없음
    if(boardDao.updateDeadline(board)==1){
        response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+Id);
    } else {
        response.sendRedirect(request.getContextPath()+"/board/boardList.jsp?boardNo="+Id);
    }
}
%>
</body>
</html>