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

	private String type = "id";		// �˻� ����
	private String search = "";	// �˻���
	private String order = "date";	// ���� ����
	private int curPageNum = 1;
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserDAO userDAO = new UserDAO();

		/***** Parameter �� �������� */
		if (request.getParameter("type") != null)
			type = request.getParameter("type");

		if (request.getParameter("search") != null)
			search = request.getParameter("search");
		
		if (request.getParameter("order") != null)
			order = request.getParameter("order");

		if (request.getParameter("pageNum") != null)
			curPageNum = Integer.parseInt(request.getParameter("pageNum"));

		
		/***** Parameter �� ���� */
		
		// type �� ����
		switch(type) {
			case "id": case "nickname": case "email":
				break;
			default:
				type = "id";
		}
		
		// search �� ����
		if (search.trim().equals(""))
			search = null;
		
		// order �� ����
		switch(order) {
			case "id": case "nickname":
			case "email": case "date":
				break;
			default:
				order = "date";
		}

		// curPageNum �� ����
		int pageCount = (userDAO.getDBCount(type, search) - 1) / 10 + 1;
		
		if (curPageNum < 0)
			curPageNum = 1;
		else if (curPageNum > pageCount)
			curPageNum = pageCount;

		
		/***** request ������ */
		ArrayList<UserDTO> userList = userDAO.getDBList(type, search, order, curPageNum);
		
		
		request.setAttribute("PageCount", pageCount);	// ������ ��
		request.setAttribute("UserList", userList);		// ����� ����Ʈ

		// �Է¹��� Parameter ��ȯ
		request.setAttribute("type", this.type);
		request.setAttribute("search", this.search);
		request.setAttribute("order", this.order);
		request.setAttribute("curPageNum", this.curPageNum);

	}

}
