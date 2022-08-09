package WMS.Overall_status_4.presentStatusOfShipment_04;

import java.util.List;
import java.util.Map;

public interface presentStatusOfShipment_04Service {
	
	 List<Map<String, Object>> presentStatusOfShipment_04Select(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> presentStatusOfShipment_04Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> presentStatusOfShipment_04Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> presentStatusOfShipment_04Select_CUST(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> presentStatusOfShipment_04Select_KUNNR(Map<String, Object> map) throws Exception;
	 
}
