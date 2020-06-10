package Idea;

public class IdeaState {
	private static String stateArray[] = 
		{"임시저장", "모집 중", "모집 완료", "진행 중", "진행 완료", "개발 중단", "외부 프로젝트"};
	
	public static String getState(int idx) {
		return stateArray[idx];
	}
}
