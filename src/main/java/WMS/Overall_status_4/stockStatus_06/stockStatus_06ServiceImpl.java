package WMS.Overall_status_4.stockStatus_06;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.stockStatus_06.stockStatus_06Dao;
	 
	@Service("stockStatus_06Service")
	public class stockStatus_06ServiceImpl implements stockStatus_06Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="stockStatus_06DAO")
	    private stockStatus_06Dao stockStatus_06DAO;
	
	    @Override
	    public List<Map<String, Object>> stockStatus_06Select(Map<String, Object> map) throws Exception {
	    	return stockStatus_06DAO.stockStatus_06Select(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> stockStatus_06Select_WERKS(Map<String, Object> map) throws Exception {
	    	return stockStatus_06DAO.stockStatus_06Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> stockStatus_06Select_LGORT(Map<String, Object> map) throws Exception {
	    	return stockStatus_06DAO.stockStatus_06Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> stockStatus_06Select_STATUS(Map<String, Object> map) throws Exception {
	    	return stockStatus_06DAO.stockStatus_06Select_STATUS(map);
	    }

	    @Override
	    public List<List<Object>> stockStatus_06Select_LOC(List<List<Object>>  map) throws Exception {
	    	return stockStatus_06DAO.stockStatus_06Select_LOC(map);
	    }


	}



