package WMS.Overall_status_4.dailyStockStatus_08;

import java.util.List;
import java.util.Map;

public interface dailyStockStatus_08Service {
	
	 List<Map<String, Object>> dailyStockStatus_08Select(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> dailyStockStatus_08Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> dailyStockStatus_08Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> dailyStockStatus_08Select_STATUS(Map<String, Object> map) throws Exception;
	 
	 List<List<Object>> dailyStockStatus_08Select_LOC(List<List<Object>>  map) throws Exception;
	 
}
