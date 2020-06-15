package Admin;

import User.*;
import Idea.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		String viewPage = null;
		Action action = null;

		if(com.contentEquals("/admin/main.do")) {
			action = new MainAction();
			action.execute(request,  response);
			viewPage = "/view/admin/index.jsp";
		}
		
		else if (com.contentEquals("/admin/users.do")) {
			action = new UserListAction();
			action.execute(request,  response);
			viewPage = "/view/admin/users.jsp";
		}
		else if (com.contentEquals("/admin/userDelete.do")) {
			action = new UserDeleteAction();
			action.execute(request, response);
			viewPage = "/view/admin/blank.html";
		}
		
		else if (com.contentEquals("/admin/ideas.do")) {
			action = new IdeaListAction();
			action.execute(request,  response);
			viewPage = "/view/admin/ideas.jsp";
		}
		else if (com.contentEquals("/admin/ideaDelete.do")) {
			action = new IdeaDeleteAction();
			action.execute(request,  response);
			viewPage = "/view/admin/blank.html";
		}

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
