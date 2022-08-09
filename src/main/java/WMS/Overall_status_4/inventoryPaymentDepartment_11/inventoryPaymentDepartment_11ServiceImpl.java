package WMS.Overall_status_4.inventoryPaymentDepartment_11;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.Overall_status_4.inventoryPaymentDepartment_11.inventoryPaymentDepartment_11Dao;
	 
	@Service("inventoryPaymentDepartment_11Service")
	public class inventoryPaymentDepartment_11ServiceImpl implements inventoryPaymentDepartment_11Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="inventoryPaymentDepartment_11DAO")
	    private inventoryPaymentDepartment_11Dao inventoryPaymentDepartment_11DAO;
	
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartment_11Select_left(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartment_11DAO.inventoryPaymentDepartment_11Select_left(map);
	    }  
	 
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartment_11Select_right_total(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartment_11DAO.inventoryPaymentDepartment_11Select_right_total(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartment_11Select_WERKS(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartment_11DAO.inventoryPaymentDepartment_11Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartment_11Select_LGORT(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartment_11DAO.inventoryPaymentDepartment_11Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<List<Object>> inventoryPaymentDepartment_11Select_CUST(Map<String, Object> map) throws Exception {
	    	return inventoryPaymentDepartment_11DAO.inventoryPaymentDepartment_11Select_CUST(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> inventoryPaymentDepartment_11InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return inventoryPaymentDepartment_11DAO.inventoryPaymentDepartment_11InsertUpdate(list);
	    }    
	    

	}



