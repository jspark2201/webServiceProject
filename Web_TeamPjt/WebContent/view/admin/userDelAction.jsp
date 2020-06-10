<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Web_TeamPjt.User"%>
<%@ page import="Web_TeamPjt.UserDAO"%>
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
	
			UserDAO userDAO = new UserDAO();
			
			for (int i=0; i<idArray.length; i++) {
				if (idArray[i] != null) {
					userDAO.deleteDB(idArray[i]);
				}
			}
		}
		
	%>
</body>
</html>