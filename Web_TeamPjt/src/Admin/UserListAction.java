package Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.*;
import Idea.*;

public class UserListAction implements Action {

	private String type = "id";		// 검색 기준
	private String search = "";	// 검색어
	private String order = "date";	// 정렬 기준
	private int curPageNum = 1;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
				
		UserDAO userDAO = new UserDAO();

		/***** Parameter 값 가져오기 */
		if (request.getParameter("type") != null)
			type = request.getParameter("type");

		if (request.getParameter("search") != null)
			search = request.getParameter("search");
		
		if (request.getParameter("order") != null)
			order = request.getParameter("order");

		if (request.getParameter("pageNum") != null)
			curPageNum = Integer.parseInt(request.getParameter("pageNum"));

		
		/***** Parameter 값 검증 */
		
		// type 값 검증
		switch(type) {
			case "id": case "nickname": case "email":
				break;
			default:
				type = "id";
		}
		
		// search 값 검증
		if (search.trim().equals(""))
			search = null;
		
		// order 값 검증
		switch(order) {
			case "id": case "nickname":
			case "email": case "date":
				break;
			default:
				order = "date";
		}

		// curPageNum 값 검증
		int pageCount = (userDAO.getDBCount(type, search) - 1) / 10 + 1;
		
		if (curPageNum < 0)
			curPageNum = 1;
		else if (curPageNum > pageCount)
			curPageNum = pageCount;

		
		/***** request 보내기 */
		ArrayList<User> userList = userDAO.getDBList(type, search, order, curPageNum);
		
		
		request.setAttribute("PageCount", pageCount);	// 페이지 수
		request.setAttribute("UserList", userList);		// 사용자 리스트

		// 입력받은 Parameter 반환
		request.setAttribute("type", this.type);
		request.setAttribute("search", this.search);
		request.setAttribute("order", this.order);
		request.setAttribute("curPageNum", this.curPageNum);

	}

}
