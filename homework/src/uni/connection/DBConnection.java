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
	 * Connect�� �ϴ� �Լ�
	 * @return
	 * @throws NamingException
	 * @throws SQLException
	 */
	public Connection getConnection() throws NamingException, SQLException {
		//Thread���� ������� ���ͼ� ���⼭ üũ �� ��⸦ �Ѵ�.
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
	 * PreparedStatement�� ���� �� ResultSet�� ��ȯ�ϴ� �Լ�
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
	 * connection�� �ݴ� �Լ�
	 */
	public void close() {
		try {
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}

}
