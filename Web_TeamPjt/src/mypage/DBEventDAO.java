package mypage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import java.sql.Date;
import java.io.Reader;
import java.util.Properties;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.IOException;

public class DBEventDAO {

	Connection conn = null;
	Statement stmt = null;
	private ResultSet rs;
	private String jdbc_driver;
	private String jdbc_url;
	private String id;
	private String pwd;
	private static DBEventDAO uniqueInstance;

	public static DBEventDAO getInstance() {
		if (uniqueInstance == null) {
			uniqueInstance = new DBEventDAO();
		}
		return uniqueInstance;
	}

	public DBEventDAO() {

		try {
			Properties properties = new Properties();
			properties.load((getClass().getResourceAsStream("../config/db.properties")));

			jdbc_driver = properties.getProperty("jdbc_driver");
			jdbc_url = properties.getProperty("jdbc_url");
			id = properties.getProperty("id");
			pwd = properties.getProperty("pwd");

			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pwd);
			stmt = conn.createStatement();
			System.out.print("db connect success");
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	private void disconnect() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {

		}
	}

	public String getDate() {

		String SQL = "SELECT NOW()";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getString(1);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return ""; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public int writePortfolio(String bbsTitle, String userID, String bbsContent, String registration_date,
			String complete_date, int number_participants, String projectUrl) {

		String SQL = "INSERT INTO idea(writer,title,content,registration_date,complete_date,number_participants,projectURL,state) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

		int result;
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.setString(2, bbsTitle);

			pstmt.setString(3, bbsContent);

			pstmt.setDate(4, Date.valueOf(registration_date));

			pstmt.setDate(5, Date.valueOf(complete_date));

			pstmt.setInt(6, number_participants);

			pstmt.setString(7, projectUrl);

			pstmt.setInt(8, 5);

			result = pstmt.executeUpdate();

			System.out.println("success");

			System.out.println(result);

			if (writeparticipants(userID, registration_date, complete_date) == -1)
				return -1;

			return result;

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public int writePict(String pictSRC, int ideaID) {
		String SQL = "INSERT INTO pictures(src, idea_id) VALUES(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pictSRC);
			pstmt.setInt(2, ideaID);
			return pstmt.executeUpdate();
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}
		return -1;
	}

	public int writeIdeaFavorite(int ideaID, boolean web, boolean android, boolean embeded, boolean ios, boolean health,
			boolean psychology, boolean game) {
		String SQL = "INSERT INTO idea_favorite VALUES(?,?,?,?,?,?,?,?)";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			if (ideaID == -1)
				return -1;

			pstmt.setInt(1, ideaID);

			pstmt.setBoolean(2, web);

			pstmt.setBoolean(3, android);

			pstmt.setBoolean(4, embeded);

			pstmt.setBoolean(5, ios);

			pstmt.setBoolean(6, health);

			pstmt.setBoolean(7, psychology);

			pstmt.setBoolean(8, game);

			System.out.print("success");
			return pstmt.executeUpdate();

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public Vector getFavorite(int ideaID) {
		String SQL = "SELECT * FROM idea_favorite WHERE idea_id ='" + ideaID + "'";
		Vector result = new Vector();
		try {

			ResultSet rset = stmt.executeQuery(SQL);

			while (rset.next()) {

				if (rset.getBoolean(2))
					result.add(new String("web"));
				else if (rset.getBoolean(3))
					result.add(new String("android"));
				else if (rset.getBoolean(4))
					result.add(new String("embeded"));
				else if (rset.getBoolean(5))
					result.add(new String("ios"));
				if (rset.getBoolean(6))
					result.add(new String("health"));
				else if (rset.getBoolean(7))
					result.add(new String("psychology"));
				else if (rset.getBoolean(8))
					result.add(new String("game"));
			}
			System.out.print("success");
			System.out.print(result.get(0));
			return result;

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return null; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public int writePict(int idea_id, String src) {
		String SQL = "INSTERT INTO pictures(idea_id,src) VALUES(?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, idea_id);

			pstmt.setString(2, src);

			System.out.print("success");
			return pstmt.executeUpdate();

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}

	public String getPict(int bbsID) {
		String SQL = "SELECT * FROM pictures WHERE idea_id  = '" + bbsID + "'";

		try {

			ResultSet rset = stmt.executeQuery(SQL);
			while (rset.next()) {

				return rset.getString(2);
			}
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}
		return null;
	}

	public int getPortfolilID(String userID, String registration_date, String complete_date) {

		String SQL = "SELECT id FROM idea WHERE writer = ? and registration_date = ? and complete_date=?";

		try {
			System.out.println("�뿬湲곌퉴吏꾩솕�떎");
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.setDate(2, Date.valueOf(registration_date));

			pstmt.setDate(3, Date.valueOf(complete_date));

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);

			}

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return -1;
	}

	public int writeparticipants(String userID, String registration_date, String complete_date) {
		String SQL = "INSERT INTO participants(idea_id, user_id, type, Participate_date ) VALUES(?,?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			int ideaID = getPortfolilID(userID, registration_date, complete_date);

			System.out.println(ideaID);
			if (ideaID == -1)
				return -1;

			pstmt.setInt(1, ideaID);

			pstmt.setString(2, userID);

			pstmt.setInt(3, 0);

			pstmt.setDate(4, Date.valueOf(registration_date));

			System.out.print("success");
			return pstmt.executeUpdate();

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	boolean isLoginCorrect(String id, String pwd) {

		ResultSet rs = null;

		try {

			rs = stmt.executeQuery("select password from login where id='" + id + "'");

			while (rs.next()) {
				if (rs.getString(1).equals(pwd)) {
					System.out.print("Yes");
					return true;
				}
			}
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		}
		return false;
	}

	public PortfolioBean getPortfolio(int bbsID) {

		String SQL = "SELECT * FROM idea WHERE id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				PortfolioBean port = new PortfolioBean();

				port.setBbs_id(rs.getInt(1));

				port.setUserID(rs.getString(2));

				port.setBbs_title(rs.getString(3));

				port.setBbsContent(rs.getString(4));

				port.setRegistrationDate(rs.getString(6));

				port.setCompleteDate(rs.getString(7));

				port.setParticipantsNumber(rs.getInt(8));

				port.setProjectUrl(rs.getString(9));

				port.setState(rs.getInt(10));

				return port;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return null;

	}

	public ArrayList<PortfolioBean> getList(String user, int pageNumber) {

		// String SQL = "SELECT * FROM idea WHERE writer = ? and id < ? ORDER BY
		// registration_date DESC LIMIT 10";
		String SQL = "SELECT idea.id, idea.writer, idea.title, idea.content, idea.requirements, idea.registration_date, idea.complete_date, idea.number_participants, idea.projectURL, idea.state  FROM participants, idea"
				+ " WHERE idea.id = participants.idea_id and participants.user_id = ? and idea.id < ? ORDER BY idea.registration_date DESC LIMIT 9";

		ArrayList<PortfolioBean> list = new ArrayList<PortfolioBean>();

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user);

			pstmt.setInt(2, getNext() - (pageNumber - 1) * 9);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				PortfolioBean port = new PortfolioBean();

				port.setBbs_id(rs.getInt(1));

				port.setUserID(rs.getString(2));

				port.setBbs_title(rs.getString(3));

				port.setBbsContent(rs.getString(4));

				port.setRegistrationDate(rs.getString(6));

				port.setCompleteDate(rs.getString(7));

				port.setParticipantsNumber(rs.getInt(8));

				port.setProjectUrl(rs.getString(9));

				port.setState(rs.getInt(10));

				list.add(port);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}
	// bbsID 寃뚯떆湲� 踰덊샇 媛��졇�삤�뒗 �븿�닔

	public int getNext() {

		String SQL = "SELECT id FROM idea ORDER BY id DESC";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;// 泥� 踰덉㎏ 寃뚯떆臾쇱씤 寃쎌슦

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}
	// 10 �떒�쐞 �럹�씠吏� 泥섎━瑜� �쐞�븳 �븿�닔

	public boolean nextPage(String user, int pageNumber) {

		String SQL = "SELECT idea.id, idea.writer, idea.title, idea.content, idea.requirements, idea.registration_date, idea.complete_date, idea.number_participants, idea.projectURL, idea.state  FROM participants, idea"
				+ " WHERE idea.id = participants.idea_id and participants.user_id = ? and idea.id < ? ORDER BY idea.registration_date DESC LIMIT 9";

		ArrayList<PortfolioBean> list = new ArrayList<PortfolioBean>();

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user);

			pstmt.setInt(2, getNext() - (pageNumber) * 9);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return false;

	}

	public int totalPage(String user) {

		String SQL = "SELECT COUNT(*)  FROM participants, idea WHERE idea.id = participants.idea_id and participants.user_id = ?";

		ArrayList<PortfolioBean> list = new ArrayList<PortfolioBean>();

		int result;

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				result = (int) (rs.getInt(1) / 9) + 1;

				return result;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1;

	}

	public String getPic(int idea_id) {

		String SQL = "SELECT src FROM pictures WHERE idea_id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, idea_id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		}

		return null;
	}

	// �닔�젙 �븿�닔

	public int update(int bbsID, String bbsTitle, String bbsContent, String registration_date, String complete_date,
			int number_participants, String url) {

		String SQL = "UPDATE idea SET title = ?, content = ?, registration_date=?,complete_date=?,number_participants=?, projectURL=? WHERE id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, bbsTitle);

			pstmt.setString(2, bbsContent);

			pstmt.setDate(3, Date.valueOf(registration_date));

			pstmt.setDate(4, Date.valueOf(complete_date));

			pstmt.setInt(5, number_participants);

			pstmt.setString(6, url);

			pstmt.setInt(7, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public int updateIdeaFavorite(int ideaID, boolean web, boolean android, boolean embeded, boolean ios,
			boolean health, boolean psychology, boolean game) {

		String SQL = "UPDATE idea_favorite SET web=?, android=?,embeded=?,ios=?,health=?,psychology=?,game=? WHERE bbsID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			if (ideaID == -1)
				return -1;

			pstmt.setInt(1, ideaID);

			pstmt.setBoolean(2, web);

			pstmt.setBoolean(3, android);

			pstmt.setBoolean(4, embeded);

			pstmt.setBoolean(5, ios);

			pstmt.setBoolean(6, health);

			pstmt.setBoolean(7, psychology);

			pstmt.setBoolean(8, game);

			System.out.print("success");
			return pstmt.executeUpdate();

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public int updatePict(int bbsID, String src) {

		String SQL = "UPDATE idea SET src=? WHERE idea_id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, src);

			pstmt.setInt(2, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	// �궘�젣 �븿�닔

	public int delete(int bbsID) {

		String SQL = "DELETE FROM idea WHERE id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�

	}

	public int getPtype(int bbsID, String user) {

		String SQL = "SELECT type FROM participants WHERE idea_id = ? and user_id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			pstmt.setString(2, user);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		}

		return -1;
	}

}
