package WMS.Overall_status_4.materialsDetail_03;

import java.util.List;
import java.util.Map;

public interface materialsDetail_03Service {
	
	 List<Map<String, Object>> materialsDetail_03Select(Map<String, Object> commandMap) throws Exception; //select	
	
	 List<Map<String, Object>> materialsDetail_03Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> materialsDetail_03Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> materialsDetail_03Select_LIFNR(Map<String, Object> map) throws Exception;
	
	 List<Map<String, Object>> materialsDetail_03Select_BSART(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> materialsDetail_03Select_KUNNR(Map<String, Object> map) throws Exception;
	 
}
