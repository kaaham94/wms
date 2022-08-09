package WMS.Overall_status_4.detailStockStatus_07;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("detailStockStatus_07DAO")
public class detailStockStatus_07Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> detailStockStatus_07Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select", map);     
	 }
	
	 public List<Map<String, Object>> detailStockStatus_07Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> detailStockStatus_07Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> detailStockStatus_07Select_STATUS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select_STATUS", map);     
	 }
	 
	 public List<Map<String, Object>> detailStockStatus_07Select_PRTDEMON(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select_PRTDEMON", map);     
	 }
	 
	 public List<Map<String, Object>> detailStockStatus_07Select_REPRINT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select_REPRINT", map);     
	}
	 
	public List<List<Object>> detailStockStatus_07Select_LOC(List<List<Object>> map) throws Exception{
		
		 return (List<List<Object>>)selectList("detailStockStatus_07.detailStockStatus_07Select_LOC", map);     
	}
	
	public Map<String, Object> detailStockStatus_07InsertUpdate_REPRINT(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map, List 객체를 생성한다.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //화면 리턴 값 전달
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis 리턴 값 
		 List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>(); 	//저장 실패 리턴 값 

		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = false;	//insert 가능 검증 여부 리턴 값
		 
		
		 try {
			 //2. list로 for문 돌리면서, map객체로 인자값 저장 후, 메세지 반환  
			 for (Map<String, Object> map : list) {
				 
				 listMap = (Map<String, Object>) selectOne("detailStockStatus_07.detailStockStatus_07InsertUpdate_REPRINT", map);
				 
				 returnMessage += "\n●["+listMap.get("PROCRTNGBN")+"] 바코드: \""+map.get("BARNO")+"\" \n"+listMap.get("PROCRTNMSG");
				 
				 if("OK".equals((String)listMap.get("PROCRTNGBN"))) {
					 result = true;
				 }else {
					 returnValue.add(map);
				 } 
			 } 
			 System.out.println("returnMessage: "+returnMessage);
			 System.out.println("returnValue: "+returnValue);
			
		 }catch (Exception e) {

				e.printStackTrace();
				
				returnMessage = "에러:"+ e.getCause().getMessage();
			
				
		 }finally {
			 //3. 화면에 전달 할 리턴값
			 returnMap.put("value", returnValue);
			 returnMap.put("message", returnMessage);
			 returnMap.put("result", result);
		 }
		 return returnMap;
	}

	 
}
