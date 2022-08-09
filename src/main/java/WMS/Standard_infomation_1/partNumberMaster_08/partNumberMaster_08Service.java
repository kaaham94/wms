package WMS.Standard_infomation_1.partNumberMaster_08;

import java.util.List;
import java.util.Map;

public interface partNumberMaster_08Service {

	 List<Map<String, Object>> partNumberMaster_08Select(Map<String, Object> commandMap) throws Exception; 	//list

	 List<Map<String, Object>> partNumberMaster_08Select_CUSTCD(Map<String, Object> commandMap) throws Exception; 	//select list
	 
	 List<Map<String, Object>> partNumberMaster_08Select_CODE(Map<String, Object> commandMap) throws Exception; 	//select list
	 
	 Map<String, Object> partNumberMaster_08InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
