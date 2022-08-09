package WMS.Standard_infomation_1.code_01;

import java.util.List;
import java.util.Map;

public interface code_01Service {

	 List<Map<String, Object>> code_01Select(Map<String, Object> commandMap) throws Exception; 		//list
	 
	 List<Map<String, Object>> code_01Search_CODEGRP() throws Exception; 							//search CODEGRP

	 Map<String, Object> code_01Insert_code(List<Map<String, Object>> list) throws Exception;  		//insert code
	 
	 Map<String, Object> code_01Insert_codeType(List<Map<String, Object>> list) throws Exception;	//insert codeType 
	 
	 Map<String, Object> code_01Update_code(List<Map<String, Object>> list) throws Exception;  // update (작업중)

	 Map<String, Object> code_01Delete_code(List<Map<String, Object>> list) throws Exception;  // delete (작업중)
}
