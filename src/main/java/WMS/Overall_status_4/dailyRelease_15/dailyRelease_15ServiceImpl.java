package WMS.Overall_status_4.dailyRelease_15;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.Overall_status_4.dailyRelease_15.dailyRelease_15Dao;
	 
	@Service("dailyRelease_15Service")
	public class dailyRelease_15ServiceImpl implements dailyRelease_15Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="dailyRelease_15DAO")
	    private dailyRelease_15Dao dailyRelease_15DAO;
	
	    @Override
	    public List<Map<String, Object>> dailyRelease_15Select(Map<String, Object> map) throws Exception {
	    	return dailyRelease_15DAO.dailyRelease_15Select(map);
	    }  
	 
	    @Override
	    public List<Map<String, Object>> dailyRelease_15Select_WERKS(Map<String, Object> map) throws Exception {
	    	return dailyRelease_15DAO.dailyRelease_15Select_WERKS(map);
	    } 
	
	}



