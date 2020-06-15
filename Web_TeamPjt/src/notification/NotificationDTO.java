package notification;

public class NotificationDTO {
	private int notiNumber;
	private String receiveID;
	private String giveID;
	private String giveEmail;
	private String ideaTitle;
	public String getIdeaTitle() {
		return ideaTitle;
	}
	public void setIdeaTitle(String ideaTitle) {
		this.ideaTitle = ideaTitle;
	}
	private String ideaLink;
	
	public int getNotiNumber() {
		return notiNumber;
	}
	public void setNotiNumber(int notiNumber) {
		this.notiNumber = notiNumber;
	}
	public String getReceiveID() {
		return receiveID;
	}
	public void setReceiveID(String receiveID) {
		this.receiveID = receiveID;
	}
	public String getGiveID() {
		return giveID;
	}
	public void setGiveID(String giveID) {
		this.giveID = giveID;
	}
	public String getGiveEmail() {
		return giveEmail;
	}
	public void setGiveEmail(String giveEmail) {
		this.giveEmail = giveEmail;
	}
	public String getIdeaLink() {
		return ideaLink;
	}
	public void setIdeaLink(String ideaLink) {
		this.ideaLink = ideaLink;
	}
	
	
}
