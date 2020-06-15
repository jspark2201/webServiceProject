package note;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.io.Reader;
import java.util.Properties;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.IOException;

public class NoteDAO {
	private String jdbc_driver;
	private String jdbc_url;
	private String id;
	private String pwd;
	public Connection dbConn() {
        Connection conn = null; // db�젒�냽 媛앹껜
        try {
			Properties properties = new Properties();
			properties.load((getClass().getResourceAsStream("../config/db.properties")));

			jdbc_driver = properties.getProperty("jdbc_driver");
			jdbc_url = properties.getProperty("jdbc_url");
			id = properties.getProperty("id");
			pwd = properties.getProperty("pwd");
            // mysql jdbc driver 로딩
            Class.forName(jdbc_driver);
 
            // db 접속
            conn = DriverManager.getConnection(jdbc_url, id, pwd);
            System.out.println("db접속 성공");
        } catch (Exception e) {
            // db愿��젴�옉�뾽�� 諛섎뱶�떆 �씡�뀎�뀡 泥섎━
            System.out.println("db�젒�냽 �떎�뙣");
            e.printStackTrace();
        }
        return conn;
    }
	
	public ArrayList<NoteDTO> noteList() {
		ArrayList<NoteDTO> list = new ArrayList<NoteDTO>();
        Connection conn = null; // DB�젒�냽 媛앹껜
        PreparedStatement pstmt = null; // SQL�떎�뻾媛앹껜
        ResultSet rs = null; // 寃곌낵�뀑 泥섎━ 媛앹껜
 
        try {
            conn = dbConn(); // db�뿰寃� �궎
            String sql = "select * from NOTE where receiveID='jspark'";
            pstmt = conn.prepareStatement(sql); // sql�쓣 �떎�뻾�떆�궎�뒗 媛앹껜 留뚮뱾�뼱吏�
            rs = pstmt.executeQuery(); // �떎�뻾 �썑 寃곌낵 媛믪씠 rs�뿉 �꽆�뼱�샂
 
            while (rs.next()) {                    //寃곌낵�뀑.next(); �떎�쓬 �젅肄붾뱶媛� �엳�쑝硫� true
 
            	NoteDTO dto = new NoteDTO();

            	dto.setNoteNumber(rs.getInt("noteNumber"));
            	dto.setReceiveID(rs.getString("receiveID"));
            	dto.setGiveID(rs.getString("giveID"));
            	dto.setGiveEmail(rs.getString("giveEmail"));
            	dto.setTitle(rs.getString("title"));
            	dto.setComment(rs.getString("comment"));
                
                //ArrayList�뿉 異붽�
                list.add(dto);
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {        //�삤�뵂�븳 �뿭�닚�쑝濡� �떕湲곗옉�뾽 �떎�뻾
            
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
		Connection conn = null; // DB�젒�냽 媛앹껜
        PreparedStatement pstmt = null; // SQL�떎�뻾媛앹껜
        ResultSet rs = null; // 寃곌낵�뀑 泥섎━ 媛앹껜
        
		try {
            conn = dbConn(); // db�뿰寃� �궎
            String sql = "select noteNumber from NOTE order by noteNumber DESC";
            pstmt = conn.prepareStatement(sql); // sql�쓣 �떎�뻾�떆�궎�뒗 媛앹껜 留뚮뱾�뼱吏�
            rs = pstmt.executeQuery(); // �떎�뻾 �썑 寃곌낵 媛믪씠 rs�뿉 �꽆�뼱�샂
            
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
		Connection conn = null; // DB�젒�냽 媛앹껜
        PreparedStatement pstmt = null; // SQL�떎�뻾媛앹껜
        ResultSet rs = null; // 寃곌낵�뀑 泥섎━ 媛앹껜
        
        try {
        	conn = dbConn(); 
            String sql = "insert into Note values (?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql); // sql�쓣 �떎�뻾�떆�궎�뒗 媛앹껜 留뚮뱾�뼱吏�
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
