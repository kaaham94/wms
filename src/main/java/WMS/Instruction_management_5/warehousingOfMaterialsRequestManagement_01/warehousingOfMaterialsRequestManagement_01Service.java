package WMS.Instruction_management_5.warehousingOfMaterialsRequestManagement_01;

import java.util.List;
import java.util.Map;

public interface warehousingOfMaterialsRequestManagement_01Service {
	
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_right(Map<String, Object> commandMap) throws Exception; //select					

	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_bottom(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_left(Map<String, Object> commandMap) throws Exception; //select		
	 
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_CUSTCD(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LIFNR(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LFART(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_OUTCUST(Map<String, Object> map) throws Exception;
	
	 Map<String, Object> warehousingOfMaterialsRequestManagement_01InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
