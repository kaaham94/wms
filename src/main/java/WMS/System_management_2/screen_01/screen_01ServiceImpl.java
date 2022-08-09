package WMS.System_management_2.screen_01;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.System_management_2.screen_01.screen_01Dao;
	 
	@Service("screen_01Service")
	public class screen_01ServiceImpl implements screen_01Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="screen_01DAO")
	    private screen_01Dao screen_01DAO;
	
	    @Override
	    public List<Map<String, Object>> screen_01Select(Map<String, Object> map) throws Exception {
	    	return screen_01DAO.screen_01Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> screen_01Select_MENUNAME(Map<String, Object> map) throws Exception {
	    	return screen_01DAO.screen_01Select_MENUNAME(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> screen_01Select_FORM(Map<String, Object> map) throws Exception {
	    	return screen_01DAO.screen_01Select_FORM(map);
	    }  
	
	    @Override
	    public Map<String, Object> screen_01Insert(List<Map<String, Object>> list) throws Exception {
	    	return screen_01DAO.screen_01Insert(list);
	    }    

	    @Override
	    public Map<String, Object> screen_01Update(List<Map<String, Object>> list) throws Exception {
	    	return screen_01DAO.screen_01Update(list);
	    }
	    
	    @Override
		public  Map<String, Object> screen_01Delete(List<Map<String, Object>> list) throws Exception {
	    	return screen_01DAO.screen_01Delete(list);
	    }
	
	}



