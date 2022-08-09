package WMS.Overall_status_4.detailStockStatus_07;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.detailStockStatus_07.detailStockStatus_07Dao;
	 
	@Service("detailStockStatus_07Service")
	public class detailStockStatus_07ServiceImpl implements detailStockStatus_07Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="detailStockStatus_07DAO")
	    private detailStockStatus_07Dao detailStockStatus_07DAO;
	
	    @Override
	    public List<Map<String, Object>> detailStockStatus_07Select(Map<String, Object> map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select(map);
	    }  
	    
	    @Override
		public Map<String, Object> detailStockStatus_07InsertUpdate_REPRINT(List<Map<String, Object>> list) throws Exception {
			return detailStockStatus_07DAO.detailStockStatus_07InsertUpdate_REPRINT(list);
		}    
	    
	    @Override
	    public List<Map<String, Object>> detailStockStatus_07Select_WERKS(Map<String, Object> map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> detailStockStatus_07Select_LGORT(Map<String, Object> map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> detailStockStatus_07Select_STATUS(Map<String, Object> map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select_STATUS(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> detailStockStatus_07Select_PRTDEMON(Map<String, Object> map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select_PRTDEMON(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> detailStockStatus_07Select_REPRINT(Map<String, Object> map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select_REPRINT(map);
	    }

	    @Override
	    public List<List<Object>> detailStockStatus_07Select_LOC(List<List<Object>>  map) throws Exception {
	    	return detailStockStatus_07DAO.detailStockStatus_07Select_LOC(map);
	    }


	}



