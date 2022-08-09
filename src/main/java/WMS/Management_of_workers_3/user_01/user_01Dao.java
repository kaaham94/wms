package WMS.Management_of_workers_3.user_01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("user_01DAO")
public class user_01Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> user_01Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("user_01.user_01Select", map);     
	 }
	
	 public Map<String, Object> user_01InsertUpdate(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map, List 객체를 생성한다.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //화면 리턴 값 전달
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis 리턴 값 
		 List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>(); 	//저장 실패 리턴 값 
	
		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = false;	//insert 가능 검증 여부 리턴 값
		 
		
		 try {
			 //2. list로 for문 돌리면서, map객체로 인자값 저장 후, 메세지 반환  
			 for (Map<String, Object> map : list) {
				 
			     listMap = (Map<String, Object>) selectOne("user_01.user_01InsertUpdate", map);
			     
			     returnMessage += "\n●["+listMap.get("PROCRTNGBN")+"] 사번: \""+map.get("USERID")+"\" \n"+listMap.get("PROCRTNMSG");
			     
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

	 public List<Map<String, Object>> user_01Select_WERKS(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_WERKS", map);     
	 }
	
	 public List<Map<String, Object>> user_01Select_DEPT(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_DEPT", map);     
	 }
	
	 public List<Map<String, Object>> user_01Select_STAT2(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_STAT2", map);     
	 }
	
	 public List<Map<String, Object>> user_01Select_WKCOD(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_WKCOD", map);     
	 }
	
	 public List<Map<String, Object>> user_01Select_JKCOD(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_JKCOD", map);     
	 }
	
	 public List<Map<String, Object>> user_01Select_STYPE(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_STYPE", map);     
	 }
	 
	 public List<Map<String, Object>> user_01Select_AUTH(Map<String, Object> map) throws Exception{
			
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_AUTH", map);     
	 }
	 
	 public List<Map<String, Object>> user_01Select_LGORT(Map<String, Object> map) throws Exception{
			
		return (List<Map<String, Object>>)selectList("user_01.user_01Select_LGORT", map);     
	 }

	//삭제 하기
	 public Map<String, Object> user_01Delete(List<Map<String, Object>> list) throws Exception{
		 
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
				 
			      validation = (Integer) selectOne("user_01.user_01DeleteCheck_USERID", map);
			      sum_validation += validation;
			      //3. validation 이 0 이면 적용할 데이터가 없다.(검증 실패)
			      if(validation == 0) {
			    	 
			    	 listMap.put("USERID",  map.get("USERID"));
			    
		        	 result = false;
		        	 break;
		          }
			   //   System.out.println("sum:"+sum_validation);
			 }
			 
			//4.1 결과실행 (검증 합격)
			 if(result == true) {
				
				 //검증 합격된 list객체를 map객체에 넣고 저장 쿼리 실행.
				 listMap.put("staffList", list);
				 returnValue = (Integer)delete("user_01.user_01Delete", listMap);
				 System.out.println("returnValue:"+returnValue);
				 //화면 출력 메세지 
				 if(returnValue == 0) {
					 returnMessage = sum_validation +"줄 삭제 되었습니다.";
				 }
			
			//4.2 결과실행 (검증 실패)	 
			 }else if(result == false) {
				 returnMessage = "사번 값이 일치하는 데이터가 없습니다.\n●사번 :"+listMap.get("USERID")+"\n다시 삭제해주세요.";
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
	 
	 
	//암호 초기화 하기
public Map<String, Object> user_01PasswordReset(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map, List 객체를 생성한다.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //화면 리턴 값 전달
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis 리턴 값 
		 int returnValue = 0; 		//delete 쿼리 적용된 리턴 값 
		 int validation = 0;		//deleteCheck 쿼리 리턴 값
		 int sum_validation = 0;	//delete 수 리턴값 
		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = true;		//delete 가능 검증 여부 리턴 값
		 
		
		 try {
			 //2. list로 for문 돌리면서, map객체로 인자값 저장 후, 메세지 반환  
			 for (Map<String, Object> map : list) {
				 
				 validation = (Integer) update("user_01.user_01Update_PWD_INIT", map);
			     System.out.println("validation:"+validation);
			     sum_validation += validation;
			    
			    /*  
			     if("OK".equals((String)listMap.get("PROCRTNGBN"))) {
			    	 result = true;
			     }else {
			    	 returnValue.add(map);
			     } 
				 */
			 } 
			 if(sum_validation != 0) {
				 returnMessage = sum_validation +"줄 초기화 되었습니다.";
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
	 
	 /*
	 <!-- 저장위치 -->    
     <select id="user_01Select_LGORT" parameterType="hashmap" resultType="hashmap" >
		<choose>
			<when test='WERKS !=null  and  WERKS !=""'>
				SELECT '[' + LGORT + '] ' + isnull(SLNAME,'')  AS SLNAME
	    			,LGORT
				FROM TM_STORELOC with (nolock) 
				WHERE MANDT = #{MANDT}
					AND	WERKS = #{WERKS}			--법인코드
					AND USEFLAG = 'Y' 
				UNION
				SELECT '',''
				ORDER BY LGORT   
			</when>
			<otherwise>
				SELECT '' AS SLNAME, '' AS LGORT
			</otherwise>
		</choose>
	</select>
	*/
}
