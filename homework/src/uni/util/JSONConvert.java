package uni.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import oracle.net.aso.e;

public class JSONConvert {

	public static StringBuffer changeToJson(HashMap mapData, String tableName) {
		//Map�� �ݺ��� �غ� �Ѵ�.
		Set set = mapData.keySet();
		Iterator<e> it = set.iterator();
		
		String key = "";
		ArrayList value = null;
		int index = 1;
		
		//key���� �𸣴� ���¿��� value�� ������ ���� ���ϱ�
		while(it.hasNext()) {
			key = "" + it.next();
			value = (ArrayList)mapData.get(key);
					
		}
		it = set.iterator();
		
		//JSON�������� ����� Stirngbuffer�� �غ��Ѵ�.
		StringBuffer sb = new StringBuffer();
		sb.append("{\"" + tableName + "\" :[ ");
		
		for(int i=0; i<value.size(); i++) {
			while(it.hasNext()) {
				key = "" + it.next();
				value = (ArrayList)mapData.get(key);
				
				//index�� ������ index�� ����ų ��
				if(index == set.size()) {
					//���ÿ� �ݺ����� �������� ����ų ��
					if(i == value.size()-1) {
						sb.append("\""+key+"\" : \""+value.get(i)+"\"}");
					}else {
						sb.append("\""+key+"\" : \""+value.get(i)+"\"}, ");
					}
				}
					
				//index�� ���� ù��° �����͸� ����ų ��
				else if(index == 1) {
					sb.append("{\""+key+"\" : \""+value.get(i)+"\",");
					index++;
				}
				else {
					sb.append("\""+key+"\" : \""+value.get(i)+"\", ");
					index++;
				}
			}
			index = 1;
			it = set.iterator();
		}
		sb.append("]}");
		return sb;
	}
}

