package WMS.Standard_infomation_1.PDAip_09;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("PDAip_09DAO")
public class PDAip_09Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> PDAip_09Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("PDAip_09.PDAip_09Select", map);     
	 }
	 
	 public List<Map<String, Object>> PDAip_09Select_WERKS(Map<String, Object> map) throws Exception{
		
		 return (List<Map<String, Object>>)selectList("PDAip_09.PDAip_09Select_WERKS", map);     
	 }
	
	 public List<Map<String, Object>> PDAip_09Select_LGORT(Map<String, Object> map) throws Exception{
		
		 return (List<Map<String, Object>>)selectList("PDAip_09.PDAip_09Select_LGORT", map);     
	 }
	 
	 public Map<String, Object> PDAip_09Insert(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map 객체를 생성한다.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //(리턴값을 받을때 사용)
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//(파라미터값을 전달할때 사용)
		 
		 int returnValue = 0; 		//insert 쿼리 적용된 리턴 값 
		 int validation = 0;		//insertCheck 쿼리 리턴 값 
		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = true;		//insert 가능 검증 여부 리턴 값
		
		 try {
			 //2. list로 for문 돌리면서, map객체를 검증 sql에 전달  
			 for (Map<String, Object> map : list) {
				  
			      validation = (Integer) selectOne("PDAip_09.PDAip_09InsertUpdateCheck_IPADDR", map);
			      
			      //3. validation이 0 이상이면 겹치는 키 값이 존재한다.(검증 실패)
			      if(validation > 0) {
			    	 
			    	 listMap.put("IPADDR",  map.get("IPADDR"));
		        	 result = false;
		        	 break;
		          }
			 }
			 
			 //4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 // 검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("PDAip_09.PDAip_09Insert", listMap);
			
				 // 화면 출력 메세지 
				 if(returnValue == -1) {
					 returnMessage = "저장 되지 않았습니다.";
				 }else {
					 returnMessage = returnValue +"줄 저장 되었습니다.";
				 }
			//4.2 결과실행 (검증 실패)
			 }else if(result == false) {
				 returnMessage = "IP값이 일치하는 데이터가 있습니다.\n●IP :"+listMap.get("IPADDR")+"\n다시 수정해주세요.";
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
	 
	 
	 public Map<String, Object> PDAip_09Update(List<Map<String, Object>> list) throws Exception{
		 
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
			 for (Map<String, Object> map : list) {
				 
			      validation = (Integer) selectOne("PDAip_09.PDAip_09InsertUpdateCheck_IPADDR", map);
			      sum_validation += validation;
			      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
			      if(validation == 0) {
			    	 
			    	 listMap.put("IPADDR",  map.get("IPADDR"));
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("PDAip_09.PDAip_09Update", listMap);
				 System.out.println("returnValue:"+returnValue);
				 //화면 출력 메세지 
				 if(returnValue == 0) {
					 returnMessage = "수정 되지 않았습니다.";
				 }else {
					 returnMessage = sum_validation +"줄 수정 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "IP 값이 일치하는 데이터가 없습니다.\n●IP :"+listMap.get("IPADDR")+"\n다시 수정해주세요.";
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
	 
	 public Map<String, Object> PDAip_09Delete(List<Map<String, Object>> list) throws Exception{
		 
			//1. Map 객체를 생성한다. 
			 Map<String, Object> returnMap = new HashMap<String, Object>(); //(리턴값을 받을때 사용)
			 Map<String, Object> listMap = new HashMap<String, Object>();  	//(파라미터값을 전달할때 사용)

			 int returnValue = 0; 		//delete 쿼리 적용된 리턴 값 
			 int validation = 0;		//deleteCheck 쿼리 리턴 값
			 int sum_validation = 0;	//delete 수 리턴값 
			 String returnMessage = ""; //화면 출력 메세지 
			 boolean result = true;		//delete 가능 검증 여부 리턴 값
			
			 try {
				 //2. list로 for문 돌리면서, map객체를 검증 sql에 전달  
				 for (Map<String, Object> map : list) {
					 
				      validation = (Integer) selectOne("PDAip_09.PDAip_09InsertUpdateCheck_IPADDR", map);
				      sum_validation += validation;
				      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
				      if(validation == 0) {
				    	 
				    	 listMap.put("IPADDR",  map.get("IPADDR"));
				    
			        	 result = false;
			        	 break;
			          }
				   //   System.out.println("sum:"+sum_validation);
				 }
				 
				//4.1 결과실행 (검증 합격)
				 if(result == true) {
					
					 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
					 listMap.put("staffList", list);
					 returnValue = (Integer)delete("PDAip_09.PDAip_09Delete", listMap);
					 System.out.println("returnValue:"+returnValue);
					 //화면 출력 메세지 
					 if(returnValue == 0) {
						 returnMessage = "삭제 되지 않았습니다.";
					 }else {
						 returnMessage = sum_validation +"줄 삭제 되었습니다.";
					 }
				
				//4.2 결과실행 (검증 실패)	 
				 }else if(result == false) {
					 returnMessage = "IP 값이 일치하는 데이터가 없습니다.\n●IP :"+listMap.get("IPADDR")+"\n다시 삭제해주세요.";
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
