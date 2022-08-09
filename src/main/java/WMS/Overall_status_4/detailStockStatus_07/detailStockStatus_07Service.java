package WMS.Overall_status_4.detailStockStatus_07;

import java.util.List;
import java.util.Map;

public interface detailStockStatus_07Service {
	
	 List<Map<String, Object>> detailStockStatus_07Select(Map<String, Object> commandMap) throws Exception; //select	
		
	 Map<String, Object> detailStockStatus_07InsertUpdate_REPRINT(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 List<Map<String, Object>> detailStockStatus_07Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStockStatus_07Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStockStatus_07Select_STATUS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStockStatus_07Select_PRTDEMON(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStockStatus_07Select_REPRINT(Map<String, Object> map) throws Exception;
	 
	 List<List<Object>> detailStockStatus_07Select_LOC(List<List<Object>>  map) throws Exception;
	 
}
