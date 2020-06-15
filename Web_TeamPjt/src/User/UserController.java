package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		String viewPage = null;
		SHA sha = new SHA();

		UserDAO dao = new UserDAO();

		HttpSession session = request.getSession();

		if (com.contentEquals("/user"))
			viewPage = "/view/index.jsp";

		else if (com.contentEquals("/user/login")) {
			User event = new User();
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			try {
				pwd = sha.sha256(pwd);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			event = dao.getDB(request.getParameter("id"));
			if (event.getId() == null) {
				viewPage = "/view/user/login_fail.jsp";
			} else {
				if ((event.getPwd()).equals(pwd)) {
					session.setAttribute("user", event); 
					session.setAttribute("userID", event.getId());
					viewPage = "/view/user/login_success.jsp";
				} else {
					viewPage = "/view/user/login_fail.jsp";
				}
			}
			System.out.println(viewPage);
		}

		else if (com.contentEquals("/user/logout"))
			viewPage = "/view/user/logout.jsp";

		else if (com.contentEquals("/user/register"))
			viewPage = "/view/user/join.jsp";

		else if (com.contentEquals("/user/register2")) {
			User event = new User();
			event.setId((request.getParameter("id")));
			event.setPwd(request.getParameter("pwd"));

			try {
				event.setPwd(sha.sha256(request.getParameter("pwd")));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			event.setNickname(request.getParameter("nickname"));
			event.setEmail(request.getParameter("email"));
			event.setNumber(request.getParameter("number"));
			event.setPlatform(request.getParameter("interest"));
			event.setGenre(request.getParameter("interest1"));

			if (event.getId() == "" || event.getPwd() == "" || event.getNickname() == "" || event.getEmail() == ""
					|| event.getNumber() == "") {
				viewPage = "/view/user/joinAction.jsp";

			} else {
				if (dao.insertDB(event)) {
					session.setAttribute("user", event); 
					session.setAttribute("userID", event.getId());
					viewPage = "/view/main.jsp";
				} else {
					viewPage = "/view/user/joinAction2.jsp";
			
				}
			}

		}

		else if (com.contentEquals("/user/update")) {

			User event = (User) session.getAttribute("user");
			event.setNickname(request.getParameter("nickname"));
			event.setEmail(request.getParameter("email"));
			event.setNumber(request.getParameter("number"));
			event.setPlatform(request.getParameter("interest"));
			event.setGenre(request.getParameter("interest1"));

			if (dao.updateDB(event)) {
				viewPage = "view/mypage/mypage.jsp";
			} else
				viewPage = "view/user/login_fail.jsp";
		}
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
