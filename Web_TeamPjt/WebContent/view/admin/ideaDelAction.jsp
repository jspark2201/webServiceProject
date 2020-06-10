<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Idea.Idea"%>
<%@ page import="Idea.IdeaDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String idArray[] = request.getParameterValues("idArray[]");
	
		if (idArray != null) {
	
			IdeaDAO ideaDAO = new IdeaDAO();
			
			for (int i=0; i<idArray.length; i++) {
				if (idArray[i] != null) {
					ideaDAO.deleteDB(Integer.parseInt(idArray[i]));
				}
			}
			System.out.println(idArray.length);
		}
		
	%>
</body>
</html>