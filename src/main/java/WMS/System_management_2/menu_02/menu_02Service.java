package WMS.System_management_2.menu_02;

import java.util.List;
import java.util.Map;

public interface menu_02Service {

	 List<Map<String, Object>> menu_02Select(Map<String, Object> commandMap) throws Exception; 	//list
	 
	 List<Map<String, Object>> menu_02Select_SearchMENUNAME(Map<String, Object> commandMap) throws Exception; //select						

	 List<Map<String, Object>> menu_02Select_GridMENUNAME(Map<String, Object> commandMap) throws Exception; //select						

	 List<Map<String, Object>> menu_02Select_LEVEL(Map<String, Object> commandMap) throws Exception; //select					
	 
	 Map<String, Object> menu_02Insert(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 Map<String, Object> menu_02Update(List<Map<String, Object>> list) throws Exception;  // update
	 
	 Map<String, Object> menu_02Delete(List<Map<String, Object>> list) throws Exception;  // delete

}
