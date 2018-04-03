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
	 * ���̺��� �÷������� �޾ƿ��� �Լ�
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
	 * ���̺��� �����͸� �޾ƿ��� �Լ�
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
			
			//List�� ������ �������ش�.
			List<List<Object>> lists = new ArrayList<List<Object>>();
			for (int i = 0; i< size; i++) {
				List<Object> list = new ArrayList<Object>();
				lists.add(list);
			}
			
			String name ="";
			for(int k=0; k<size; k++) {
				rs.beforeFirst();
				//rs.next()�� Ŀ���� �Ѵܤ��� ������ ������ ����Ǳ� ������
				//ù��° �����͸� ��ŵ�ϰ� �ȴ�.
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
							//Contents -> BLOB �����Ͱ� ����� String
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
	 * ���̺��� ���翩�θ� Ȯ���ϴ� �Լ�
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
			//���̺��� �����Ѵ�.
			result = true;
		}
		else {
			//���̺��� �������� �ʴ´�.
			result = false;
		}
		db.close();
		return result;
			
	}
	
	public int doSomething(int num) {
		
		return num;
	}

}
