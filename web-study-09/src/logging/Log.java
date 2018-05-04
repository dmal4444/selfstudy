package logging;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class Log {
	String logFile = "C:/debug/debug.log";
	FileWriter fw;
	static final String ENTER = System.getProperty("line.separator");
	
	public Log() {
		try {
			fw = new FileWriter(logFile, true);
		} catch (IOException e) {
			
		}
	}
	
	public void close() {
		try {
			fw.close();
		} catch (IOException e) {
			
		}
	}
	
	public void debug(String msg) {
		try {
			fw.write(new Date()+" : ");
			fw.write(msg + ENTER);
			fw.flush();
		} catch (IOException e) {
			System.err.println("IOEXception!");
		}
	}
}
