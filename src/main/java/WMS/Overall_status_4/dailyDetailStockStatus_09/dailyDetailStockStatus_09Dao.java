package WMS.Overall_status_4.dailyDetailStockStatus_09;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("dailyDetailStockStatus_09DAO")
public class dailyDetailStockStatus_09Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> dailyDetailStockStatus_09Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select", map);     
	 }
	
	 public List<Map<String, Object>> dailyDetailStockStatus_09Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> dailyDetailStockStatus_09Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> dailyDetailStockStatus_09Select_STATUS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select_STATUS", map);     
	 }
	 
	 public List<Map<String, Object>> dailyDetailStockStatus_09Select_PRTDEMON(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select_PRTDEMON", map);     
	 }
	 
	 public List<Map<String, Object>> dailyDetailStockStatus_09Select_REPRINT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select_REPRINT", map);     
	}
	 
	public List<List<Object>> dailyDetailStockStatus_09Select_LOC(List<List<Object>> map) throws Exception{
		
		 return (List<List<Object>>)selectList("dailyDetailStockStatus_09.dailyDetailStockStatus_09Select_LOC", map);     
	}
	
	public Map<String, Object> dailyDetailStockStatus_09InsertUpdate_REPRINT(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map, List ????????? ????????????.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //?????? ?????? ??? ??????
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis ?????? ??? 
		 List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>(); 	//?????? ?????? ?????? ??? 

		 String returnMessage = ""; //?????? ?????? ????????? 
		 boolean result = false;	//insert ?????? ?????? ?????? ?????? ???
		 
		
		 try {
			 //2. list??? for??? ????????????, map????????? ????????? ?????? ???, ????????? ??????  
			 for (Map<String, Object> map : list) {
				 
				 listMap = (Map<String, Object>) selectOne("dailyDetailStockStatus_09.dailyDetailStockStatus_09InsertUpdate_REPRINT", map);
				 
				 returnMessage += "\n???["+listMap.get("PROCRTNGBN")+"] ?????????: \""+map.get("BARNO")+"\" \n"+listMap.get("PROCRTNMSG");
				 
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
				
				returnMessage = "??????:"+ e.getCause().getMessage();
			
				
		 }finally {
			 //3. ????????? ?????? ??? ?????????
			 returnMap.put("value", returnValue);
			 returnMap.put("message", returnMessage);
			 returnMap.put("result", result);
		 }
		 return returnMap;
	}

	 
}
