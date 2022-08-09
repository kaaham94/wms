package WMS.System_management_2.screen_01;

import java.util.List;
import java.util.Map;

public interface screen_01Service {

	 List<Map<String, Object>> screen_01Select(Map<String, Object> commandMap) throws Exception; 	//list
	 
	 List<Map<String, Object>> screen_01Select_MENUNAME(Map<String, Object> commandMap) throws Exception; //select						

	 List<Map<String, Object>> screen_01Select_FORM(Map<String, Object> commandMap) throws Exception; //select						
	 
	 Map<String, Object> screen_01Insert(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 Map<String, Object> screen_01Update(List<Map<String, Object>> list) throws Exception;  // update

	 Map<String, Object> screen_01Delete(List<Map<String, Object>> list) throws Exception; //delete
}
