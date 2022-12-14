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
		 
		 //1. Map, List ????????? ????????????.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //?????? ?????? ??? ??????
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis ?????? ??? 
		 List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>(); 	//?????? ?????? ?????? ??? 
	
		// String returnMessage = ""; //?????? ?????? ????????? 
		// boolean result = false;	//insert ?????? ?????? ?????? ?????? ???
		 
		
		 try {
			 //2. list??? for??? ????????????, map????????? ????????? ?????? ???, ????????? ??????  
			 for (Map<String, Object> map : list) {
				 
			     listMap = (Map<String, Object>) selectOne("inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12InsertUpdate", map);
			     
			     //returnMessage += "\n???["+listMap.get("PROCRTNGBN")+"] \"?????????: "+map.get("CUSTCD")+"\", \"????????????: "+map.get("CTYPE")+"\" \n"+listMap.get("PROCRTNMSG");
			     
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
				
				//returnMessage = "??????:"+ e.getCause().getMessage();
			
				
		 }finally {
			 //3. ????????? ?????? ??? ?????????
			 returnMap.put("value", returnValue);
			 //returnMap.put("message", returnMessage);
			 //returnMap.put("result", result);
		 }
		 return returnValue;
	 }
	 
}
