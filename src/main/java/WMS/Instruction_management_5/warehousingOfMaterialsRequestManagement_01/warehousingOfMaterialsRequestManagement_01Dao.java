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
		 
		//1. Map 객체를 생성한다. 
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //(리턴값을 받을때 사용)
		 Map<String, Object> listMap = new HashMap<String, Object>();  	//(파라미터값을 전달할때 사용)
		 
		 int returnValue = 0; 		//update 쿼리 적용된 리턴 값 
		 
		 int validation = 0;		//updateCheck 쿼리 리턴 값
		 int sum_validation = 0;	//update 수 리턴값 
		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = true;		//update 가능 검증 여부 리턴 값
		
		 try {
			 //2. list로 for문 돌리면서, map객체를 검증 sql에 전달  
			 /*
			 for (Map<String, Object> map : list) {
				 
			      validation = (Integer) selectOne("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01InsertUpdateCheck_IPADDR", map);
			      sum_validation += validation;
			      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
			      if(validation == 0) {
			    	 
			    	 listMap.put("IPADDR",  map.get("IPADDR"));
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 */
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				// System.out.println("DAO list:"+list);
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 listMap.put("check",(String)list.get(0).get("check"));
				 listMap.put("MANDT",(String)list.get(0).get("MANDT"));
				 listMap.put("USERID",(String)list.get(0).get("USERID"));
		
				 returnValue = (Integer)insert("warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01InsertUpdate", listMap);
				// System.out.println("returnValue:"+returnValue);
				 
				 //화면 출력 메세지 
				 if(returnValue == 0) {
					 returnMessage = "저장 되지 않았습니다.";
				 }else {
					 returnMessage = "저장 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "저장 실패하였습니다. \n다시 저장해주세요.";
			 }
		 
		 }catch (Exception e) {
				e.printStackTrace();
				
				returnMessage = "에러:"+ e.getCause().getMessage();
				result = false;
				
		 }finally {
			 //5. 화면에 전달 할 리턴값
			 returnMap.put("message", returnMessage);
			 returnMap.put("result", result);
		 }
		 return returnMap;
	 }	 
}
