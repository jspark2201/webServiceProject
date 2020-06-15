package note;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoteDAO {
	
	public Connection dbConn() {
        Connection conn = null; // db접속 객체
        try {
            // mysql jdbc driver 로딩
//            Class.forName("com.mysql.jdbc.Driver");
        	Class.forName("org.mariadb.jdbc.Driver");
 
            // db연결 문자열 but 이방법은 보안에 취약하다. ..
//            String url = "jdbc:mysql://localhost:3306/TUTORIAL";
//            String id = "root"; // mysql 접속아이디
//            String pwd = "31362201"; // mysql 접속 비번
            // db 접속
//            conn = DriverManager.getConnection(url, id, pwd);
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/developers", "root", "qwe123!@#");
            System.out.println("db접속 성공");
        } catch (Exception e) {
            // db관련작업은 반드시 익셉션 처리
            System.out.println("db접속 실패");
            e.printStackTrace();
        }
        return conn;
    }
	
	public ArrayList<NoteDTO> noteList() {
		ArrayList<NoteDTO> list = new ArrayList<NoteDTO>();
        Connection conn = null; // DB접속 객체
        PreparedStatement pstmt = null; // SQL실행객체
        ResultSet rs = null; // 결과셋 처리 객체
 
        try {
            conn = dbConn(); // db연결 키
            String sql = "select * from NOTE where receiveID='jspark'";
            pstmt = conn.prepareStatement(sql); // sql을 실행시키는 객체 만들어짐
            rs = pstmt.executeQuery(); // 실행 후 결과 값이 rs에 넘어옴
 
            while (rs.next()) {                    //결과셋.next(); 다음 레코드가 있으면 true
 
            	NoteDTO dto = new NoteDTO();

            	dto.setNoteNumber(rs.getInt("noteNumber"));
            	dto.setReceiveID(rs.getString("receiveID"));
            	dto.setGiveID(rs.getString("giveID"));
            	dto.setGiveEmail(rs.getString("giveEmail"));
            	dto.setTitle(rs.getString("title"));
            	dto.setComment(rs.getString("comment"));
                
                //ArrayList에 추가
                list.add(dto);
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {        //오픈한 역순으로 닫기작업 실행
            
            //resultset= > statement=> connection
                
            try{
                if(rs!=null){rs.close();}
                
            }catch(Exception e2){
                e2.printStackTrace();
            }
            
            try{
                if(pstmt!=null){pstmt.close();}
                
            }catch(Exception e2){
                e2.printStackTrace();
            }
            
            try{
                if(conn!=null){conn.close();}
                
            }catch(Exception e2){
                e2.printStackTrace();
            }
            
        }
        return list;
	}
	
	public int getNext() {
		Connection conn = null; // DB접속 객체
        PreparedStatement pstmt = null; // SQL실행객체
        ResultSet rs = null; // 결과셋 처리 객체
        
		try {
            conn = dbConn(); // db연결 키
            String sql = "select noteNumber from NOTE order by noteNumber DESC";
            pstmt = conn.prepareStatement(sql); // sql을 실행시키는 객체 만들어짐
            rs = pstmt.executeQuery(); // 실행 후 결과 값이 rs에 넘어옴
            
            if(rs.next()) {
            	return rs.getInt(1) + 1;
            }
            return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public int sendNote(String receiveID, String giveID, String giveEmail, String title, String comment) {
		Connection conn = null; // DB접속 객체
        PreparedStatement pstmt = null; // SQL실행객체
        ResultSet rs = null; // 결과셋 처리 객체
        
        try {
        	conn = dbConn(); // db연결 키
            String sql = "insert into Note values (?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql); // sql을 실행시키는 객체 만들어짐
            pstmt.setInt(1, getNext());
            pstmt.setString(2, receiveID);
            pstmt.setString(3, giveID);
            pstmt.setString(4, giveEmail);
            pstmt.setString(5, title);
            pstmt.setString(6, comment);
        	return pstmt.executeUpdate();
        	
        } catch(Exception e) {	
        	e.printStackTrace();
        }
        
        return -1;
	}

	
	
}
