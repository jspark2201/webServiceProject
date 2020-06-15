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

@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		/*
		 * ACTION :
		 * list : 
		 * checkID: 로그인
		 * view : 
		 * add :
		 * 
		 * */
		
		if (action == null || action.equals("list")) {
			address = "view/index.jsp";
		} else if (action.equals("view")) {
			//System.out.println(request.getParameter("id"));
			User event = dao.getDB(request.getParameter("id"));
			request.setAttribute("event", event);
			address = "view/viewview.jsp";
		} else if (action.equals("add")) {
			User event = new User();
			event.setId((request.getParameter("id")));
			event.setPwd(request.getParameter("pwd"));
			event.setNickname(request.getParameter("nickname"));
			event.setEmail(request.getParameter("email"));
			event.setNumber(request.getParameter("number"));
			event.setPlatform(request.getParameter("interest"));
			event.setGenre(request.getParameter("interest1"));
			
			if (event.getId() == "" || event.getPwd() == "" || event.getNickname() == "" || event.getEmail() == ""
					|| event.getNumber() == "") {
				address = "view/joinAction.jsp";
				request.setAttribute("flag", "1");
			} else {
				if (dao.insertDB(event)) {
					session.setAttribute("userid", event.getId());
					address = "view/main.jsp";
				} else {
					address = "view/joinAction2.jsp";
					request.setAttribute("flag", "2");
				}
			}

		} else if (action.equals("checkid")) {
			User event = new User();
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			
			event=dao.getDB(request.getParameter("id"));
			if(event.getId()==null) {
				address="view/login_fail.jsp";
			}
			else {
				if(event.getPwd().equals(pwd)) {
					address="view/main.jsp";
					session.setAttribute("userID", event.getId());
				}
				else {
					address="view/index.jsp";
				}
			}
		} else if (action.equals("logout")) {
			address = "view/logout.jsp";
		}else if (action.equals("mypage")) {
			address = "view/mypage.jsp";
		}else if (action.equals("modify")) {
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
