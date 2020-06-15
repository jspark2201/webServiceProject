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
	private String type = "writer";		// �˻� ����
	private String search = "";	// �˻���
	private String order = "registration_date";	// ���� ����
	private int curPageNum = 1;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
				
		IdeaDAO ideaDAO = new IdeaDAO();

		/***** Parameter �� �������� */
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

		
		/***** Parameter �� ���� */
		
		// filter �� ����
		if (filter < -1 || 5 < filter)
			filter = -1;
		
		// type �� ����
		switch(type) {
			case "writer": case "title": case "state":
				break;
			default:
				type = "writer";
		}
		
		// search �� ����
		if (search.trim().equals(""))
			search = null;
		
		// order �� ����
		switch(order) {
			case "id": case "registration_date":
			case "writer": case "title": case "state":
				break;
			default:
				order = "registration_date";
		}

		// curPageNum �� ����
		int pageCount = (ideaDAO.getDBCount(type, search, filter) - 1) / 10 + 1;
		
		if (curPageNum < 0)
			curPageNum = 1;
		else if (curPageNum > pageCount)
			curPageNum = pageCount;

		
		/***** request ������ */
		ArrayList<UserDTO> ideaList = ideaDAO.getDBList(type, search, filter, order, curPageNum);
		
		request.setAttribute("PageCount", pageCount);	// ������ ��
		request.setAttribute("IdeaList", ideaList);		// ����� ����Ʈ

		// �Է¹��� Parameter ��ȯ
		request.setAttribute("filter", this.filter);
		request.setAttribute("type", this.type);
		request.setAttribute("search", this.search);
		request.setAttribute("order", this.order);
		request.setAttribute("curPageNum", this.curPageNum);
	}

}
