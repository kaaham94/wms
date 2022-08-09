package WMS.Overall_status_4.qualityManagementHistory_10;

import java.util.List;
import java.util.Map;

public interface qualityManagementHistory_10Service {
	
	 List<Map<String, Object>> qualityManagementHistory_10Select(Map<String, Object> commandMap) throws Exception; //select	

	 List<Map<String, Object>> qualityManagementHistory_10Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> qualityManagementHistory_10Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> qualityManagementHistory_10Select_STATUS(Map<String, Object> map) throws Exception;

}
