package WMS.Standard_infomation_1.supplierPartNumberMapping_07;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.supplierPartNumberMapping_07.supplierPartNumberMapping_07Dao;
	 
	@Service("supplierPartNumberMapping_07Service")
	public class supplierPartNumberMapping_07ServiceImpl implements supplierPartNumberMapping_07Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="supplierPartNumberMapping_07DAO")
	    private supplierPartNumberMapping_07Dao supplierPartNumberMapping_07DAO;
	
	    @Override
	    public List<Map<String, Object>> supplierPartNumberMapping_07Select(Map<String, Object> map) throws Exception {
	    	return supplierPartNumberMapping_07DAO.supplierPartNumberMapping_07Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> supplierPartNumberMapping_07Select_CUSTCD(Map<String, Object> map) throws Exception {
	    	return supplierPartNumberMapping_07DAO.supplierPartNumberMapping_07Select_CUSTCD(map);
	    }    
	    
	    @Override
	    public Map<String, Object> supplierPartNumberMapping_07InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return supplierPartNumberMapping_07DAO.supplierPartNumberMapping_07InsertUpdate(list);
	    }    

	
	}



