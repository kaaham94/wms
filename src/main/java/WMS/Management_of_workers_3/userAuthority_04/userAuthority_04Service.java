package WMS.Management_of_workers_3.userAuthority_04;

import java.util.List;
import java.util.Map;

public interface userAuthority_04Service {

	 List<Map<String, Object>> userAuthority_04Select_right(Map<String, Object> commandMap) throws Exception; //select						//search CODEGRP

	 List<Map<String, Object>> userAuthority_04Select_left(Map<String, Object> commandMap) throws Exception; //select						//search CODEGRP
	 
	 Map<String, Object> userAuthority_04InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	
}
