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

public class UserDeleteAction implements Action {

	private int filter = -1;
	private String type = "writer";		// 검색 기준
	private String search = "";	// 검색어
	private String order = "id";	// 정렬 기준
	private int curPageNum = 1;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String idArray[] = request.getParameterValues("idArray[]");

		if (idArray != null) {
	
			UserDAO userDAO = new UserDAO();
			
			for (int i=0; i<idArray.length; i++) {
				if (idArray[i] != null) {
					userDAO.deleteDB(idArray[i]);
				}
			}
		}
	}

}
