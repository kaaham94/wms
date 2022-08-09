package WMS.Standard_infomation_1.corporation_02;

import java.util.List;
import java.util.Map;

public interface corporation_02Service {

	 List<Map<String, Object>> corporation_02Select(Map<String, Object> commandMap) throws Exception; 	//list
	 
	 List<Map<String, Object>> corporation_02Select_plant(Map<String, Object> commandMap) throws Exception; //select						//search CODEGRP

	 Map<String, Object> corporation_02Insert(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 Map<String, Object> corporation_02Update(List<Map<String, Object>> list) throws Exception;  // update

	
}
