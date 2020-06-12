<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정폼</title>
</head>
<body>

<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    
    BoardDao boardDao = new BoardDao();
    
	System.out.println("modify form"+boardNo);
    Board board = boardDao.selectBoardByKey(boardNo);
    board.setId(boardNo);
    List<Board> mlist = boardDao.selectComments(boardNo);
    int cnt=mlist.size();
 
%>


    <div>Title : </div>
    <div><textarea name="title" id="title"  rows="5" cols="50"><%=board.getTitle()%></textarea></div>
    <div><label for = "platform">플랫폼 : </label>
        <input type = "checkbox" name = "platform" value = "web">web
        <input type = "checkbox" name = "platform" value = "android">android
        <input type = "checkbox" name = "platform" value = "embeded">embeded
		<input type = "checkbox" name = "platform" value = "ios">ios
    </div>
    <div>
    <label for = "genre">장르 : </label>
        <input type = "checkbox" name = "genre" value = "health">health
        <input type = "checkbox" name = "genre" value = "psychology">psychology
        <input type = "checkbox" name = "genre" value = "game">game
    </div>
    
    	<p><%=board.isWeb()%></p>
	  	<p><%=board.isAndroid()%></p>
	    <p><%=board.isEmbeded()%></p>
	    <p><%=board.isIos()%></p>
	    <p><%=board.isHealth()%></p>
	    <p><%=board.isPsychology()%></p>
	    <p><%=board.isGame()%></p>
    <div>boardContent : </div>
    <div><textarea name="content" id="content" rows="5" cols="50"><%=board.getContent()%></textarea></div>
    <div><input type="file" name="filename1" size=40></div>
    
    <div>requirements : </div>
    <div><textarea name="requirements" id="requirements"  rows="5" cols="50"><%=board.getRequirements()%></textarea></div>
	
	<form action="<%=request.getContextPath()%>/board/boardModifyAction.jsp" method="post"  enctype="multipart/form-data">
    <div>
	<input type="submit" value="글 수정" name="boardNo" value=<%=board.getId()%> type="hidden"/>
    </div>
	</FORM>

<%
        }
%>

</body>
</html>