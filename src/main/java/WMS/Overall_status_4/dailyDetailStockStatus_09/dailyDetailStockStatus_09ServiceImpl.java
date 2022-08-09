package WMS.Overall_status_4.dailyDetailStockStatus_09;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.dailyDetailStockStatus_09.dailyDetailStockStatus_09Dao;
	 
	@Service("dailyDetailStockStatus_09Service")
	public class dailyDetailStockStatus_09ServiceImpl implements dailyDetailStockStatus_09Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="dailyDetailStockStatus_09DAO")
	    private dailyDetailStockStatus_09Dao dailyDetailStockStatus_09DAO;
	
	    @Override
	    public List<Map<String, Object>> dailyDetailStockStatus_09Select(Map<String, Object> map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select(map);
	    }  
	    
	    @Override
		public Map<String, Object> dailyDetailStockStatus_09InsertUpdate_REPRINT(List<Map<String, Object>> list) throws Exception {
			return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09InsertUpdate_REPRINT(list);
		}    
	    
	    @Override
	    public List<Map<String, Object>> dailyDetailStockStatus_09Select_WERKS(Map<String, Object> map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> dailyDetailStockStatus_09Select_LGORT(Map<String, Object> map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> dailyDetailStockStatus_09Select_STATUS(Map<String, Object> map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select_STATUS(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> dailyDetailStockStatus_09Select_PRTDEMON(Map<String, Object> map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select_PRTDEMON(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> dailyDetailStockStatus_09Select_REPRINT(Map<String, Object> map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select_REPRINT(map);
	    }

	    @Override
	    public List<List<Object>> dailyDetailStockStatus_09Select_LOC(List<List<Object>>  map) throws Exception {
	    	return dailyDetailStockStatus_09DAO.dailyDetailStockStatus_09Select_LOC(map);
	    }


	}



