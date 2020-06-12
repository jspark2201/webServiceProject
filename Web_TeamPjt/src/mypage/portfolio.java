package mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class portfolio
 */
@WebServlet("/portfolio")
public class portfolio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public portfolio() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageNumber = 1; //기본 페이지 넘버
		// TODO Auto-generated method stub
		DBEventDAO bbsDAO = new DBEventDAO();
		String userID = "admin3";
				//(String) request.getAttribute("userID");
		if (request.getParameter("pageNumber") != null) {

			pageNumber = (int) request.getAttribute("pageNumber");
		}
		ArrayList<PortfolioBean> list = bbsDAO.getList(userID, pageNumber);
		request.setAttribute("Plist", list);
		int totalPage = bbsDAO.totalPage(userID);
		
		boolean isNext = bbsDAO.nextPage(userID, pageNumber);
		
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("isNext",isNext);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./mypage.jsp");
		dispatcher.forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
