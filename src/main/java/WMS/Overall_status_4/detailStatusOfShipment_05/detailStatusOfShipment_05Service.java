package WMS.Overall_status_4.detailStatusOfShipment_05;

import java.util.List;
import java.util.Map;

public interface detailStatusOfShipment_05Service {
	
	 List<Map<String, Object>> detailStatusOfShipment_05Select(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> detailStatusOfShipment_05Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStatusOfShipment_05Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStatusOfShipment_05Select_CUST(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> detailStatusOfShipment_05Select_KUNNR(Map<String, Object> map) throws Exception;
	 
}
