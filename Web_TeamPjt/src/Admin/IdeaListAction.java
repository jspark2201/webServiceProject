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

public class IdeaListAction implements Action {

	private int filter = -1;
	private String type = "writer";		// 검색 기준
	private String search = "";	// 검색어
	private String order = "id";	// 정렬 기준
	private int curPageNum = 1;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
				
		IdeaDAO ideaDAO = new IdeaDAO();

		/***** Parameter 값 가져오기 */
		try {
			if (request.getParameter("filter") != null)
				filter = Integer.parseInt(request.getParameter("filter"));
		} catch (Exception e) {
			filter = -1;
		}
				
		if (request.getParameter("type") != null)
			type = request.getParameter("type");

		if (request.getParameter("search") != null)
			search = request.getParameter("search");
		
		if (request.getParameter("order") != null)
			order = request.getParameter("order");

		try {
			if (request.getParameter("pageNum") != null)
				curPageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
			filter = -1;
		}

		
		/***** Parameter 값 검증 */
		
		// filter 값 검증
		if (filter < -1 || 5 < filter)
			filter = -1;
		
		// type 값 검증
		switch(type) {
			case "writer": case "title": case "state":
				break;
			default:
				type = "writer";
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
				order = "id";
		}

		// curPageNum 값 검증
		int pageCount = (ideaDAO.getDBCount(type, search, filter) - 1) / 10 + 1;
		
		if (curPageNum < 0)
			curPageNum = 1;
		else if (curPageNum > pageCount)
			curPageNum = pageCount;

		
		/***** request 보내기 */
		ArrayList<User> ideaList = ideaDAO.getDBList(type, search, filter, order, curPageNum);
		
		request.setAttribute("PageCount", pageCount);	// 페이지 수
		request.setAttribute("IdeaList", ideaList);		// 사용자 리스트

		// 입력받은 Parameter 반환
		request.setAttribute("filter", this.filter);
		request.setAttribute("type", this.type);
		request.setAttribute("search", this.search);
		request.setAttribute("order", this.order);
		request.setAttribute("curPageNum", this.curPageNum);
	}

}
