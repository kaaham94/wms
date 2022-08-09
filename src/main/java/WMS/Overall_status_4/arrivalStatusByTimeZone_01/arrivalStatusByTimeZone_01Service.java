package WMS.Overall_status_4.arrivalStatusByTimeZone_01;

import java.util.List;
import java.util.Map;

public interface arrivalStatusByTimeZone_01Service {
	
	 List<Map<String, Object>> arrivalStatusByTimeZone_01Select_right(Map<String, Object> commandMap) throws Exception; //select					

	 List<Map<String, Object>> arrivalStatusByTimeZone_01Select_right_bottom(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> arrivalStatusByTimeZone_01Select_left(Map<String, Object> commandMap) throws Exception; //select		
	 
	 List<Map<String, Object>> arrivalStatusByTimeZone_01Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> arrivalStatusByTimeZone_01Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> arrivalStatusByTimeZone_01Select_CUSTCD(Map<String, Object> map) throws Exception;
	 
	 Map<String, Object> arrivalStatusByTimeZone_01InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
