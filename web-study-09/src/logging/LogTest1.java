package logging;

public class LogTest1 {
	public void someMethod() {
		Log log = new Log(); //출력스트림 생성
		log.debug("로그 테스트!"); //로그 기록하기
		log.close(); //출력 스트림 닫기 
	}
	
	public static void main(String[] args) {
		LogTest1 test = new LogTest1();
		test.someMethod();
	}
}
