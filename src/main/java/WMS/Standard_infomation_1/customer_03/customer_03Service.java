package WMS.Standard_infomation_1.customer_03;

import java.util.List;
import java.util.Map;

public interface customer_03Service {

	 List<Map<String, Object>> customer_03Select(Map<String, Object> commandMap) throws Exception; 	//list

	 Map<String, Object> customer_03InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
