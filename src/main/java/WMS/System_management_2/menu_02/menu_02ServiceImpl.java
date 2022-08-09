package WMS.System_management_2.menu_02;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.System_management_2.menu_02.menu_02Dao;
	 
	@Service("menu_02Service")
	public class menu_02ServiceImpl implements menu_02Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="menu_02DAO")
	    private menu_02Dao menu_02DAO;
	
	    @Override
	    public List<Map<String, Object>> menu_02Select(Map<String, Object> map) throws Exception {
	    	return menu_02DAO.menu_02Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> menu_02Select_SearchMENUNAME(Map<String, Object> map) throws Exception {
	    	return menu_02DAO.menu_02Select_SearchMENUNAME(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> menu_02Select_GridMENUNAME(Map<String, Object> map) throws Exception {
	    	return menu_02DAO.menu_02Select_GridMENUNAME(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> menu_02Select_LEVEL(Map<String, Object> map) throws Exception {
	    	return menu_02DAO.menu_02Select_LEVEL(map);
	    }  
	
	    @Override
	    public Map<String, Object> menu_02Insert(List<Map<String, Object>> list) throws Exception {
	    	return menu_02DAO.menu_02Insert(list);
	    }    

	    @Override
	    public Map<String, Object> menu_02Update(List<Map<String, Object>> list) throws Exception {
	    	return menu_02DAO.menu_02Update(list);
	    }
	    
	    @Override
	    public Map<String, Object> menu_02Delete(List<Map<String, Object>> list) throws Exception {
	    	return menu_02DAO.menu_02Delete(list);
	    }
	
	}



