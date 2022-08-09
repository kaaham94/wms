package WMS.Standard_infomation_1.PDAip_09;

import java.util.List;
import java.util.Map;

public interface PDAip_09Service {

	 List<Map<String, Object>> PDAip_09Select(Map<String, Object> commandMap) throws Exception; 	//list
	 
	 List<Map<String, Object>> PDAip_09Select_WERKS(Map<String, Object> commandMap) throws Exception; //select						//search CODEGRP

	 List<Map<String, Object>> PDAip_09Select_LGORT(Map<String, Object> commandMap) throws Exception; //select						//search CODEGRP
	 
	 Map<String, Object> PDAip_09Insert(List<Map<String, Object>> list) throws Exception;  //insert 
	 
	 Map<String, Object> PDAip_09Update(List<Map<String, Object>> list) throws Exception;  // update

	 Map<String, Object> PDAip_09Delete(List<Map<String, Object>> list) throws Exception; //delete
}
