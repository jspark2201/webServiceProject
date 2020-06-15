package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	  private final String driverClassName = "org.mariadb.jdbc.Driver";
	    private final String url = "jdbc:mariadb://localhost:3306/developers";
	    private final String username = "root";
	    private final String password = "smdtlr12";
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �뜲�씠�꽣 �궘�젣 
	    public int deleteBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM idea where id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    // �뀒�씠釉� : idea , 湲곕뒫 :  湲� �궘�젣�릺�뿀�쓣 寃쎌슦 idea_Favorite�뜲�씠�꽣 �궘�젣 
	    public int deleteIdea_Favorite_Board(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM idea_favorite where idea_id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    // �뀒�씠釉� : idea , 湲곕뒫 :  湲� �궘�젣�릺�뿀�쓣 寃쎌슦 good�뜲�씠�꽣 �궘�젣 
	    public int deleteGoodBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM good where idea_id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : 湲� �궘�젣�릺�뿀�쓣 寃쎌슦 李멸��옄�뜲�씠�꽣 �궘�젣 
	    public int deleteParticipantsBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM participants where idea_id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    // �뀒�씠釉� : idea , 湲곕뒫 :  湲� �궘�젣�릺�뿀�쓣 寃쎌슦 �뙎湲��뜲�씠�꽣 �궘�젣 
	    public int deleteCommentBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM comments where idea_id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    // �뀒�씠釉� : idea , 湲곕뒫 :   湲� �궘�젣�릺�뿀�쓣 寃쎌슦 �궗吏꾨뜲�씠�꽣 �궘�젣 
	    public int deletePictureBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM pictures where idea_id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : good , 湲곕뒫 : 醫뗭븘�슂湲곕뒫  
	    public int InsertGood(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "INSERT INTO good(idea_id, user_id, registration_date)"
	        		+ " VALUES(?, ?, now())";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            statement.setString(2,board.getId2());//�씪�떒 �쑀��媛� �뾾�쑝�땲 �엫�떆
	           
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : 紐⑥쭛 �셿猷뚭린�뒫  
	    public int updateDeadline(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "UPDATE idea SET state=? WHERE id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, 2);
	            statement.setInt(2, board.getId());
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    //媛쒕컻�셿猷� 踰꾪듉
	    public int updateCompleteline(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "UPDATE idea SET state=? WHERE id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, 3);
	            statement.setInt(2, board.getId());
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    //媛쒕컻�셿猷� 踰꾪듉 �겢由��떆 complete_date異붽�
	    public int updateCompletedate(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "UPDATE idea SET complete_date=now() WHERE id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    
	    // �뀒�씠釉� : participants , 湲곕뒫 : 而⑦깮�떆, 李멸��옄 異붽�  
	    public int InsertParticipants(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "INSERT INTO participants(idea_id, user_id, type, Participate_date)"
	        		+ " VALUES(?, ?, ?, now())";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getId());
	            statement.setString(2,board.getId2());
	            statement.setInt(3,1);
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    

	    

	    //�떊泥�媛쒕컻�옄->李몄뿬 媛쒕컻�옄
	    public int updateParticipants(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	
	        String sql ="UPDATE participants SET type=? WHERE user_id=?";

	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1,2);
	            statement.setString(2,board.getId2());
	            
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    //�떊泥�媛쒕컻�옄嫄곗젅 諛� 李몄뿬 以� 媛쒕컻�옄 嫄곗젅
	    public int deleteParticipants(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        
	        String sql ="DELETE FROM participants where idea_id=? and user_id=?";

	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1,board.getId());
	            statement.setString(2,board.getId2());
	            
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    

	    //李멸��옄 �닔 �뾽�뜲�씠�듃
	    public int UpdateParticipantsNum(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "UPDATE idea SET number_participants=? WHERE id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, board.getParticipants_num());
	            statement.setInt(2, board.getId());
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : comment , 湲곕뒫 : �뙎湲��벑濡�  
	    public int InsertComment(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "INSERT INTO comments(content, writer, idea_id, registration_date) VALUES(?,?,?,now())";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1, board.getContent2());
	            statement.setString(2,board.getId2());
	            statement.setInt(3, board.getId());
	          
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 :boardDetailView �븯�굹�쓽 �뜲�씠�꽣 媛��졇�삤湲�
	    public Board selectBoardByKey(int id) {
	        Board board = null;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT title, writer, content, requirements, registration_date, complete_date, "
	        		+ "number_participants state, src, web, android, embeded,"
	        		+ " ios, health, psychology, game "
	        		+ "FROM idea i, pictures p, idea_favorite f "
	        		+ "WHERE i.id=p.idea_id and i.id=f.idea_id and p.idea_id=f.idea_id and i.id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                board = new Board();
	                board.setId(id);
	                board.setTitle(resultset.getString("title"));
	                board.setWriter(resultset.getString("writer"));
	                board.setContent(resultset.getString("content"));
	                board.setRequirements(resultset.getString("requirements"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                board.setComplete_date(resultset.getString("complete_date"));
	                board.setNumber_participants(resultset.getInt("number_participants"));
	                board.setState(resultset.getInt("state"));
	                board.setSrc(resultset.getString("src"));
	                board.setWeb(resultset.getBoolean("web"));
	                board.setAndroid(resultset.getBoolean("android"));
	                board.setEmbeded(resultset.getBoolean("embeded"));
	                board.setIos(resultset.getBoolean("ios"));
	                board.setHealth(resultset.getBoolean("health"));
	                board.setPsychology(resultset.getBoolean("psychology"));
	                board.setGame(resultset.getBoolean("game"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return board;
	    }
	    

	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : 李멸��옄移댁슫�꽣 媛��졇�삤湲�
	    public int participantsCount(int id) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT count(*) FROM participants WHERE idea_id=?";

	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : 醫뗭븘�슂 移댁슫�꽣 媛��졇�삤湲�
	    public int goodCount(int id) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT count(*) FROM good WHERE idea_id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �굹�쓽 醫뗭븘�슂 �긽�깭
	    public int goodState(int boardNo, String userId) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT count(*) FROM good WHERE idea_id=? and user_id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, boardNo);
	            statement.setString(2,  userId);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    //�븘�씠�뵒�뼱 �긽�깭 �솗�씤
	    public int participantsState(int id) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT state FROM idea WHERE id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� :idea , 湲곕뒫 : �븳 �럹�씠吏��쓽 �뜲�씠�꽣 �벑濡앹씪�닚�쑝濡� 媛��졇�삤湲� 
	    public List<Board> selectBoardListPerPage(int beginRow, int pagePerRow) {
	        List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        
	        String sql =  "SELECT i.id, i.title, i.writer, i.registration_date, p.src "
	                 + "FROM idea i, pictures p  "
	                 + "WHERE i.id=p.idea_id "
	                 + "ORDER BY id DESC LIMIT ?, ?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, beginRow);
	            statement.setInt(2, pagePerRow);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	                Board board = new Board();
	                board.setId(resultset.getInt(1));
	                board.setTitle(resultset.getString(2));
	                board.setWriter(resultset.getString(3));
	                board.setRegistration_date(resultset.getString(4));
	                board.setSrc(resultset.getString(5));	
	                
	                
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return list;
	    }
	    
	    // �뀒�씠釉� :idea , 湲곕뒫 : �븳 �럹�씠吏��쓽 �뜲�씠�꽣 醫뗭븘�슂�닚�쑝濡� 媛��졇�삤湲� (誘몄셿)
	    public List<Board> selectGoodBoardListPerPage(int beginRow, int pagePerRow) {
	        List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT i.id, i.title, i.writer, i.registration_date, i.state, p.src "
	        		+ "FROM idea i, pictures p, good.g "
	        		+ "WHERE i.id=p.idea_id and i=id=g.idea_id"
	        		+ "ORDER BY id DESC LIMIT ?, ?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, beginRow);
	            statement.setInt(2, pagePerRow);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	                Board board = new Board();
	                board.setId(resultset.getInt("id"));
	                board.setTitle(resultset.getString("title"));
	                board.setWriter(resultset.getString("writer"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                board.setState(resultset.getInt("State"));
	                board.setSrc(resultset.getString("src"));
	                
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return list;
	    }
	    	    
	    // �뀒�씠釉� : idea , 湲곕뒫 :寃��깋�맂 湲� 媛��졇�삤湲�
	    public List<Board> selectSearchBoardListPerPage(String str, int beginRow, int pagePerRow) {
	    	List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String s;
	        String sql = "SELECT i.id, i.title, i.writer, i.registration_date, "
	        		+ "i.state, p.src "
	        		+ "FROM idea i, pictures p "
	        		+ "WHERE i.id=p.idea_id and "
	        		+ "(title LIKE ? or writer LIKE ?) "
	        		+ "ORDER BY id DESC LIMIT ?, ?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1, str);
	            statement.setString(2, str);
	            statement.setInt(3, beginRow);
	            statement.setInt(4, pagePerRow);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	                Board board = new Board();
	                board.setSearch(str);
	                board.setId(resultset.getInt("id"));
	                board.setTitle(resultset.getString("title"));
	                board.setWriter(resultset.getString("writer"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                board.setState(resultset.getInt("State"));
	                board.setSrc(resultset.getString("src"));
	                
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return list;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 :�븘�꽣 湲� 媛��졇�삤湲�
	    public List<Board> selectFavoriteBoardListPerPage(String target1, String target2, int beginRow, int pagePerRow) {
	    	List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;

	        String sql = "SELECT i.id, i.title, i.writer, i.registration_date, "
	        		+ "i.state, p.src "
	        		+ "FROM idea i, pictures p, idea_favorite f "
	        		+ "WHERE i.id=p.idea_id and i.id=f.idea_id and p.idea_id=f.idea_id and "
	        		+ "(%s=1 or %s=1 ) "
	        		+ "ORDER BY id DESC LIMIT ?, ?";
	        sql=String.format(sql, target1, target2); 
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, beginRow);
	            statement.setInt(2, pagePerRow);
	            resultset = statement.executeQuery();
	            
	            while(resultset.next()) {
	                Board board = new Board();                
	                board.setId(resultset.getInt("id"));
	                board.setTitle(resultset.getString("title"));
	                board.setWriter(resultset.getString("writer"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                board.setState(resultset.getInt("State"));
	                board.setSrc(resultset.getString("src"));
	                
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return list;
	    }
	    
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 :�뙎湲�媛��졇�삤湲�
	    public List<Board> selectComments(int commentId) {
	    	List<Board> mlist = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT id, content, writer, registration_date "
	        		+ "FROM comments "
	        		+ "WHERE idea_id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, commentId);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	                Board board = new Board();
	                board.setId(resultset.getInt("id"));
	                board.setContent2(resultset.getString("content"));
	                board.setWriter(resultset.getString("writer"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                
	                mlist.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return mlist;
	    }
	    

	    
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : 紐⑥쭛以묒씤 �럹�씠吏��쓽 �뜲�씠�꽣 媛��졇�삤湲� 
	    public List<Board> selectRecruitBoardListPerPage(int beginRow, int pagePerRow) {
	        List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	    
	        int s=1;
	        String sql = "SELECT i.id, i.title, i.writer, i.registration_date, i.state, p.src "
	        		+ "FROM idea i, pictures p "
	        		+ "WHERE i.id=p.idea_id and i.state='"+ s +"'  ORDER BY registration_date DESC LIMIT ?, ?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, beginRow);
	            statement.setInt(2, pagePerRow);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	                Board board = new Board();
	                board.setId(resultset.getInt("id"));
	                board.setTitle(resultset.getString("title"));
	                board.setWriter(resultset.getString("writer"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                board.setState(resultset.getInt("state"));
	                board.setSrc(resultset.getString("src"));
	                
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return list;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �셿猷뚮맂 �럹�씠吏��쓽 �뜲�씠�꽣 媛��졇�삤湲� 
	    public List<Board> selectCompleteBoardListPerPage(int beginRow, int pagePerRow) {
	        List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        int s=2;
	        String sql = "SELECT i.id, i.title, i.writer, i.registration_date, i.state, p.src "
	        		+ "FROM idea i, pictures p "
	        		+ "WHERE i.id=p.idea_id and i.state='"+ s +"'  "
	        				+ "ORDER BY registration_date DESC LIMIT ?, ?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, beginRow);
	            statement.setInt(2, pagePerRow);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	                Board board = new Board();
	                board.setId(resultset.getInt("id"));
	                board.setTitle(resultset.getString("title"));
	                board.setWriter(resultset.getString("writer"));
	                board.setRegistration_date(resultset.getString("registration_date"));
	                board.setState(resultset.getInt("state"));
	                board.setSrc(resultset.getString("src"));
	                
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return list;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �쟾泥� 濡쒖슦 移댁슫�꽣 媛��졇�삤湲�
	    public int selectTotalBoardCount() {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT COUNT(*) FROM idea";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    //�븘�꽣 寃��깋 移댁슫�꽣
	    public int selectFavoriteTotalBoardCount(String target1, String target2) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT COUNT(*) FROM idea i, idea_favorite f where %s=1 or %s=1";
	        sql=String.format(sql, target1, target2);
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� :idea, 湲곕뒫 : �쟾泥� 紐⑥쭛以묒씤 濡쒖슦 移댁슫�꽣 媛��졇�삤湲�
	    public int selectTotalRecruitBoardCount() {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT COUNT(*) FROM idea where state='1'";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� :idea, 湲곕뒫 : 寃��깋 濡쒖슦 移댁슫�꽣 媛��졇�삤湲�
	    public int selectTotalSearchBoardCount(String str) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT COUNT(*) "
	        		+ "FROM idea "
	        		+ "WHERE title LIKE ? or "
	        		+ "writer LIKE ?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1, str);
	            statement.setString(2, str);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �쟾泥� �셿猷뚮맂 濡쒖슦 移댁슫�꽣 媛��졇�삤湲�
	    public int selectTotalCompleteBoardCount() {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT COUNT(*) FROM idea where state='2'";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    // �뀒�씠釉� : idea , 湲곕뒫 : �븘�씠�뵒�뼱 �옉�꽦
	    public int insertBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "INSERT INTO idea(writer, title, content, requirements, registration_date, number_participants, state)"
	        		+ " values(?, ?, ?, ? ,now(),? ,?)";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1,board.getWriter());
	            statement.setString(2,board.getTitle());
	            statement.setString(3,board.getContent());
	            statement.setString(4,board.getRequirements());
	            statement.setInt(5, 1);
	            statement.setInt(6,1);
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �뜲�씠�꽣 �닔�젙 
	    public int updateBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "UPDATE idea SET title=?, content=?, requirements=? WHERE id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1,board.getTitle());
	            statement.setString(2,board.getContent());
	            statement.setString(3,board.getRequirements());
	            statement.setInt(4,board.getId());
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    //�븘�씠�뵒�뼱 �벑濡앹떆 �궗吏� �룷�븿
	    public int insertPicturesBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "INSERT INTO pictures(src, idea_id)"
	        		+ " values(?, ?)";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1, board.getSrc());
	            statement.setInt(2, board.getRow());

	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : �궗吏꾨뜲�씠�꽣 �닔�젙 
	    public int updatePicturesBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "UPDATE pictures SET src=? WHERE idea_id=?";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setString(1,board.getSrc());
	            statement.setInt(2,board.getId());
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    
	    //�븘�씠�뵒�뼱 �벑濡앹떆 �옣瑜� �뵆�옯�뤌 �룷�븿
	    public int insertTypeBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "INSERT INTO idea_favorite(idea_id, web, android, embeded, ios, health, psychology, game)"
	        		+ " values(?, ?, ?, ?, ?, ?, ?, ?)";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1,board.getRow());
	            statement.setBoolean(2,board.isWeb());
	            statement.setBoolean(3,board.isAndroid());
	            statement.setBoolean(4,board.isEmbeded());
	            statement.setBoolean(5,board.isIos());
	            statement.setBoolean(6,board.isHealth());
	            statement.setBoolean(7,board.isPsychology());
	            statement.setBoolean(8,board.isGame());

	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    //�븘�씠�뵒�뼱 �닔�젙�떆 �옣瑜� �뵆�옯�뤌 �닔�젙
	    public int updateTypeBoard(Board board) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	
	        String sql ="UPDATE idea_favorite SET web=?, android=?, "
	        		+ "embeded=?, ios=?, health=?, psychology=?, game=? WHERE idea_id=?";

	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setBoolean(1,board.isWeb());
	            statement.setBoolean(2,board.isAndroid());
	            statement.setBoolean(3,board.isEmbeded());
	            statement.setBoolean(4,board.isIos());
	            statement.setBoolean(5,board.isHealth());
	            statement.setBoolean(6,board.isPsychology());
	            statement.setBoolean(7,board.isGame());
	            statement.setInt(8,board.getId());//異뷀썑 �닔�젙
	            rowCount = statement.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    

	    
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 : photo�� idea_favorite insert�빐二쇨린 �쐞�빐 idea�뀒�씠釉붿쓽 max媛믪쓣 媛��졇�샂
	    public int maxBoard() {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT Max(id) FROM idea";
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            resultset = statement.executeQuery();
	            if(resultset.next()) {
	                rowCount = resultset.getInt(1);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, resultset);
	        }
	        return rowCount;
	    }
	    
	    // �뀒�씠釉� : idea , 湲곕뒫 :李멸��옄 紐낅떒 以� 李몄뿬 媛쒕컻�옄 蹂닿린 
	    public List<Board> SelectParticipantsBoard(int id) {
	    	List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT u.id, u.nickname, p.type, p.Participate_date "
	        		+ "FROM participants p, user u "
	        		+ "where p.user_id=u.id "
	        		+ "and idea_id=? and type=2";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	              Board board = new Board();
	              board.setId2(resultset.getString("id"));
	              board.setNickname(resultset.getString("nickname"));
	              board.setType(resultset.getInt("type"));
	              board.setRegistration_date(resultset.getString("Participate_date"));
              
              list.add(board);
          }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return list;
	    }
	    // �뀒�씠釉� : idea , 湲곕뒫 :李멸��옄 紐낅떒 以� �떊泥� 媛쒕컻�옄 蹂닿린 
	    public List<Board> SelectTempParticipantsBoard(int id) {
	    	List<Board> list = new ArrayList<Board>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultset = null;
	        String sql = "SELECT u.id, u.nickname, p.type, p.Participate_date "
	        		+ "FROM participants p, user u "
	        		+ "where p.user_id=u.id "
	        		+ "and idea_id=? and type=1";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            resultset = statement.executeQuery();
	            while(resultset.next()) {
	              Board board = new Board();
	              board.setId2(resultset.getString("id"));
	              board.setNickname(resultset.getString("nickname"));
	              board.setType(resultset.getInt("type"));
	              board.setRegistration_date(resultset.getString("Participate_date"));
              
              list.add(board);
          }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return list;
	    }
	    // �뀒�씠釉� : �뙎湲� , 湲곕뒫 :  �뙎湲��궘�젣
	    public int deleteComment(int id) {
	        int rowCount = 0;
	        Connection connection = null;
	        PreparedStatement statement = null;
	        String sql = "DELETE FROM comments where id=?";
	    
	        try {
	            connection = this.getConnection();
	            statement = connection.prepareStatement(sql);
	            statement.setInt(1, id);
	            rowCount = statement.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            this.close(connection, statement, null);
	        }
	        return rowCount;
	    }
	    
	    
	    private Connection getConnection() {
	        Connection connection = null;
	        try {
	            Class.forName(this.driverClassName);
	            connection = DriverManager.getConnection(this.url, this.username, this.password);
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return connection;
	    }
	    
	    private void close(Connection connection, Statement statement, ResultSet resultset) {
	        if(resultset != null) {
	            try {
	                resultset.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if(statement != null) {
	            try {
	                statement.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if(connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }


	
}
