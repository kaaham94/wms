package WMS.Standard_infomation_1.imageReference_05;

import java.util.List;
import java.util.Map;

public interface imageReference_05Service {

	 List<Map<String, Object>> imageReference_05Select(Map<String, Object> commandMap) throws Exception; 	//list

	 Map<String, Object> imageReference_05Select_VIEWIMAGE(Map<String, Object> commandMap) throws Exception; 	//select list
	 
	 Map<String, Object> imageReference_05InsertUpdate(Map<String, Object> map) throws Exception;  //insert 
	
}
