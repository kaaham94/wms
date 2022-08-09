package WMS.Standard_infomation_1.customer_03;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.customer_03.customer_03Dao;
	 
	@Service("customer_03Service")
	public class customer_03ServiceImpl implements customer_03Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="customer_03DAO")
	    private customer_03Dao customer_03DAO;
	
	    @Override
	    public List<Map<String, Object>> customer_03Select(Map<String, Object> map) throws Exception {
	    	return customer_03DAO.customer_03Select(map);
	    }    
	    
	    @Override
	    public Map<String, Object> customer_03InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return customer_03DAO.customer_03InsertUpdate(list);
	    }    

	
	}



