package logging;

public class LogTest1 {
	public void someMethod() {
		Log log = new Log(); //��½�Ʈ�� ����
		log.debug("�α� �׽�Ʈ!"); //�α� ����ϱ�
		log.close(); //��� ��Ʈ�� �ݱ� 
	}
	
	public static void main(String[] args) {
		LogTest1 test = new LogTest1();
		test.someMethod();
	}
}
