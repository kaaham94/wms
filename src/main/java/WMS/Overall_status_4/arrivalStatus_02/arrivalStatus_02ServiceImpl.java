package WMS.Overall_status_4.arrivalStatus_02;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.arrivalStatus_02.arrivalStatus_02Dao;
	 
	@Service("arrivalStatus_02Service")
	public class arrivalStatus_02ServiceImpl implements arrivalStatus_02Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="arrivalStatus_02DAO")
	    private arrivalStatus_02Dao arrivalStatus_02DAO;
	
	    @Override
	    public List<Map<String, Object>> arrivalStatus_02Select(Map<String, Object> map) throws Exception {
	    	return arrivalStatus_02DAO.arrivalStatus_02Select(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatus_02Select_WERKS(Map<String, Object> map) throws Exception {
	    	return arrivalStatus_02DAO.arrivalStatus_02Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatus_02Select_LGORT(Map<String, Object> map) throws Exception {
	    	return arrivalStatus_02DAO.arrivalStatus_02Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatus_02Select_LIFNR(Map<String, Object> map) throws Exception {
	    	return arrivalStatus_02DAO.arrivalStatus_02Select_LIFNR(map);
	    }

	    @Override
	    public List<Map<String, Object>> arrivalStatus_02Select_BSART(Map<String, Object> map) throws Exception {
	    	return arrivalStatus_02DAO.arrivalStatus_02Select_BSART(map);
	    }

	    @Override
	    public List<Map<String, Object>> arrivalStatus_02Select_KUNNR(Map<String, Object> map) throws Exception {
	    	return arrivalStatus_02DAO.arrivalStatus_02Select_KUNNR(map);
	    }


	}



