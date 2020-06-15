package mypage;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.User;
import User.UserDAO;


@WebServlet("/mypage/*")
public class MypageController extends HttpServlet {
       
    public MypageController() {
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
		
		UserDAO userDAO = new UserDAO();

		if (com.contentEquals("/mypage")) {
			User event = userDAO.getDB(request.getParameter("id")); 
			request.setAttribute("event", event); 
			viewPage = "/view/mypage/myPage.jsp";
		}
		
		else if(com.contentEquals("/mypage/portfolio_view"))
			viewPage = "/view/mypage/portfolioView.jsp";

		else if(com.contentEquals("/mypage/portfolio_write"))
			viewPage = "/view/mypage/portfolio_write_action.jsp";
		
		else if(com.contentEquals("/mypage/portfolio_update"))
			viewPage = "/view/mypage/portfolio_update.jsp";
		
		else if(com.contentEquals("/mypage/portfolio_update_action"))
			viewPage = "/view/mypage/portfolio_update_action.jsp";
		
		else if(com.contentEquals("/mypage/portfolio_delete"))
			viewPage = "/view/mypage/portfolio_delete_action.jsp";
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
