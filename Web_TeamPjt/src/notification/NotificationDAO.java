package notification;

import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import note.NoteDTO;
import java.io.Reader;
import java.util.Properties;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.IOException;

public class NotificationDAO {
	private String jdbc_driver;
	private String jdbc_url;
	private String id;
	private String pwd;
	public Connection dbConn() {
        Connection conn = null; // db접속 객체
        try {
			Properties properties = new Properties();
			Reader reader;
			reader = new FileReader("db.properties");
			properties.load(reader);

			jdbc_driver = properties.getProperty("jdbc_driver");
			jdbc_url = properties.getProperty("jdbc_url");
			id = properties.getProperty("id");
			pwd = properties.getProperty("pwd");
            // mysql jdbc driver 로딩
            Class.forName(jdbc_driver);
 
            // db연결 문자열 but 이방법은 보안에 취약하다. ..
            
            // db 접속
            conn = DriverManager.getConnection(jdbc_url, id, pwd);
            System.out.println("db접속 성공");
        } catch (Exception e) {
            // db관련작업은 반드시 익셉션 처리
            System.out.println("db접속 실패");
            e.printStackTrace();
        }
        return conn;
    }
	
	public ArrayList<NotificationDTO> notificationList() {
		ArrayList<NotificationDTO> list = new ArrayList<NotificationDTO>();
        Connection conn = null; // DB접속 객체
        PreparedStatement pstmt = null; // SQL실행객체
        ResultSet rs = null; // 결과셋 처리 객체
 
        try {
            conn = dbConn(); // db연결 키
            String sql = "select * from NOTIFICATION";
            pstmt = conn.prepareStatement(sql); // sql을 실행시키는 객체 만들어짐
            rs = pstmt.executeQuery(); // 실행 후 결과 값이 rs에 넘어옴
 
            while (rs.next()) {                    //결과셋.next(); 다음 레코드가 있으면 true
 
            	NotificationDTO dto = new NotificationDTO();
//                dto.setId(rs.getInt("id"));
//                dto.setTitle(rs.getString("title"));
//                dto.setAuthor(rs.getString("author"));
//                dto.setPrice(rs.getInt("price"));
//                dto.setQty(rs.getInt("qty"));
            	dto.setNotiNumber(rs.getInt("notiNumber"));
            	dto.setReceiveID(rs.getString("receiveID"));
            	dto.setGiveID(rs.getString("giveID"));
            	dto.setGiveEmail(rs.getString("giveEmail"));
            	dto.setIdeaTitle(rs.getString("ideaTitle"));
            	dto.setIdeaLink(rs.getString("ideaLink"));
                
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
	
}
