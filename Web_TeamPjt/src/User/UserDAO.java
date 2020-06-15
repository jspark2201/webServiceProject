package User;

import java.sql.*;
import java.util.ArrayList;
import java.io.Reader;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.IOException;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String jdbc_driver;
	private String jdbc_url;
	private String id;
	private String pwd;

	private void connect() {

		try {
			Properties properties = new Properties();

			properties.load((getClass().getResourceAsStream("../config/db.properties")));

			jdbc_driver = properties.getProperty("jdbc_driver");
			jdbc_url = properties.getProperty("jdbc_url");
			id = properties.getProperty("id");
			pwd = properties.getProperty("pwd");
			// 1. Driver 筌띻낱寃�

			Class.forName(jdbc_driver);

			// 2. DB 占쎈염野껓옙

			conn = DriverManager.getConnection(jdbc_url, id, pwd);

		} catch (Exception e) {
			System.out.println("DB 占쎈염野껓옙 占쎈뼄占쎈솭 : " + e);
		}
	}

	private void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("DB 占쎈염野껓옙 占쎈퉸占쎌젫 占쎈뼄占쎈솭1 : " + e);
			}

		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("DB 占쎈염野껓옙 占쎈퉸占쎌젫 占쎈뼄占쎈솭2 : " + e);
			}
		}
	}

	public boolean insertDB(User user) {
		connect();

		String sql = "insert into user(id,pwd,nickname,email,number) values(?,?,?,?,?)";
		String sql2 = "insert into user_favorite(user_id, %s, %s) values(?,1,1)";
		sql2 = String.format(sql2, user.getPlatform(), user.getGenre());

		try {
			
 			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd()); // TODO:
			pstmt.setString(3, user.getNickname());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getNumber());
			pstmt.executeUpdate();
			System.out.println(1);

			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, user.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertDB Error");
			return false;
		} finally {
			disconnect();
		}

		return true;
	}

	public boolean updateDB(User user) {
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
			} else {
				sql = "update user set nickname=?, email=?, number=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getNickname());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getNumber());
				pstmt.setString(4, user.getId());
			}
			pstmt.executeUpdate();

			String sql2 = "update user_favorite set web=0, android=0, embeded=0, ios=0, health=0, psychology=0, game=0 where user_id=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, user.getId());
			pstmt.executeUpdate();

			String sql3 = "update user_favorite set %s=1, %s=1 where user_id=?";
			sql3 = String.format(sql3, user.getPlatform(), user.getGenre());
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, user.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateDB 占쎈퓠占쎌쑎");
			return false;
		} finally {
			disconnect();
		}

		return true;

	}

	public boolean deleteDB(String id) {
		connect();

		String sql = "delete from user where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteDB 占쎈퓠占쎌쑎");
			return false;
		} finally {
			disconnect();
		}

		return true;

	}

	public User getDB(String id) {
		connect();

		String sql = "select * from user where id=?";
		User user = new User();

		try {
			System.out.println(id);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			user.setId(rs.getString("id"));
			user.setPwd(rs.getString("pwd"));
			user.setNickname(rs.getString("nickname"));
			user.setEmail(rs.getString("email"));
			user.setNumber(rs.getString("number"));
			user.setDate(rs.getString("date"));
			ArrayList<String> result = new ArrayList<>();
			if (rs.getBoolean(2))
				result.add(new String("web"));
			else if (rs.getBoolean(3))
				result.add(new String("android"));
			else if (rs.getBoolean(4))
				result.add(new String("embeded"));
			else if (rs.getBoolean(5))
				result.add(new String("ios"));
			if (rs.getBoolean(6))
				result.add(new String("health"));
			else if (rs.getBoolean(7))
				result.add(new String("psychology"));
			else if (rs.getBoolean(8))
				result.add(new String("game"));

			user.setPlatform(result.get(0));
			user.setGenre(result.get(1));
			rs.close();
		} catch (SQLException e) {
			System.out.println("getDB 占쎈퓠占쎌쑎");
		} finally {
			disconnect();
		}

		return user;
	}



	public ArrayList getDBList(String type, String search, String order, int pageN) {
		connect();

		String sql = "select * from user";

		if (search != null) {
			switch (type) {
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
				pstmt.setInt(2, (pageN - 1) * 10);
				pstmt.setInt(3, 10);
			} else {
				pstmt.setInt(1, (pageN - 1) * 10);
				pstmt.setInt(2, 10);
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				User user = new User();

				user.setId(rs.getString("id"));
				user.setNickname(rs.getString("nickname"));
				user.setEmail(rs.getString("email"));
				user.setNumber(rs.getString("number"));
				user.setDate(rs.getString("date"));

				users.add(user);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("getDBList 占쎈퓠占쎌쑎");
		} finally {
			disconnect();
		}

		return users;
	}

	public int getDBCount(String type, String search) {
		connect();

		String sql = "select count(*) as cnt from user";

		if (search != null) {
			switch (type) {
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
		} catch (SQLException e) {
			System.out.println("getDBCount 占쎈퓠占쎌쑎");
			return -1;
		}

		return count;
	}

	public int getDBCount(int type) {
		connect();

		String sql = "select count(*) as cnt from user";

		switch (type) {
		case 0:
			break;
		case 1:
			sql += " where date > last_day(now() - interval 1 month)";
			sql += " and date <= last_day(now())";
			break;
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
		} catch (SQLException e) {
			System.out.println("getDBCount 占쎈퓠占쎌쑎");
			return -1;
		}

		return count;
	}

}