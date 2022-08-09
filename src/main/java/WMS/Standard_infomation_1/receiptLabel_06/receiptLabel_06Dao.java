package WMS.Standard_infomation_1.receiptLabel_06;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("receiptLabel_06DAO")
public class receiptLabel_06Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> receiptLabel_06Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("receiptLabel_06.receiptLabel_06Select", map);     
	 }
	
	 public List<Map<String, Object>> receiptLabel_06Select_VIEWIMAGE(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("receiptLabel_06.receiptLabel_06Select_VIEWIMAGE", map);     
	 }	
	 
	 public List<Map<String, Object>> receiptLabel_06Select_BARTYPE(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("receiptLabel_06.receiptLabel_06Select_BARTYPE", map);     
	 }	
	 
	 public List<Map<String, Object>> receiptLabel_06Select_CUSTCD(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("receiptLabel_06.receiptLabel_06Select_CUSTCD", map);     
	 }
	 
	 public List<Map<String, Object>> receiptLabel_06Select_SDATETYPE(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("receiptLabel_06.receiptLabel_06Select_SDATETYPE", map);     
	 }
	 
	public Map<String, Object> receiptLabel_06InsertUpdate(List<Map<String, Object>> list) throws Exception{
		 
		 //1. Map, List 객체를 생성한다.
		 Map<String, Object> returnMap = new HashMap<String, Object>(); //화면 리턴 값 전달
		 Map<String, Object> listMap = new HashMap<String, Object>(); 	//mybatis 리턴 값 
		 List<Map<String, Object>> returnValue = new ArrayList<Map<String, Object>>(); 	//저장 실패 리턴 값 
	
		 String returnMessage = ""; //화면 출력 메세지 
		 boolean result = false;	//insert 가능 검증 여부 리턴 값
		 
		
		 try {
			 //2. list로 for문 돌리면서, map객체로 인자값 저장 후, 메세지 반환  
			 for (Map<String, Object> map : list) {
				 
			     listMap = (Map<String, Object>) selectOne("receiptLabel_06.receiptLabel_06InsertUpdate", map);
			     
			     returnMessage += "\n●["+listMap.get("PROCRTNGBN")+"] \"거래처: "+map.get("CUSTCD")+"\", \"라벨종류: "+map.get("CTYPE")+"\" \n"+listMap.get("PROCRTNMSG");
			     
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


}
