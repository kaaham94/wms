package WMS.Overall_status_4.dailyStockStatus_08;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.dailyStockStatus_08.dailyStockStatus_08Dao;
	 
	@Service("dailyStockStatus_08Service")
	public class dailyStockStatus_08ServiceImpl implements dailyStockStatus_08Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="dailyStockStatus_08DAO")
	    private dailyStockStatus_08Dao dailyStockStatus_08DAO;
	
	    @Override
	    public List<Map<String, Object>> dailyStockStatus_08Select(Map<String, Object> map) throws Exception {
	    	return dailyStockStatus_08DAO.dailyStockStatus_08Select(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> dailyStockStatus_08Select_WERKS(Map<String, Object> map) throws Exception {
	    	return dailyStockStatus_08DAO.dailyStockStatus_08Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> dailyStockStatus_08Select_LGORT(Map<String, Object> map) throws Exception {
	    	return dailyStockStatus_08DAO.dailyStockStatus_08Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> dailyStockStatus_08Select_STATUS(Map<String, Object> map) throws Exception {
	    	return dailyStockStatus_08DAO.dailyStockStatus_08Select_STATUS(map);
	    }

	    @Override
	    public List<List<Object>> dailyStockStatus_08Select_LOC(List<List<Object>>  map) throws Exception {
	    	return dailyStockStatus_08DAO.dailyStockStatus_08Select_LOC(map);
	    }


	}



