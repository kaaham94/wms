package WMS.Management_of_workers_3.groupAuthority_03;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("groupAuthority_03DAO")
public class groupAuthority_03Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> groupAuthority_03Select_right(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("groupAuthority_03.groupAuthority_03Select_right", map);     
	 }
	 
	 public List<Map<String, Object>> groupAuthority_03Select_left() throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("groupAuthority_03.groupAuthority_03Select_left" );     
	 }
	 
	 public Map<String, Object> groupAuthority_03InsertUpdate(List<Map<String, Object>> list) throws Exception{
		 
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
				 
			      validation = (Integer) selectOne("groupAuthority_03.groupAuthority_03InsertUpdateCheck_IPADDR", map);
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
				 System.out.println("DAO list:"+list);
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				
				 returnValue = (Integer)insert("groupAuthority_03.groupAuthority_03InsertUpdate", listMap);
				 System.out.println("returnValue:"+returnValue);
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
