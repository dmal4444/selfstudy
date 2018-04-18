package uni.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	private Connection conn;
	private static DataSource ds;
	private static String synchronizedCheck = "";
	
	/**
	 * Connect를 하는 함수
	 * @return
	 * @throws NamingException
	 * @throws SQLException
	 */
	public Connection getConnection() throws NamingException, SQLException {
		//Thread들이 여기까지 드어와서 여기서 체크 및 대기를 한다.
		if("".equals(synchronizedCheck)) {
			synchronized (synchronizedCheck) {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				ds = (DataSource) envCtx.lookup("jdbc/orcl");
				synchronizedCheck = "";
				
			}
		}
		try {
			conn = ds.getConnection();
		}catch (NullPointerException e) {
			synchronizedCheck = "";
			getConnection();
		}
		return conn;
			
	}
	/**
	 * PreparedStatement를 생성 후 ResultSet를 반환하는 함수
	 * @param query
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public ResultSet createRsStatement(String query) 
			throws SQLException, NamingException {
		getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = pstmt.executeQuery(query);
		return rs;
	}
	
	/**
	 * connection을 닫는 함수
	 */
	public void close() {
		try {
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}

}
