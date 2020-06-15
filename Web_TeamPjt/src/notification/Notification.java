package notification;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Notification")
public class Notification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
	
//		PrintWriter out = response.getWriter();
//	
//		String data = request.getParameter("data");		
//		out.println("<p>"+data+"</p>");
//		
//		
//		
//		out.close();
//		
//		
		String data = request.getParameter("data");		


		

		
//		if(data.equals("link")) {
//		String data = request.getParameter("data");	
		
//			request.setAttribute("dataobject", data); //객체를 request객체에 담음 (data가 문자열이 아니어도 가능)
//			
//			RequestDispatcher dispatcher = request.getRequestDispatcher(data);
//			
//			dispatcher.forward(request, response);
//		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
