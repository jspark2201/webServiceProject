package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.UserDAO;
import User.UserDTO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/Login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		String ID = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(ID);
		
		UserDTO user = new UserDTO();
		user.setId(ID);
		user.setPwd(pwd);
		
		UserDAO dao = UserDAO.getInstance();
		
		boolean authened = dao.authenticate(user);
		System.out.println(authened);
		
		HttpSession session = request.getSession();
		
		if(authened) {
			user = dao.getDB(ID);
			session.setAttribute("USER", user);
			System.out.println(user.getDate());
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/main.jsp"); 
	        dispatcher.forward(request, response); 
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/index.jsp"); 
	        dispatcher.forward(request, response); 
		}
		
		
	}

}

/*
else if (action.equals("checkid")) {
	UserBean event = new UserBean();
	event.setId((request.getParameter("id")));
	event.setPwd(request.getParameter("pwd"));
	
	if (dao.authenticate(event)) {
		address = "view/main.jsp";
		request.setAttribute("userinfo", event);
		HttpSession session = request.getSession();
		session.setAttribute("userid", event.getId());
	} else {
		address = "view/login_fail.jsp";
		request.setAttribute("userinfo", event);
	}
}
*/
























