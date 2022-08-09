package WMS.Management_of_workers_3.corporateByUser_02;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Management_of_workers_3.corporateByUser_02.corporateByUser_02Dao;
	 
	@Service("corporateByUser_02Service")
	public class corporateByUser_02ServiceImpl implements corporateByUser_02Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="corporateByUser_02DAO")
	    private corporateByUser_02Dao corporateByUser_02DAO;
	
	    @Override
	    public List<Map<String, Object>> corporateByUser_02Select(Map<String, Object> map) throws Exception {
	    	return corporateByUser_02DAO.corporateByUser_02Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> corporateByUser_02Select_WERKS (Map<String, Object> map) throws Exception {
	    	return corporateByUser_02DAO.corporateByUser_02Select_WERKS (map);
	    }  
	    
	    @Override
	    public Map<String, Object> corporateByUser_02Delete(List<Map<String, Object>> list) throws Exception {
	    	return corporateByUser_02DAO.corporateByUser_02Delete(list);
	    }   
	    
	    @Override
	    public Map<String, Object> corporateByUser_02InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return corporateByUser_02DAO.corporateByUser_02InsertUpdate(list);
	    }    

	
	}



