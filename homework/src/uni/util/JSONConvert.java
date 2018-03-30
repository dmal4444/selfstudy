package uni.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import oracle.net.aso.e;

public class JSONConvert {

	public static StringBuffer changeToJson(HashMap mapData, String tableName) {
		//Map을 반복할 준비를 한다.
		Set set = mapData.keySet();
		Iterator<e> it = set.iterator();
		
		String key = "";
		ArrayList value = null;
		int index = 1;
		
		//key값을 모르는 상태에서 value의 데이터 갯수 구하기
		while(it.hasNext()) {
			key = "" + it.next();
			value = (ArrayList)mapData.get(key);
					
		}
		it = set.iterator();
		
		//JSON형식으로 출력한 Stirngbuffer를 준비한다.
		StringBuffer sb = new StringBuffer();
		sb.append("{\"" + tableName + "\" :[ ");
		
		for(int i=0; i<value.size(); i++) {
			while(it.hasNext()) {
				key = "" + it.next();
				value = (ArrayList)mapData.get(key);
				
				//index가 마지막 index를 가르킬 때
				if(index == set.size()) {
					//동시에 반복문의 마지막을 가르킬 때
					if(i == value.size()-1) {
						sb.append("\""+key+"\" : \""+value.get(i)+"\"}");
					}else {
						sb.append("\""+key+"\" : \""+value.get(i)+"\"}, ");
					}
				}
					
				//index의 가장 첫번째 데이터를 가르킬 때
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

