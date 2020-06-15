package user;

import java.sql.*;
import java.util.ArrayList;
public class UserDAO  {
	private String jdbc_driver ="org.mariadb.jdbc.Driver";
	private String jdbc_url="jdbc:mariadb://localhost:3306/developers";
	private Connection conn;
	private Statement stmt;
	private void connect() {
		try {
			Class.forName(jdbc_driver);
			conn=DriverManager.getConnection(jdbc_url,"root","1234");
			stmt=conn.createStatement();
			}catch(Exception e) {
			
		}
	}
	private void disconnect() {
		try {
			stmt.close();
			conn.close();
		}catch(Exception e) {
			
		}
	}
	public int addid(UserBean user) { // 회원가입
		String sql="insert into user(id,pwd,nickname,email,number) values('"
				+ user.getId()+"','"
				+ user.getPwd()+"','"
				+ user.getNickname()+"','"
				+ user.getEmail()+"','"
				+ user.getNumber()+"')";
		String sql2="insert into user_favorite(user_id,"+user.getInterest()+","+user.getInterest1()+") values('"+user.getId()+"','1','1')";
		try {
			connect();
			stmt.executeUpdate(sql);
			stmt.executeUpdate(sql2);
			disconnect();
			return 1;
		}catch(Exception e) {
			return -1;
		}
	}
	public boolean authenticate(UserBean user) {
		String sql="select pwd from user where id="+"'"+user.getId()+"'";
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				if(rs.getString("pwd").equals(user.getPwd())) {
					return true;
				}
				else {
					return false; 
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return false;
	}
	public ArrayList<UserBean> getAllEvent() {
		String sql ="select id,pwd,nickname from user";
		ArrayList<UserBean>list = new ArrayList<UserBean>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				UserBean user = new UserBean();
				user.setId(rs.getString("id"));
				user.setPwd(rs.getString("pwd"));
				user.setNickname(rs.getString("nickname"));
				list.add(user);
			}
			rs.close();
			disconnect();
		}catch(Exception e) {
			
		}
		return list;
	}
	public UserBean getEvent(String id) {
		String sql ="select id,pwd,nickname,email,number from user where id="+"'"+id+"'";
		UserBean event = new UserBean();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			event.setId(rs.getString("id"));
			event.setPwd(rs.getString("pwd"));
			event.setNickname(rs.getString("nickname"));
			event.setEmail(rs.getString("email"));
			event.setNumber(rs.getString("number"));
			rs.close();
			disconnect();
		}catch(Exception e) {
			System.out.println("ㅇㅇㅇㅇㅇㅇ");
		}
		System.out.println(event.getId());
		return event;
	}
}
