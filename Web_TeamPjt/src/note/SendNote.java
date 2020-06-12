package note;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendNote")
public class SendNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		 PrintWriter writer = response.getWriter();
//		 writer.println("sdasd");

			  NoteDAO dao = new NoteDAO();
		      String address = null;
		      request.setCharacterEncoding("utf-8");
		      String action = request.getParameter("action");
		      
	
		      
		      if(action == null || action.equals("send")) {
		    	  	      address = "/view/detail.jsp"; 
		      }
		      
		      
		      
		      
//		      if (action == null || action.equals("list")) {
//		         address = "view/index.jsp";
//		      } else if (action.equals("view")) {
//		         //System.out.println(request.getParameter("id"));
//		         UserBean event = dao.getEvent(request.getParameter("id"));
//		         request.setAttribute("event", event);
//		         address = "view/viewview.jsp";
//		      } else if (action.equals("add")) {
//		         UserBean event = new UserBean();
//		         event.setId((request.getParameter("id")));
//		         event.setPwd(request.getParameter("pwd"));
//		         event.setNickname(request.getParameter("nickname"));
//		         event.setEmail(request.getParameter("email"));
//		         event.setNumber(request.getParameter("number"));
//
//		         if (event.getId() == "" || event.getPwd() == "" || event.getNickname() == "" || event.getEmail() == ""
//		               || event.getNumber() == "") {
//		            address = "view/joinAction.jsp";
//		            request.setAttribute("flag", "1");
//		         } else {
//		            if (dao.addid(event) == 1) {
//		               request.setAttribute("event", event);
//		               address = "view/main.jsp";
//		            } else {
//		               address = "view/joinAction2.jsp";
//		               request.setAttribute("flag", "2");
//		            }
//		         }
//
//		      } else if (action.equals("checkid")) {
//		         UserBean event = new UserBean();
//		         event.setId((request.getParameter("id")));
//		         event.setPwd(request.getParameter("pwd"));
//		         
//		         if (dao.authenticate(event)) {
//		            address = "view/main.jsp";
//		            request.setAttribute("userinfo", event);
//		            HttpSession session = request.getSession();
//		            session.setAttribute("userid", event.getId());
//		         } else {
//		            address = "view/login_fail.jsp";
//		            request.setAttribute("userinfo", event);
//		         }
//		      } else if (action.equals("logout")) {
//		         address = "view/logout.jsp";
//		      }else if (action.equals("mypage")) {
//		         address = "view/mypage.jsp";
//		      }
		      
		      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		      dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
