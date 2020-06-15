package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.*;
import Idea.*;

public class MainAction implements Action {
       
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO userDAO = new UserDAO();
		IdeaDAO ideaDAO = new IdeaDAO();
		
		int userCount[] = new int[3];
		int ideaCount[] = new int[4];
		
		for (int i=0; i<3; i++)  {
			userCount[i] = userDAO.getDBCount(i);
			System.out.println(userCount[i]);
		}

		for (int i=0; i<4; i++)
			ideaCount[i] = ideaDAO.getDBCount(i+1);
		
		request.setAttribute("UserCount", userCount);
		request.setAttribute("IdeaCount", ideaCount);
	}

}
