package WMS.Management_of_workers_3.user_01;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Management_of_workers_3.user_01.user_01Dao;
	 
	@Service("user_01Service")
	public class user_01ServiceImpl implements user_01Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="user_01DAO")
	    private user_01Dao user_01DAO;
	
	    @Override
	    public List<Map<String, Object>> user_01Select(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select(map);
	    }    
	    
	    @Override
	    public Map<String, Object> user_01InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return user_01DAO.user_01InsertUpdate(list);
	    }    

	    //select
	    @Override
	    public List<Map<String, Object>> user_01Select_WERKS(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_WERKS(map);
	    }   
		
		@Override
	    public List<Map<String, Object>> user_01Select_DEPT(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_DEPT(map);
	    }   
		
		@Override
	    public List<Map<String, Object>> user_01Select_STAT2(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_STAT2(map);
	    }   
		
		@Override
	    public List<Map<String, Object>> user_01Select_WKCOD(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_WKCOD(map);
	    }   
		
		@Override
	    public List<Map<String, Object>> user_01Select_JKCOD(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_JKCOD(map);
	    }   
		
		@Override
	    public List<Map<String, Object>> user_01Select_STYPE(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_STYPE(map);
	    }   
		
		@Override
	    public List<Map<String, Object>> user_01Select_AUTH(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_AUTH(map);
	    }  
		
		@Override
	    public List<Map<String, Object>> user_01Select_LGORT(Map<String, Object> map) throws Exception {
	    	return user_01DAO.user_01Select_LGORT(map);
	    }  
		
		@Override
		public  Map<String, Object> user_01Delete(List<Map<String, Object>> list) throws Exception {
	    	return user_01DAO.user_01Delete(list);
	    }
	  
	  	@Override
		public  Map<String, Object> user_01PasswordReset(List<Map<String, Object>> list) throws Exception {
	    	return user_01DAO.user_01PasswordReset(list);
	    }
	
	}



