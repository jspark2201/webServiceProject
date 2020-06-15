package note;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
//		PrintWriter out = response.getWriter();
//		
//		out.println("<p>"+action+"</p>");
//		
//	
//		out.close();

		
		String address = null;
		String action = request.getParameter("action");		
		
		if(action.equals("send")) {
			NoteDAO dao = new NoteDAO();
			
			String giveID = request.getParameter("");
			String receiveID = request.getParameter("noteRecevieID");
			String receiveEmail = request.getParameter("");
			String sendTitle = request.getParameter("sendTitle");
			String sendContent = request.getParameter("sendContent");
			
			out.println("<p>"+sendContent+"</p>");
	
			int row = dao.getNext();
			
			out.println("<p>"+row+"</p>");
			
			dao.sendNote(receiveID, "jspark", "jspark@gmail.com", sendTitle, sendContent);
			request.setAttribute("dataobject", action); 
			
			address = "/view/myPage.jsp";
			
			response.sendRedirect(request.getContextPath() + address);
			
		} else if(action.equals("send2")){
			String boardNo=request.getParameter("boardNo");
			String participantsId =request.getParameter("participantsId");
			String userId = request.getParameter("id");
			String mail= request.getParameter("mail");
			String title = request.getParameter("title");			
			NoteDAO dao = new NoteDAO();
			
			dao.sendNote2(participantsId, userId, mail, title);
			address="/board/boardView.jsp?boardNo="+boardNo;
			response.sendRedirect(request.getContextPath() + address);
		}
		
		else {

			out.println("<p>"+action+"</p>");
			
		
			out.close();
		}
		

//		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
//
//		dispatcher.forward(request, response);

		      
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
		      
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
