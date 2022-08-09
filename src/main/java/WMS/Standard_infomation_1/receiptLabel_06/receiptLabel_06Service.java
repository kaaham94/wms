package WMS.Standard_infomation_1.receiptLabel_06;

import java.util.List;
import java.util.Map;

public interface receiptLabel_06Service {

	 List<Map<String, Object>> receiptLabel_06Select(Map<String, Object> commandMap) throws Exception; 	//list

	 List<Map<String, Object>> receiptLabel_06Select_VIEWIMAGE(Map<String, Object> map) throws Exception; 	//select list
	 
	 List<Map<String, Object>> receiptLabel_06Select_BARTYPE(Map<String, Object> map) throws Exception; 	//select list
	 
	 List<Map<String, Object>> receiptLabel_06Select_CUSTCD(Map<String, Object> map) throws Exception; 	//select list
	 
	 List<Map<String, Object>> receiptLabel_06Select_SDATETYPE(Map<String, Object> map) throws Exception; 	//select list
	 
	 Map<String, Object> receiptLabel_06InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	 
}
