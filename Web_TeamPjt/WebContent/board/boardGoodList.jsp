<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="service.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> idea list</h1>
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
BoardDao boardDao = new BoardDao();
int totalRowCount = boardDao.selectTotalBoardCount();
int pagePerRow = 4; 
int beginRow = (currentPage-1)*pagePerRow;
List<Board> list = boardDao.selectBoardListPerPage(beginRow, pagePerRow);
%>
	<div>
	   <a href="<%=request.getContextPath()%>/board/boardRecruitList.jsp">모집중</a>
	   <a href="<%=request.getContextPath()%>/board/boardCompleteList.jsp">완료된</a>
    </div>
    
    <div>
	   <a href="<%=request.getContextPath()%>/board/boardList.jsp">등록일순으로 보기</a>
    </div>

  <FORM name='search' method='post' action='<%=request.getContextPath()%>/board/boardSearchAction.jsp'>
    <ASIDE style='float: right;'>
      <input type='text' name='search' placeholder="특수문자는 사용할수 없습니다.">
      <button type='submit'>검색</button>    
    </ASIDE> 
  </FORM>
  
    <div>
     <form action = "result.jsp">
    <label for = "platform">플랫폼 : </label>
        <input type = "radio" name = "platform" value = "web">web
        <input type = "radio" name = "platform" value = "android">android
        <input type = "radio" name = "platform" value = "embeded">embeded
		<input type = "radio" name = "platform" value = "ios">iso
    </div>
    <div>
    <label for = "genre">장르 : </label>
        <input type = "radio" name = "genre" value = "health">health
        <input type = "radio" name = "genre" value = "psychology">psychology
        <input type = "radio" name = "genre" value = "game">game
    </div>
	
    </form>

    <div>전체행의 수 : <%=totalRowCount%>/<%=list.size()%></div>
    <table border="1">
        <thead>
            <tr>
            	<th>Id</th>
                <th>제목</th>
                <th>작가</th>
                <th>등록일</th>
                <th>상태</th>
                <th>사진</th>
            </tr>
        </thead>
        <tbody>
<%
            for(Board b : list) {
%>
                <tr>
                	<td><%=b.getId()%></td>
                    <td><a href="<%=request.getContextPath()%>/board/boardView.jsp?boardNo=<%=b.getId()%>"><%=b.getTitle()%></a></td>
                    <td><%=b.getWriter()%></td>
                    <td><%=b.getRegistration_date()%></td>
               		<td><%=b.getState()%></td>
               		<td><img src="<%=b.getSrc()%>" style="width: 100px; height: 75px;"></td>
               		<td><%=b.getSrc()%></td>
                </tr>
<%        
            }
%>
        </tbody>
    </table>
 
    <div>
        <a href="<%=request.getContextPath()%>/board/boardAddForm.jsp">작성하기</a>
    </div>
<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
    <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage < lastPage) {
%>
 
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
    </div>

</body>
</html>