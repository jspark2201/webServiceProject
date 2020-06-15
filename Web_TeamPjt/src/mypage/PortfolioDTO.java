package mypage;

public class PortfolioDTO {
	private int bbs_id;
	private String bbs_title;
	private String userID;
	private String registrationDate;
	private String completeDate;
	private String projectUrl;
	private int state;
	private int participantsNumber;
	private String requirement;
	private String bbsContent;
	private String pictsrc;
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}
	public String getProjectUrl() {
		return projectUrl;
	}
	public void setProjectUrl(String projectUrl) {
		this.projectUrl = projectUrl;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getParticipantsNumber() {
		return participantsNumber;
	}
	public void setParticipantsNumber(int participantsNumber) {
		this.participantsNumber = participantsNumber;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public String getPictsrc() {
		return pictsrc;
	}
	public void setPictsrc(String pictsrc) {
		this.pictsrc = pictsrc;
	}
	
	
}
