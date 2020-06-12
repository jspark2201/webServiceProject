package mypage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;

public class DBEventDAO {
	private String jdbc_driver = "org.mariadb.jdbc.Driver";
	private String jdbc_url = "jdbc:mariadb://localhost:3306/developers";
	private String id = "root";
	private String pwd = "940525";
	Connection conn = null;
	Statement stmt = null;
	private ResultSet rs;

	public DBEventDAO() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pwd);
			stmt = conn.createStatement();
			System.out.print("db connect success");
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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

		return ""; // 데이터베이스 오류

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

		return -1; // 데이터베이스 오류

	}

	public int writePict(String pictSRC, int ideaID) {
		String SQL = "INSERT INTO pictures(src, idea_id) VALUES(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,pictSRC);
			pstmt.setInt(2,ideaID);
			return pstmt.executeUpdate();
		} catch (SQLException sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
			System.out.println("SQLState: " + sqex.getSQLState());

		}
		return -1;
	}

	public int writeIdeaFavorite(int ideaID, boolean web, boolean android, boolean embeded, boolean ios, boolean health,
			boolean psychology, boolean game) {
		String SQL = "INSTER INTO idea_favorite VALUES(?,?,?,?,?,?,?,?)";
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

		return -1; // 데이터베이스 오류

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

		return -1; // 데이터베이스 오류
	}

	public String getPict(String bbsID) {
		String SQL = "SELECT src FROM pictures WHERE idea_id  = '" + bbsID + "'";

		try {

			ResultSet rset = stmt.executeQuery(SQL);

			if (rs.next()) {
				return rset.getString(1);
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
			System.out.println("여기까진왔다");
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

		return -1; // 데이터베이스 오류

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
	// bbsID 게시글 번호 가져오는 함수

	public int getNext() {

		String SQL = "SELECT id FROM idea ORDER BY id DESC";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;// 첫 번째 게시물인 경우

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
	// 10 단위 페이징 처리를 위한 함수

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

	// 수정 함수

	public int update(int bbsID, String bbsTitle, String bbsContent) {

		String SQL = "UPDATE idea SET bbsTitle = ?, bbsContent = ?, WHERE bbsID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, bbsTitle);

			pstmt.setString(2, bbsContent);

			pstmt.setInt(3, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	// 삭제 함수

	public int delete(int bbsID) {

		String SQL = "DELETE FROM idea WHERE WHERE id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
}
