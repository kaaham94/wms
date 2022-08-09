package WMS.System_management_2.menu_02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("menu_02DAO")
public class menu_02Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> menu_02Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("menu_02.menu_02Select", map);     
	 }
	 
	 public List<Map<String, Object>> menu_02Select_SearchMENUNAME(Map<String, Object> map) throws Exception{
		
		 return (List<Map<String, Object>>)selectList("menu_02.menu_02Select_SearchMENUNAME", map);     
	 }
	 
	 public List<Map<String, Object>> menu_02Select_GridMENUNAME(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("menu_02.menu_02Select_GridMENUNAME", map);     
	 }
	 
	 public List<Map<String, Object>> menu_02Select_LEVEL(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("menu_02.menu_02Select_LEVEL", map);     
	 }
	
	 public Map<String, Object> menu_02Insert(List<Map<String, Object>> list) throws Exception{
		 
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
				  
				  validation = (Integer) selectOne("menu_02.menu_02InsertUpdateCheck_MENUID", map);
				  
				  //3. validation이 0 이상이면 겹치는 키 값이 존재한다.(검증 실패)
				  if(validation > 0) {
					 
					 listMap.put("MENUID",  map.get("MENUID"));
					 result = false;
					 break;
				  }
			 }
			 
			 //4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 // 검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("menu_02.menu_02Insert", listMap);
			
				 // 화면 출력 메세지 
				 if(returnValue == -1) {
					 returnMessage = "저장 되지 않았습니다.";
				 }else {
					 returnMessage = returnValue +"줄 저장 되었습니다.";
				 }
			//4.2 결과실행 (검증 실패)
			 }else if(result == false) {
				 returnMessage = "메뉴ID 값이 일치하는 데이터가 있습니다.\n●메뉴ID :"+listMap.get("MENUID")+"\n다시 저장해주세요.";
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
	 
	 
	 public Map<String, Object> menu_02Update(List<Map<String, Object>> list) throws Exception{
		 
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
				 
			      validation = (Integer) selectOne("menu_02.menu_02InsertUpdateCheck_MENUID", map);
			      sum_validation += validation;
			      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
			      if(validation == 0) {
			    	 
			    	 listMap.put("MENUID",  map.get("MENUID"));
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("menu_02.menu_02Update", listMap);
				 System.out.println("returnValue:"+returnValue);
				 //화면 출력 메세지 
				 if(returnValue == 0) {
					 returnMessage = "수정 되지 않았습니다.";
				 }else {
					 returnMessage = sum_validation +"줄 수정 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "메뉴ID 값이 일치하는 데이터가 없습니다.\n●메뉴ID :"+listMap.get("MENUID")+"\n다시 수정해주세요.";
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

	 public Map<String, Object> menu_02Delete(List<Map<String, Object>> list) throws Exception{
		 
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
					 
				      validation = (Integer) selectOne("menu_02.menu_02InsertUpdateCheck_MENUID", map);
				      sum_validation += validation;
				      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
				      if(validation == 0) {
				    	 
				    	 listMap.put("MENUID",  map.get("MENUID"));
				    
			        	 result = false;
			        	 break;
			          }
				   //   System.out.println("sum:"+sum_validation);
				 }
				 
				//4.1 결과실행 (검증 합격)
				 if(result == true) {
					
					 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
					 listMap.put("staffList", list);
					 returnValue = (Integer)delete("menu_02.menu_02Delete", listMap);
					
					 //화면 출력 메세지 
					 if(returnValue == 0) {
						 returnMessage = "삭제 되지 않았습니다.";
					 }else {
						 returnMessage = sum_validation +"줄 삭제 되었습니다.";
					 }
				
				//4.2 결과실행 (검증 실패)	 
				 }else if(result == false) {
					 returnMessage = "메뉴ID 값이 일치하는 데이터가 없습니다.\n●메뉴ID :"+listMap.get("MENUID")+"\n다시 삭제해주세요.";
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
