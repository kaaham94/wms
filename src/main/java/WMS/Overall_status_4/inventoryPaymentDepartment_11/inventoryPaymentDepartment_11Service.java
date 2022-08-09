package WMS.Overall_status_4.inventoryPaymentDepartment_11;

import java.util.List;
import java.util.Map;

public interface inventoryPaymentDepartment_11Service {
	
	 List<Map<String, Object>> inventoryPaymentDepartment_11Select_left(Map<String, Object> commandMap) throws Exception; //select	
	 
	 List<Map<String, Object>> inventoryPaymentDepartment_11Select_right_total(Map<String, Object> commandMap) throws Exception; //select
	 
	 List<Map<String, Object>> inventoryPaymentDepartment_11Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> inventoryPaymentDepartment_11Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<List<Object>> inventoryPaymentDepartment_11Select_CUST(Map<String, Object> map) throws Exception;

	 List<Map<String, Object>> inventoryPaymentDepartment_11InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	 
}
