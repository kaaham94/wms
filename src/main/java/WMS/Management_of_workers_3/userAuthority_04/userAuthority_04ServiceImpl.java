package WMS.Management_of_workers_3.userAuthority_04;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Management_of_workers_3.userAuthority_04.userAuthority_04Dao;
	 
	@Service("userAuthority_04Service")
	public class userAuthority_04ServiceImpl implements userAuthority_04Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="userAuthority_04DAO")
	    private userAuthority_04Dao userAuthority_04DAO;
	
	    @Override
	    public List<Map<String, Object>> userAuthority_04Select_right(Map<String, Object> map) throws Exception {
	    	return userAuthority_04DAO.userAuthority_04Select_right(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> userAuthority_04Select_left(Map<String, Object> map) throws Exception {
	    	return userAuthority_04DAO.userAuthority_04Select_left(map);
	    }    
	    
	    @Override
	    public Map<String, Object> userAuthority_04InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return userAuthority_04DAO.userAuthority_04InsertUpdate(list);
	    }    

	}



