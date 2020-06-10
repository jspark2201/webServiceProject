package receiveNotification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import util.DatabaseUtil;

public class ReceiveNotificationDAO {
	
	Connection conn = DatabaseUtil.getConnection();
	
	public ArrayList<ReceiveNotificationDTO> getList(int pageNumber) {
		String SQL = "SELECT * FROM RECEIVENOTIFICATION DESC LIMIT 10";
		ArrayList<ReceiveNotificationDTO> list = new ArrayList<ReceiveNotificationDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			while(pstmt.executeQuery().next()) {
				ReceiveNotificationDTO receiveNotificationDTO = new ReceiveNotificationDTO();
				receiveNotificationDTO.setReceiveID(pstmt.executeQuery().getString(1));
				receiveNotificationDTO.setGiveID(pstmt.executeQuery().getString(2));
				receiveNotificationDTO.setGiveEmail(pstmt.executeQuery().getString(3));
				receiveNotificationDTO.setIdeaLink(pstmt.executeQuery().getString(4));
				list.add(receiveNotificationDTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
