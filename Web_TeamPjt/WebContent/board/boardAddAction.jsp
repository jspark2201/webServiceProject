<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add action</title>
</head>
<body>

<%

	Board board = new Board();

	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";
	String savefile = "upload";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);

	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	 
	String Title = multi.getParameter("title");
	System.out.println(Title);
	String []platform = multi.getParameterValues("interest_1");
	System.out.println(platform.length);
	if(platform.length==1){
		if(platform[0].equals("web")){
			board.setWeb(true);
			board.setAndroid(false);
			board.setEmbeded(false);
			board.setIos(false);
		}
		else if(platform[0].equals("android")){
			board.setWeb(false);
			board.setAndroid(true);
			board.setEmbeded(false);
			board.setIos(false);
		}
		else if(platform[0].equals("embeded")){
			board.setWeb(false);
			board.setAndroid(false);
			board.setEmbeded(true);
			board.setIos(false);
		}
		else{
			board.setWeb(false);
			board.setAndroid(false);
			board.setEmbeded(false);
			board.setIos(true);
		}
		
	}

	
	String []genre = multi.getParameterValues("interest_2");

	if(genre.length==1){
		if(genre[0].equals("health")){
			board.setHealth(true);
			board.setPsychology(false);
			board.setGame(false);
		}
		else if(genre[0].equals("psychology")){
			board.setHealth(false);
			board.setPsychology(true);
			board.setGame(false);
		}
		else if(genre[0].equals("game")){
			board.setHealth(false);
			board.setPsychology(false);
			board.setGame(true);
		}
	}

	String Content = multi.getParameter("content");
	System.out.println(Content);
	
	try{
		 Enumeration<?> files = multi.getFileNames();
		 String file1 = (String)files.nextElement();
		 filename1 = multi.getFilesystemName(file1);
		} catch(Exception e) {
	    e.printStackTrace();
	  }

	String Src = realFolder + "\\" + filename1;
	System.out.println(Src);

	String Requirements = multi.getParameter("requirements");
	System.out.println(Requirements);
	
	board.setTitle(Title);
	board.setContent(Content);
	board.setSrc(Src);
	board.setRequirements(Requirements);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	int rowCount = boardDao.maxBoard();
	System.out.println(rowCount);
	
	board.setRow(rowCount);
	boardDao.insertPicturesBoard(board);
	boardDao.insertTypeBoard(board);

	
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>
</body>
</html>