package WMS.Overall_status_4.dailyRelease_15;

import java.util.List;
import java.util.Map;

public interface dailyRelease_15Service {
	
	 List<Map<String, Object>> dailyRelease_15Select(Map<String, Object> commandMap) throws Exception; //select	
	 
	 List<Map<String, Object>> dailyRelease_15Select_WERKS(Map<String, Object> map) throws Exception;
	
}
