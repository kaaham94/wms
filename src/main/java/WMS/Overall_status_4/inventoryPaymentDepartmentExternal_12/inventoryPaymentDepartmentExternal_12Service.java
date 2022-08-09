package WMS.Overall_status_4.inventoryPaymentDepartmentExternal_12;

import java.util.List;
import java.util.Map;

public interface inventoryPaymentDepartmentExternal_12Service {
	
	 List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_left(Map<String, Object> commandMap) throws Exception; //select	
	 
	 List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_right_total(Map<String, Object> commandMap) throws Exception; //select
	 
	 List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_WERKS(Map<String, Object> map) throws Exception;
	 
	 List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_LGORT(Map<String, Object> map) throws Exception;
	 
	 List<List<Object>> inventoryPaymentDepartmentExternal_12Select_CUST(Map<String, Object> map) throws Exception;

	 List<Map<String, Object>> inventoryPaymentDepartmentExternal_12InsertUpdate(List<Map<String, Object>> list) throws Exception;  //insert 
	 
}
