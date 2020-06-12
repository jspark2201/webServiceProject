package User;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO
{
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
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/developers", "root", "qwe123!@#");

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

	public boolean insertDB(User user)
	{
		connect();
		
		String sql = "insert into user(id,pwd,nickname,email,number) values(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());	// TODO: ��ȣȭ �� ��!!
			pstmt.setString(3, user.getNickname());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getNumber());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			System.out.println("insertDB ����");
			return false;
		}
		finally {
			disconnect();
		}

		return true;
	}

	
	public boolean updateDB(User user)
	{
		connect();
		
		String sql;
		
		try {
			if (user.getPwd() != null) {
				sql = "update user set pwd=?, nickname=?, email=?, number=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getPwd());
				pstmt.setString(2, user.getNickname());
				pstmt.setString(3, user.getEmail());
				pstmt.setString(4, user.getNumber());
				pstmt.setString(5, user.getId());
			}
			else {
				sql = "update user set nickname=?, email=?, number=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getNickname());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getNumber());
				pstmt.setString(4, user.getId());
			}
			
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
	
	
	public boolean deleteDB(String id)
	{
		connect();
		
		String sql = "delete from user where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	
	public User getDB(String id)
	{
		connect();
		
		String sql = "select * from user where id=?";
		User user = new User();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			user.setId(rs.getString("id"));
			user.setNickname(rs.getString("nickname"));
			user.setEmail(rs.getString("email"));
			user.setNumber(rs.getString("number"));
			user.setDate(rs.getString("date"));
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDB ����");
		}
		finally {
			disconnect();
		}
	
		return user;
	}
	
	
	

	public ArrayList getDBList (String type, String search, String order, int pageN)
	{
		connect();
		
		String sql = "select * from user";
		
		if (search != null) {
			switch(type) {
				case "id":
					sql += " where id like ?";
					break;
				case "nickname":
					sql += " where nickname like ?";
					break;
				case "email":
					sql += " where email like ?";
					break;
			}
			
			search = '%' + search.trim() + '%';
		}
		
		sql += " order by " + order;
		sql += " limit ?,?";
		
		ArrayList<User> users = new ArrayList<User>();

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
				User user = new User();

				user.setId(rs.getString("id"));
				user.setNickname(rs.getString("nickname"));
				user.setEmail(rs.getString("email"));
				user.setNumber(rs.getString("number"));
				user.setDate(rs.getString("date"));
				
				users.add(user);
			}
			rs.close();
		}
		catch(SQLException e) {
			System.out.println("getDBList ����");
		}
		finally {
			disconnect();
		}
	
		return users;
	}
	
	public int getDBCount (String type, String search)
	{
		connect();
		
		String sql = "select count(*) as cnt from user";
		
		if (search != null) {
			switch(type) {
				case "id":
					sql += " where id like ?";
					break;
				case "nickname":
					sql += " where nickname like ?";
					break;
				case "email":
					sql += " where email like ?";
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
			System.out.println("getDBCount ����");
			return -1;
		}
		
		return count;
	}

	
	public int getDBCount (int type) {
		connect();
		
		String sql = "select count(*) as cnt from user";
		
		switch(type) {
		// ��ü �ο� ��
		case 0:
			break;
		// �̹� �� �ο� ��
		case 1:
			sql += " where date > last_day(now() - interval 1 month)";
			sql += " and date <= last_day(now())";
			break;
		// �̹� �� �ο� ��
		case 2:
			sql += " WHERE YEARWEEK(date) = YEARWEEK(now())";
			break;
		}

		
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
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
