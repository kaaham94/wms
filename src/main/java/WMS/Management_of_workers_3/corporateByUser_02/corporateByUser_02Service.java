package WMS.Management_of_workers_3.corporateByUser_02;

import java.util.List;
import java.util.Map;

public interface corporateByUser_02Service {

	 List<Map<String, Object>> corporateByUser_02Select(Map<String, Object> commandMap) throws Exception; 	//list

	 List<Map<String, Object>> corporateByUser_02Select_WERKS(Map<String, Object> commandMap) throws Exception; 	//select list
	 
	 Map<String, Object> corporateByUser_02Delete(List<Map<String, Object>> list) throws Exception;
	 
	 Map<String, Object> corporateByUser_02InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
