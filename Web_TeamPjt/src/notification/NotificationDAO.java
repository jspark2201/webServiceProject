package notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import util.DatabaseUtil;

public class NotificationDAO {
	
	Connection conn = DatabaseUtil.getConnection();
	
	public ArrayList<NotificationDTO> getList(int pageNumber) {
		String SQL = "SELECT * FROM NOTIFICATION DESC LIMIT 10";
		ArrayList<NotificationDTO> list = new ArrayList<NotificationDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			while(pstmt.executeQuery().next()) {
				NotificationDTO receiveNotificationDTO = new NotificationDTO();
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
