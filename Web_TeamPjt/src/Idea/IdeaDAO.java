package Idea;

import java.sql.*;
import java.util.ArrayList;


public class IdeaDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	private void connect()
	{
		// 1. Driver 로딩
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		}
		catch (Exception e) {
			System.out.println("로딩 실패");
			return;
		}
		
		// 2. DB와 연결
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/developers", "root", "qwe123!@#");

		}
		catch (Exception e) {
			System.out.println("연결 실패 : " + e);
		}
	}
	
	private void disconnect()
	{
		if (pstmt != null) {
			try {
				pstmt.close();
			}
			catch(SQLException e) {
				System.out.println("?? 실패 : " + e);
			}
		
		}
		
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				System.out.println("연결 종료 실패 : " + e);
			}
		}
	}

	
	public boolean updateDB(Idea idea)
	{
		connect();
		
		String sql;
		
		System.out.println(idea.getId());
		System.out.println(idea.getTitle());
		System.out.println(idea.getContent());
		System.out.println(idea.getRequirements());
		System.out.println(idea.getNumber_participants());
		System.out.println(idea.getUrl());
		System.out.println(idea.getState());
		
		try { // 상태에 따라 sql이 달라질 것.
			sql = "update idea set title=?, content=?, requirements=?,"
					+" number_participants=?, url=?, state=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idea.getTitle());
			pstmt.setString(2, idea.getContent());
			pstmt.setString(3, idea.getRequirements());
			pstmt.setInt(4, idea.getNumber_participants());
			pstmt.setString(5, idea.getUrl());
			pstmt.setString(6, idea.getState());
			pstmt.setInt(7, idea.getId());
			
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("updateDB 실패");
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
			System.out.println("deleteDB 실패");
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
			idea.setState(rs.getString("state"));
			
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDB 실패");
		}
		finally {
			disconnect();
		}
	
		return idea;
	}
	
	
	

	public ArrayList getDBList (String type, String search, String order, int pageN)
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
				case "state":
					sql += " where state like ?";
					break;
			}
			
			search = '%' + search.trim() + '%';
		}
		
		sql += " order by " + order;
		sql += " limit ?,?";
		
		ArrayList<Idea> ideas = new ArrayList<Idea>();

		try {
			pstmt = conn.prepareStatement(sql);

			if (search != null) {
				pstmt.setString(1, search);
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
				idea.setState(rs.getString("state"));
				
				ideas.add(idea);
			}
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDBList 실패");
		}
		finally {
			disconnect();
		}
	
		return ideas;
	}
	
	public int getDBCount (String type, String search)
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
				case "state":
					sql += " where state like ?";
					break;
			}
			
			search = '%' + search.trim() + '%';
		}
		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			if (search != null)
				pstmt.setString(1, search);

			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("cnt");
		}
		catch(SQLException e) {
			System.out.println("getDBCount 실패");
			return -1;
		}
		
		return count;
	}

}
