package Idea;

import java.sql.*;
import java.util.ArrayList;


public class IdeaDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	private void connect()
	{
		// 1. Driver �ε�
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		}
		catch (Exception e) {
			System.out.println("�ε� ����");
			return;
		}
		
		// 2. DB�� ����
		try {
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/developers", "root", "3819");

		}
		catch (Exception e) {
			System.out.println("���� ���� : " + e);
		}
	}
	
	private void disconnect()
	{
		if (pstmt != null) {
			try {
				pstmt.close();
			}
			catch(SQLException e) {
				System.out.println("?? ���� : " + e);
			}
		
		}
		
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				System.out.println("���� ���� ���� : " + e);
			}
		}
	}

	
	public boolean updateDB(Idea idea)
	{
		connect();
		
		String sql;
		
		try { // ���¿� ���� sql�� �޶��� ��.
			sql = "update idea set title=?, content=?, requirements=?,"
					+" number_participants=?, url=?, state=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idea.getTitle());
			pstmt.setString(2, idea.getContent());
			pstmt.setString(3, idea.getRequirements());
			pstmt.setInt(4, idea.getNumber_participants());
			pstmt.setString(5, idea.getUrl());
			pstmt.setInt(6, idea.getStateIdx());
			pstmt.setInt(7, idea.getId());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("updateDB ����");
			return false;
		}
		finally {
			disconnect();
		}

		return true;

	}
	
	
	public boolean deleteDB(int id)
	{
		connect();
		
		String sql = "delete from idea where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("deleteDB ����");
			return false;
		}
		finally {
			disconnect();
		}

		return true;

	}
	
	
	public Idea getDB(int id)
	{
		connect();
		
		String sql = "select * from idea where id=?";
		Idea idea = new Idea();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			idea.setId(rs.getInt("id"));
			idea.setWriter(rs.getString("writer"));
			idea.setTitle(rs.getString("title"));
			idea.setContent(rs.getString("content"));
			idea.setRequirements(rs.getString("requirements"));
			idea.setRegistration_date(rs.getString("registration_date"));
			idea.setComplete_date(rs.getString("complete_date"));
			idea.setNumber_participants(rs.getInt("number_participants"));
			idea.setUrl(rs.getString("url"));
			idea.setStateIdx(rs.getInt("state"));
			
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDB ����");
		}
		finally {
			disconnect();
		}
	
		return idea;
	}
	
	public ArrayList getDBTopList() {
		connect();
		
		String sql = "SELECT idea.id as id, writer, title, state, good_cnt, src AS image_src from idea" + 
				"    JOIN (select idea_id, COUNT(*) AS good_cnt from good" + 
				"          where registration_date > last_day(now() - interval 1 month)" + 
				"			 and registration_date <= last_day(now())" + 
				"          group by idea_id ORDER BY COUNT(*) desc) as tmp ON idea.id = tmp.idea_id" + 
				"    LEFT JOIN pictures ON idea.id = pictures.idea_id" +
				"    WHERE state < 3" +
				"    limit 5;";
		
		ArrayList<Idea> ideas = new ArrayList<Idea>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				Idea idea = new Idea();

				idea.setId(rs.getInt("id"));
				idea.setWriter(rs.getString("writer"));
				idea.setTitle(rs.getString("title"));
				idea.setStateIdx(rs.getInt("state"));
				idea.setGoodCount(rs.getInt("good_cnt"));
				idea.setImageSrc(rs.getString("image_src"));
				
				ideas.add(idea);
			}
			rs.close();
			
		}
		catch(SQLException e) {
			System.out.println("getDBTopList ����");
		}
		finally {
			disconnect();
		}
	
		
		return ideas;
	}
	
	public ArrayList getDBList()
	{
		connect();
		
		String sql = "SELECT idea.id, title, content, src AS image_src from idea" + 
				"    LEFT JOIN pictures ON idea.id = pictures.idea_id" + 
				"    WHERE state = 0" +
				"    ORDER BY registration_date DESC" + 
				"    LIMIT 3;";
		
		ArrayList<Idea> ideas = new ArrayList<Idea>();

		try {
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
	
			while(rs.next()) {
				Idea idea = new Idea();
	
				idea.setId(rs.getInt("id"));
				idea.setTitle(rs.getString("title"));
				idea.setContent(rs.getString("content"));
				idea.setImageSrc(rs.getString("image_src"));				
				ideas.add(idea);
			}
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDBList ����");
		}
		finally {
			disconnect();
		}

	return ideas;
	}
	

	public ArrayList getDBList (String type, String search, int filter, String order, int pageN)
	{
		connect();
		
		String sql = "select * from idea";
		
		if (search != null) {
			switch(type) {
				case "writer":
					sql += " where writer like ?";
					break;
				case "title":
					sql += " where title like ?";
					break;
			}
			
			search = '%' + search.trim() + '%';
		}
		
		if (search != null && filter != -1) {
			sql += " and state = ?";
		}
		else if (filter != -1) {
			sql += " where state = ?";
		}
		
		sql += " order by " + order;
		sql += " limit ?,?";
		
		ArrayList<Idea> ideas = new ArrayList<Idea>();

		try {
			pstmt = conn.prepareStatement(sql);

			if (search != null && filter != -1) {
				pstmt.setString(1,  search);
				pstmt.setInt(2, filter);
				pstmt.setInt(3, (pageN-1)*10);
				pstmt.setInt(4, 10);
			}
			else if (search != null) {
				pstmt.setString(1, search);
				pstmt.setInt(2, (pageN-1)*10);
				pstmt.setInt(3, 10);
			}
			else if (filter != -1) {
				pstmt.setInt(1, filter);			
				pstmt.setInt(2, (pageN-1)*10);
				pstmt.setInt(3, 10);
			}
			else {
				pstmt.setInt(1, (pageN-1)*10);
				pstmt.setInt(2, 10);
			}

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				Idea idea = new Idea();

				idea.setId(rs.getInt("id"));
				idea.setWriter(rs.getString("writer"));
				idea.setTitle(rs.getString("title"));
				idea.setContent(rs.getString("content"));
				idea.setRequirements(rs.getString("requirements"));
				idea.setRegistration_date(rs.getString("registration_date"));
				idea.setComplete_date(rs.getString("complete_date"));
				idea.setNumber_participants(rs.getInt("number_participants"));
				idea.setUrl(rs.getString("url"));
				idea.setStateIdx(rs.getInt("state"));
				
				ideas.add(idea);
			}
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDBList ����");
		}
		finally {
			disconnect();
		}
	
		return ideas;
	}
	
	public int getDBCount (String type, String search, int filter)
	{
		connect();
		
		String sql = "select count(*) as cnt from idea";
		
		if (search != null) {
			switch(type) {
				case "writer":
					sql += " where writer like ?";
					break;
				case "title":
					sql += " where title like ?";
					break;
			}
			
			search = '%' + search.trim() + '%';
		}
		
		if (search != null && filter != -1) {
			sql += " and state = ?";
		}
		else if (filter != -1) {
			sql += " where state = ?";
		}
		
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			if (search != null && filter != -1) {
				pstmt.setString(1,  search);
				pstmt.setInt(2, filter);
			}
			else if (search != null)
				pstmt.setString(1, search);
			else if (filter != -1)
				pstmt.setInt(1, filter);
			

			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("cnt");
		}
		catch(SQLException e) {
			System.out.println("getDBCount ����");
			return -1;
		}
		
		return count;
	}

	
	
	public int getDBCount (int stateIdx)
	{
		connect();
		
		String sql = "select count(*) as cnt from idea";
		
		sql += " where state = ?";
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stateIdx);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("cnt");
		}
		catch(SQLException e) {
			System.out.println("getDBCount ����");
			return -1;
		}
		
		return count;
	}
}
