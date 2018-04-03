package uni.dao;

import java.io.BufferedInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;

import uni.connection.DBConnection;

public class tableDAO {
	
	/**
	 * 테이블의 컬럼정보를 받아오는 함수
	 * @param tableName
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public HashMap<String, ArrayList> getCollumnInfo(String tableName) 
			throws SQLException, NamingException{
		DBConnection db = new DBConnection();
		String query ="SELECT * FROM "+tableName;
		ResultSet rs = db.createRsStatement(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		
		int cols = rsmd.getColumnCount();
		HashMap<String, ArrayList> mp = new HashMap<String, ArrayList>();
		ArrayList<String> nameList = new ArrayList<String>();
		ArrayList<String> typeNameList = new ArrayList<String>();
		ArrayList<Integer> sizeList = new ArrayList<Integer>();
		
		for (int colIdx = 1; colIdx <= cols; colIdx++) {
			String name = rsmd.getColumnName(colIdx);
			nameList.add(name);
			
			String typeName = rsmd.getColumnTypeName(colIdx);
			typeNameList.add(typeName);
			
			int size = rsmd.getColumnDisplaySize(colIdx);
			sizeList.add(size);
			
			mp.put("name", nameList);
			mp.put("typeName", typeNameList);
			mp.put("size", sizeList);
			
		}
		
		db.close();
		
		return mp;

	}
	
	/**
	 * 테이블의 데이터를 받아오는 함수
	 * @param tableName
	 * @param map
	 * @return
	 */
	public HashMap getTableInfo(String tableName, HashMap map) {
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		try {
			DBConnection db = new DBConnection();
			String query = "SELECT * FROM "+tableName;
			
			ResultSet rs = db.createRsStatement(query);
			ArrayList<String> keyList = (ArrayList)map.get("name");
			ArrayList<String> nameTypeList = (ArrayList)map.get("typeName");
			
			int size = keyList.size();
			
			//List를 여러개 생성해준다.
			List<List<Object>> lists = new ArrayList<List<Object>>();
			for (int i = 0; i< size; i++) {
				List<Object> list = new ArrayList<Object>();
				lists.add(list);
			}
			
			String name ="";
			for(int k=0; k<size; k++) {
				rs.beforeFirst();
				//rs.next()는 커서를 한단ㄱㅖ 움직인 다음에 실행되기 때문에
				//첫번째 데이터를 스킵하게 된다.
				do {
					if(!rs.next()) {
						break;
						
					}
					else if(nameTypeList.get(k) == "BLOB") {
						rs.beforeFirst();
						while(rs.next()) {
							name = (String)keyList.get(k);
							Blob blob = rs.getBlob(name);
							BufferedInputStream in = new BufferedInputStream(blob.getBinaryStream());
							int nFileSize = (int)blob.length();
							byte[] buf = new byte [nFileSize];
							int nReadSize = in.read(buf, 0, nFileSize);
							in.close();
							//Contents -> BLOB 데이터가 저장될 String
							String contents = new String(buf);
							
							lists.get(k).add(contents);
							
						}
					}
					else {
						name = (String)keyList.get(k);
						String value = rs.getString(name);
						lists.get(k).add(value);
						rs.previous();
					}
					
				}while(rs.next());
				dataMap.put(name, lists.get(k));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataMap;
		
	}
	
	/**
	 * 테이블의 존재여부를 확인하는 함수
	 * @param tableName
	 * @return
	 * @throws NamingException
	 * @throws SQLException
	 */
	public Boolean checkTable(String tableName) 
			throws NamingException, SQLException {
		
		DBConnection db = new DBConnection();
		Connection c = db.getConnection();
		DatabaseMetaData dbm = c.getMetaData();
		ResultSet rs = dbm.getTables(null, null, tableName.toUpperCase(), null);
		
		Boolean result = true;
		if(rs.next()) {
			//테이블이 존재한다.
			result = true;
		}
		else {
			//테이블이 존재하지 않는다.
			result = false;
		}
		db.close();
		return result;
			
	}
	
	public int doSomething(int num) {
		
		return num;
	}

}
