package WMS.Overall_status_4.dailyReceiving_14;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.Overall_status_4.dailyReceiving_14.dailyReceiving_14Dao;
	 
	@Service("dailyReceiving_14Service")
	public class dailyReceiving_14ServiceImpl implements dailyReceiving_14Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="dailyReceiving_14DAO")
	    private dailyReceiving_14Dao dailyReceiving_14DAO;
	
	    @Override
	    public List<Map<String, Object>> dailyReceiving_14Select(Map<String, Object> map) throws Exception {
	    	return dailyReceiving_14DAO.dailyReceiving_14Select(map);
	    }  
	 
	    @Override
	    public List<Map<String, Object>> dailyReceiving_14Select_WERKS(Map<String, Object> map) throws Exception {
	    	return dailyReceiving_14DAO.dailyReceiving_14Select_WERKS(map);
	    } 
	
	}



