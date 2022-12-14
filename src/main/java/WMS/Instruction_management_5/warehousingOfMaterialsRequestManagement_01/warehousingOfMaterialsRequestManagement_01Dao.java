package WMS.Instruction_management_5.warehousingOfMaterialsRequestManagement_01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("warehousingOfMaterialsRequestManagement_01DAO")
public class warehousingOfMaterialsRequestManagement_01Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_right(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_right", map);     
	 }
	 
	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_bottom(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_bottom", map);     
	 }
	 
	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_left(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_left", map);     
	 }
	 
	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_CUSTCD(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_CUSTCD", map);     
	 }
	 
	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LIFNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_LIFNR", map);     
	 }
	 
	 public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LFART(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_LFART", map);     
	 }

	public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_OUTCUST(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Select_OUTCUST", map);     
	}	
	 
	 public Map<String, Object> warehousingOfMaterialsRequestManagement_01InsertUpdate(List<Map<String, Object>> list) throws Exception{
		 
		//1. Map ????????? ????????????. 
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //(???????????? ????????? ??????)
		 Map<String, Object> listMap = new HashMap<String, Object>();  	//(?????????????????? ???????????? ??????)
		 
		 int returnValue = 0; 		//update ?????? ????????? ?????? ??? 
		 
		 int validation = 0;		//updateCheck ?????? ?????? ???
		 int sum_validation = 0;	//update ??? ????????? 
		 String returnMessage = ""; //?????? ?????? ????????? 
		 boolean result = true;		//update ?????? ?????? ?????? ?????? ???
		
		 try {
			 //2. list??? for??? ????????????, map????????? ?????? sql??? ??????  
			 /*
			 for (Map<String, Object> map : list) {
				 
			      validation = (Integer) selectOne("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01InsertUpdateCheck_IPADDR", map);
			      sum_validation += validation;
			      //3. validation ??? 0 ?????? ????????? ???????????? ??????.(?????? ??????)
			      if(validation == 0) {
			    	 
			    	 listMap.put("IPADDR",  map.get("IPADDR"));
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 */
			//4.1 ???????????? (?????? ??????)
			 if(result == true) {
				// System.out.println("DAO list:"+list);
				 //?????? ????????? list????????? map????????? ?????? ?????? ?????? ??????.
				 listMap.put("staffList", list);
				 listMap.put("check",(String)list.get(0).get("check"));
				 listMap.put("MANDT",(String)list.get(0).get("MANDT"));
				 listMap.put("USERID",(String)list.get(0).get("USERID"));
		
				 returnValue = (Integer)insert("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01InsertUpdate", listMap);
				// System.out.println("returnValue:"+returnValue);
				 
				 //?????? ?????? ????????? 
				 if(returnValue == 0) {
					 returnMessage = "?????? ?????? ???????????????.";
				 }else {
					 returnMessage = "?????? ???????????????.";
				 }
			
			//4.2 ???????????? (?????? ??????)	 
			 }else if(result == false) {
				 returnMessage = "?????? ?????????????????????. \n?????? ??????????????????.";
			 }
		 
		 }catch (Exception e) {
				e.printStackTrace();
				
				returnMessage = "??????:"+ e.getCause().getMessage();
				result = false;
				
		 }finally {
			 //5. ????????? ?????? ??? ?????????
			 returnMap.put("message", returnMessage);
			 returnMap.put("result", result);
		 }
		 return returnMap;
	 }	 
}
