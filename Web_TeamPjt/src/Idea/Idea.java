package Idea;

public class Idea {
	private int id;
	private String writer;
	private String title;
	private String content;
	private String requirements;
	private String registration_date;
	private String complete_date;
	private int number_participants;
	private String url;
	private int stateIdx;
	private String state;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRequirements() {
		return requirements;
	}
	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	public String getComplete_date() {
		return complete_date;
	}
	public void setComplete_date(String complete_date) {
		this.complete_date = complete_date;
	}
	public int getNumber_participants() {
		return number_participants;
	}
	public void setNumber_participants(int number_participants) {
		this.number_participants = number_participants;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getStateIdx() {
		return stateIdx;
	}
	public void setStateIdx(int stateIdx) {
		this.stateIdx = stateIdx;
	}
	
	public String getState() {
		return IdeaState.getState(this.stateIdx);
	}

	
}
