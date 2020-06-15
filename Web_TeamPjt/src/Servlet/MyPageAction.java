package Servlet;
// 마이 페이지로 가기 버튼을 눌렀을때의 서블릿 입니다.
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.UserDTO;

/**
 * Servlet implementation class MyPageAction
 */
@WebServlet("/mypage.do")
public class MyPageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageAction() {
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
	}
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		System.out.println("mypageActionSERVICE");
		HttpSession session = request.getSession();
		UserDTO user = new UserDTO();
		user = (UserDTO) session.getAttribute("USER");
		
		System.out.println(user.getEmail());
		System.out.println(user.getDate());
		//doGet(request, response);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/myPage.jsp"); 
        dispatcher.forward(request, response); 
	}
}
















