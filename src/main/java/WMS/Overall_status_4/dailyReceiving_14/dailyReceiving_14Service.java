package WMS.Overall_status_4.dailyReceiving_14;

import java.util.List;
import java.util.Map;

public interface dailyReceiving_14Service {
	
	 List<Map<String, Object>> dailyReceiving_14Select(Map<String, Object> commandMap) throws Exception; //select	
	 
	 List<Map<String, Object>> dailyReceiving_14Select_WERKS(Map<String, Object> map) throws Exception;
	
}
