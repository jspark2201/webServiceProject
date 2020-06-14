package note;

public class NoteDTO {
	private int noteNumber;
	private String receiveID;
	private String giveID;
	private String giveEmail;
	private String title;
	private String comment;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNoteNumber() {
		return noteNumber;
	}
	public void setNoteNumber(int noteNumber) {
		this.noteNumber = noteNumber;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
