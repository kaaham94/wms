package WMS.Standard_infomation_1.storageLocation_04;

import java.util.List;
import java.util.Map;

public interface storageLocation_04Service {

	 List<Map<String, Object>> storageLocation_04Select(Map<String, Object> commandMap) throws Exception; 	//list

	 List<Map<String, Object>> storageLocation_04Select_PLANTNAME(Map<String, Object> commandMap) throws Exception; 	//select list
	 
	 Map<String, Object> storageLocation_04InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
