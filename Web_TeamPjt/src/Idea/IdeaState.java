package Idea;

public class IdeaState {
	private static String stateArray[] = 
		{"�ӽ�����", "���� ��", "���� �Ϸ�", "���� ��", "���� �Ϸ�", "���� �ߴ�", "�ܺ� ������Ʈ"};
	
	public static String getState(int idx) {
		return stateArray[idx];
	}
}
