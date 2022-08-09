package WMS.Standard_infomation_1.code_01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("code_01DAO")
public class code_01Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> noticeSelect(Map<String, Object> map) throws Exception{
		 System.out.println(map);
		 return (List<Map<String, Object>>)selectList("code_01.code_01Select", map);     
	 }
	 
	 public List<Map<String, Object>> code_01Search_CODEGRP() throws Exception{
		
		 return (List<Map<String, Object>>)selectList("code_01.code_01Search_CODEGRP");     
	 }
	
	 
	 public Map<String, Object> code_01Insert_code(List<Map<String, Object>> list) throws Exception{
		
		 //1. Map 객체를 생성한다. 
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //(리턴값을 받을때 사용)
		 Map<String, Object> listMap = new HashMap<String, Object>();  	//(파라미터값을 전달할때 사용)

		 int returnValue = 0; 		//insert 쿼리 적용된 리턴 값 
		 int validation = 0;		//insertCheck 쿼리 리턴 값 
		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = true;		//insert 가능 검증 여부 리턴 값
		
		 
		 try {
			 //2. list로 for문 돌리면서, map객체를 검증 sql에 전달  
			 for (Map<String, Object> map : list) {
				 
			      validation = (Integer) selectOne("code_01.code_01InsertCheck_CODEGRP_CODE", map);
			      
			      //3. validation 이 0 이상이면 겹치는 키 값이 존재한다.(검증 실패)
			      if(validation > 0) {
			    	 
			    	 listMap.put("CODEGRP",  map.get("CODEGRP"));
			    	 listMap.put("CODE",  map.get("CODE"));
		        	 result = false;
		        	 break;
		          }
			 }
			 
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("code_01.A901_SAVE", listMap);
			
				 //화면 출력 메세지 
				 if(returnValue == -1) {
					 returnMessage = "저장 되지 않았습니다.";
				 }else {
					 returnMessage = returnValue +"줄 저장 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "코드종류와 코드값이 일치하는 데이터가 있습니다.\n●코드종류 :"+listMap.get("CODEGRP")+"\n●코드 :"+listMap.get("CODE")+"\n다시 수정해주세요.";
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
	 
	 
	 public Map<String, Object> code_01Insert_codeType(List<Map<String, Object>> list) throws Exception{
		 
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
				  
			      validation = (Integer) selectOne("code_01.code_01InsertCheck_CODEGRP_CODE", map);
			      
			      //3. validation이 0 이상이면 겹치는 키 값이 존재한다.(검증 실패)
			      if(validation > 0) {
			    	 
			    	 listMap.put("CODEGRP",  map.get("CODEGRP"));
		        	 result = false;
		        	 break;
		          }
			 }
			 
			 //4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 // 검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("code_01.A901_SAVE", listMap);
			
				 // 화면 출력 메세지 
				 if(returnValue == -1) {
					 returnMessage = "저장 되지 않았습니다.";
				 }else {
					 returnMessage = returnValue +"줄 저장 되었습니다.";
				 }
			//4.2 결과실행 (검증 실패)
			 }else if(result == false) {
				 returnMessage = "코드종류와 코드값이 일치하는 데이터가 있습니다.\n●코드종류 :"+listMap.get("CODEGRP")+"\n다시 수정해주세요.";
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
	 

	 //(작업중)
	 public Map<String, Object> code_01Update_code(List<Map<String, Object>> list) throws Exception{
		 
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
				 
			      validation = (Integer) selectOne("code_01.code_01InsertCheck_CODEGRP_CODE", map);
			      sum_validation += validation;
			      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
			      if(validation == 0) {
			    	 
			    	 listMap.put("CODEGRP",  map.get("CODEGRP"));
			    	 listMap.put("CODE",  map.get("CODE"));
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)insert("code_01.A901_UPDATE", listMap);
				 System.out.println("returnValue:"+returnValue);
				 //화면 출력 메세지 
				 if(returnValue == 0) {
					 returnMessage = "수정 되지 않았습니다.";
				 }else {
					 returnMessage = sum_validation +"줄 수정 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "코드종류와 코드값이 일치하는 데이터가 없습니다.\n●코드종류 :"+listMap.get("CODEGRP")+"\n●코드 :"+listMap.get("CODE")+"\n다시 수정해주세요.";
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
	 
	 
	 //삭제 하기
	 public Map<String, Object> code_01Delete_code(List<Map<String, Object>> list) throws Exception{
		 
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
				 
			      validation = (Integer) selectOne("code_01.code_01InsertCheck_CODEGRP_CODE", map);
			      sum_validation += validation;
			      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
			      if(validation == 0) {
			    	 
			    	 listMap.put("CODEGRP",  map.get("CODEGRP"));
			    	 listMap.put("CODE",  map.get("CODE"));
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)delete("code_01.code_01Delete", listMap);
				 System.out.println("returnValue:"+returnValue);
				 //화면 출력 메세지 
				 if(returnValue == 0) {
					 returnMessage = "삭제 되지 않았습니다.";
				 }else {
					 returnMessage = sum_validation +"줄 삭제 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "코드종류와 코드값이 일치하는 데이터가 없습니다.\n●코드종류 :"+listMap.get("CODEGRP")+"\n●코드 :"+listMap.get("CODE")+"\n다시 수정해주세요.";
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
