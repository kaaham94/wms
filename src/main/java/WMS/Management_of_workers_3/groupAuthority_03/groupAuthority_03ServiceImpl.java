package WMS.Management_of_workers_3.groupAuthority_03;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Management_of_workers_3.groupAuthority_03.groupAuthority_03Dao;
	 
	@Service("groupAuthority_03Service")
	public class groupAuthority_03ServiceImpl implements groupAuthority_03Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="groupAuthority_03DAO")
	    private groupAuthority_03Dao groupAuthority_03DAO;
	
	    @Override
	    public List<Map<String, Object>> groupAuthority_03Select_right(Map<String, Object> map) throws Exception {
	    	return groupAuthority_03DAO.groupAuthority_03Select_right(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> groupAuthority_03Select_left() throws Exception {
	    	return groupAuthority_03DAO.groupAuthority_03Select_left();
	    }    
	    
	    @Override
	    public Map<String, Object> groupAuthority_03InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return groupAuthority_03DAO.groupAuthority_03InsertUpdate(list);
	    }    

	}



