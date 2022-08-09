package WMS.Standard_infomation_1.supplierPartNumberMapping_07;

import java.util.List;
import java.util.Map;

public interface supplierPartNumberMapping_07Service {

	 List<Map<String, Object>> supplierPartNumberMapping_07Select(Map<String, Object> commandMap) throws Exception; 	//list

	 List<Map<String, Object>> supplierPartNumberMapping_07Select_CUSTCD(Map<String, Object> commandMap) throws Exception; 	//select list
	 
	 Map<String, Object> supplierPartNumberMapping_07InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
