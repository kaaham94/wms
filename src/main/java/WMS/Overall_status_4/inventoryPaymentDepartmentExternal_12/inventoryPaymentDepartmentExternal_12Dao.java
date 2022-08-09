package WMS.Overall_status_4.inventoryPaymentDepartmentExternal_12;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("inventoryPaymentDepartmentExternal_12DAO")
public class inventoryPaymentDepartmentExternal_12Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_left(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12Select_left", map);     
	 }
	
	 public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_right_total(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12Select_right_total", map);     
	 }
	
	 
	 public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12Select_LGORT", map);     
	 }
	 
	 public List<List<Object>> inventoryPaymentDepartmentExternal_12Select_CUST(Map<String, Object> map) throws Exception{
		 
		 return (List<List<Object>>) selectList("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12Select_CUST", map);     
	 }
	 
	 public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12InsertUpdate(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map, List 객체를 생성한다.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //화면 리턴 값 전달
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis 리턴 값 
		 List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>(); 	//저장 실패 리턴 값 
	
		// String returnMessage = ""; //화면 출력 메세지 
		// boolean result = false;	//insert 가능 검증 여부 리턴 값
		 
		
		 try {
			 //2. list로 for문 돌리면서, map객체로 인자값 저장 후, 메세지 반환  
			 for (Map<String, Object> map : list) {
				 
			     listMap = (Map<String, Object>) selectOne("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12InsertUpdate", map);
			     
			     //returnMessage += "\n●["+listMap.get("PROCRTNGBN")+"] \"거래처: "+map.get("CUSTCD")+"\", \"라벨종류: "+map.get("CTYPE")+"\" \n"+listMap.get("PROCRTNMSG");
			     
			     //if("OK".equals((String)listMap.get("PROCRTNGBN"))) {
			     //	 result = true;
			     //}else {
			     //	 returnValue.add(map);
			     //} 
			     returnValue.add(listMap);
			 } 
			// System.out.println("returnMessage: "+returnMessage);
			 System.out.println("returnValue: "+returnValue);
			
		 }catch (Exception e) {

				e.printStackTrace();
				
				//returnMessage = "에러:"+ e.getCause().getMessage();
			
				
		 }finally {
			 //3. 화면에 전달 할 리턴값
			 returnMap.put("value", returnValue);
			 //returnMap.put("message", returnMessage);
			 //returnMap.put("result", result);
		 }
		 return returnValue;
	 }
	 
}
