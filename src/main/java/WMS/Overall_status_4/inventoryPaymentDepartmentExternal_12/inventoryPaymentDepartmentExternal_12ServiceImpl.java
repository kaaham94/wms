package WMS.Overall_status_4.inventoryPaymentDepartmentExternal_12;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.Overall_status_4.inventoryPaymentDepartmentExternal_12.inventoryPaymentDepartmentExternal_12Dao;
	 
	@Service("inventoryPaymentDepartmentExternal_12Service")
	public class inventoryPaymentDepartmentExternal_12ServiceImpl implements inventoryPaymentDepartmentExternal_12Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="inventoryPaymentDepartmentExternal_12DAO")
	    private inventoryPaymentDepartmentExternal_12Dao inventoryPaymentDepartmentExternal_12DAO;
	
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_left(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartmentExternal_12DAO.inventoryPaymentDepartmentExternal_12Select_left(map);
	    }  
	 
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_right_total(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartmentExternal_12DAO.inventoryPaymentDepartmentExternal_12Select_right_total(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_WERKS(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartmentExternal_12DAO.inventoryPaymentDepartmentExternal_12Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12Select_LGORT(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartmentExternal_12DAO.inventoryPaymentDepartmentExternal_12Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<List<Object>> inventoryPaymentDepartmentExternal_12Select_CUST(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartmentExternal_12DAO.inventoryPaymentDepartmentExternal_12Select_CUST(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartmentExternal_12InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return inventoryPaymentDepartmentExternal_12DAO.inventoryPaymentDepartmentExternal_12InsertUpdate(list);
	    }    
	    

	}



