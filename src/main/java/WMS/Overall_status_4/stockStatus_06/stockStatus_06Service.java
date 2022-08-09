package WMS.Overall_status_4.stockStatus_06;

import java.util.List;
import java.util.Map;

public interface stockStatus_06Service {
	
	 List<Map<String, Object>> stockStatus_06Select(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> stockStatus_06Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> stockStatus_06Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> stockStatus_06Select_STATUS(Map<String, Object> map) throws Exception;
	 
	 List<List<Object>> stockStatus_06Select_LOC(List<List<Object>>  map) throws Exception;
	 
}
