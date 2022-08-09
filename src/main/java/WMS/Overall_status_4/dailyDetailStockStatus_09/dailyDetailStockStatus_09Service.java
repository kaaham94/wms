package WMS.Overall_status_4.dailyDetailStockStatus_09;

import java.util.List;
import java.util.Map;

public interface dailyDetailStockStatus_09Service {
	
	 List<Map<String, Object>> dailyDetailStockStatus_09Select(Map<String, Object> commandMap) throws Exception; //select	
		
	 Map<String, Object> dailyDetailStockStatus_09InsertUpdate_REPRINT(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 List<Map<String, Object>> dailyDetailStockStatus_09Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> dailyDetailStockStatus_09Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> dailyDetailStockStatus_09Select_STATUS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> dailyDetailStockStatus_09Select_PRTDEMON(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> dailyDetailStockStatus_09Select_REPRINT(Map<String, Object> map) throws Exception;
	 
	 List<List<Object>> dailyDetailStockStatus_09Select_LOC(List<List<Object>>  map) throws Exception;
	 
}
