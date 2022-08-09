package WMS.Management_of_workers_3.groupAuthority_03;

import java.util.List;
import java.util.Map;

public interface groupAuthority_03Service {

	 List<Map<String, Object>> groupAuthority_03Select_right(Map<String, Object> commandMap) throws Exception; //select						//search CODEGRP

	 List<Map<String, Object>> groupAuthority_03Select_left() throws Exception; //select						//search CODEGRP
	 
	 Map<String, Object> groupAuthority_03InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
