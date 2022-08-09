package WMS.Management_of_workers_3.user_01;

import java.util.List;
import java.util.Map;

public interface user_01Service {

	 List<Map<String, Object>> user_01Select(Map<String, Object> commandMap) throws Exception; 	//list
	 
	 Map<String, Object> user_01InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 //select
	 List<Map<String, Object>> user_01Select_WERKS(Map<String, Object> map) throws Exception;
	   
	 List<Map<String, Object>> user_01Select_DEPT(Map<String, Object> map) throws Exception;

	 List<Map<String, Object>> user_01Select_STAT2(Map<String, Object> map) throws Exception;

	 List<Map<String, Object>> user_01Select_WKCOD(Map<String, Object> map) throws Exception;
	  
	 List<Map<String, Object>> user_01Select_JKCOD(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> user_01Select_STYPE(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> user_01Select_AUTH(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> user_01Select_LGORT(Map<String, Object> map) throws Exception;

	 Map<String, Object> user_01Delete(List<Map<String, Object>> list) throws Exception;
	 
	 Map<String, Object> user_01PasswordReset(List<Map<String, Object>> list) throws Exception;
}
