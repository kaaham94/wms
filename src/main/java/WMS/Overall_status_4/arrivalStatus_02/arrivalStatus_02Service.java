package WMS.Overall_status_4.arrivalStatus_02;

import java.util.List;
import java.util.Map;

public interface arrivalStatus_02Service {
	
	 List<Map<String, Object>> arrivalStatus_02Select(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> arrivalStatus_02Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> arrivalStatus_02Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> arrivalStatus_02Select_LIFNR(Map<String, Object> map) throws Exception;
	
	 List<Map<String, Object>> arrivalStatus_02Select_BSART(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> arrivalStatus_02Select_KUNNR(Map<String, Object> map) throws Exception;
	 
}
