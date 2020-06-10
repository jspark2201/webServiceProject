package user;

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

@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if (action == null || action.equals("list")) {
			address = "view/index.jsp";
		} else if (action.equals("view")) {
			UserBean event = dao.getEvent(request.getParameter("id"));
			request.setAttribute("event", event);
			address = "eventview_view.jsp";
		} else if (action.contentEquals("add")) {
			UserBean event = new UserBean();
			event.setId((request.getParameter("id")));
			event.setPwd(request.getParameter("pwd"));
			event.setNickname(request.getParameter("nickname"));
			event.setEmail(request.getParameter("email"));
			event.setNumber(request.getParameter("number"));
			if (event.getId() == "" || event.getPwd() == "" || event.getNickname() == "" || event.getEmail() == ""
					|| event.getNumber() == "") {
				address = "addid_fail.jsp";
				request.setAttribute("flag", "1");
			} else {
				if (dao.addid(event) == 1) {
					request.setAttribute("event", event);
					address = "eventview_add.jsp";
				} else {
					address = "addid_fail.jsp";
					request.setAttribute("flag", "2");
				}
			}
		} else if (action.equals("checkid")) {
			UserBean event = new UserBean();
			event.setId((request.getParameter("id")));
			event.setPwd(request.getParameter("pwd"));
			if (dao.authenticate(event)) {
				address = "main.jsp";
				request.setAttribute("userinfo", event);
				HttpSession session = request.getSession();
				session.setAttribute("userid", event.getId());
			} else {
				address = "view/login_fail.jsp";
				request.setAttribute("userinfo", event);
			}
		}else if(action.equals("googleid")) {
			address="login_success.jsp";
		}
		response.sendRedirect(address);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
