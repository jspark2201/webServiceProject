<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명단 관리</title>
</head>
<body>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    
    BoardDao boardDao = new BoardDao();
    List<Board> list = boardDao.SelectParticipantsBoard(boardNo);
    List<Board> tlist = boardDao.SelectTempParticipantsBoard(boardNo);
 
%>
		<div>명단관리</div>
        <table border="1">
        <div>신청 개발자</div>
        <thead>
            <tr>
            	<th>아이디</th>
            	<th>닉네임</th>
            	<th>신청일</th>
                <th>타입</th>
                
            </tr>
        </thead>

        <tbody>
<%
            for(Board participant : tlist) {
%>
                <tr>
                    <td><%=participant.getId2()%></td>
                    <td><%=participant.getNickname()%></td>
                    <td><%=participant.getRegistration_date()%></td>
               		<td><%=participant.getType()%></td>
     
                </tr>
<%        	
            }
%>
 			        <div>참여 개발자</div>
        <tbody>
<%
            for(Board participant : list) {
%>
                <tr>
                    <td><%=participant.getId2()%></td>
                    <td><%=participant.getNickname()%></td>
                    <td><%=participant.getRegistration_date()%></td>
               		<td><%=participant.getType()%></td>
     
                </tr>
<%        	
            }
%>
        </tbody>
        
        
<%
} 
%>
</body>
</html>