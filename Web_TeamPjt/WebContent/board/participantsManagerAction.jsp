<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>participants manager action</title>
</head>
<body>
<%

    int Id = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+Id);
    Board board = new Board();
    board.setId(Id);
    
    response.sendRedirect(request.getContextPath()+"/board/participantsForm.jsp?boardNo="+Id);


%>
</body>
</html>