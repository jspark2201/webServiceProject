package Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.*;
import Idea.*;

public class IdeaDeleteAction implements Action {

	private int filter = -1;
	private String type = "writer";		// 검색 기준
	private String search = "";	// 검색어
	private String order = "id";	// 정렬 기준
	private int curPageNum = 1;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String idArray[] = request.getParameterValues("idArray[]");
		
		if (idArray != null) {
	
			IdeaDAO ideaDAO = new IdeaDAO();
			
			for (int i=0; i<idArray.length; i++) {
				System.out.println(idArray[i]);
				if (idArray[i] != null) {
					ideaDAO.deleteDB(Integer.parseInt(idArray[i]));
				}
			}
			System.out.println(idArray.length);
		}
	}

}
