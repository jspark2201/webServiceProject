package Idea;

public class IdeaState {
	private static String stateArray[] = 
		{"���� ��", "���� �Ϸ�", "���� �Ϸ�", "���� �ߴ�", "�ܺ� ������Ʈ"};
	
	public static String getState(int idx) {
		return stateArray[idx];
	}
}
