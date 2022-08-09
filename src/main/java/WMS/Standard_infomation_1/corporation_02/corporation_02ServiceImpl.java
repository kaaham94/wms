package WMS.Standard_infomation_1.corporation_02;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.corporation_02.corporation_02Dao;
	 
	@Service("corporation_02Service")
	public class corporation_02ServiceImpl implements corporation_02Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="corporation_02DAO")
	    private corporation_02Dao corporation_02DAO;
	
	    @Override
	    public List<Map<String, Object>> corporation_02Select(Map<String, Object> map) throws Exception {
	    	return corporation_02DAO.corporation_02Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> corporation_02Select_plant(Map<String, Object> map) throws Exception {
	    	return corporation_02DAO.corporation_02Select_plant(map);
	    }  
	
	    @Override
	    public Map<String, Object> corporation_02Insert(List<Map<String, Object>> list) throws Exception {
	    	return corporation_02DAO.corporation_02Insert(list);
	    }    

	    @Override
	    public Map<String, Object> corporation_02Update(List<Map<String, Object>> list) throws Exception {
	    	return corporation_02DAO.corporation_02Update(list);
	    }
	
	}



