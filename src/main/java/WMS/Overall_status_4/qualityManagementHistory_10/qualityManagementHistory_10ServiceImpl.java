package WMS.Overall_status_4.qualityManagementHistory_10;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.qualityManagementHistory_10.qualityManagementHistory_10Dao;
	 
	@Service("qualityManagementHistory_10Service")
	public class qualityManagementHistory_10ServiceImpl implements qualityManagementHistory_10Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="qualityManagementHistory_10DAO")
	    private qualityManagementHistory_10Dao qualityManagementHistory_10DAO;
	
	    @Override
	    public List<Map<String, Object>> qualityManagementHistory_10Select(Map<String, Object> map) throws Exception {
	    	return qualityManagementHistory_10DAO.qualityManagementHistory_10Select(map);
	    }  
	 
	    @Override
	    public List<Map<String, Object>> qualityManagementHistory_10Select_WERKS(Map<String, Object> map) throws Exception {
	    	return qualityManagementHistory_10DAO.qualityManagementHistory_10Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> qualityManagementHistory_10Select_LGORT(Map<String, Object> map) throws Exception {
	    	return qualityManagementHistory_10DAO.qualityManagementHistory_10Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> qualityManagementHistory_10Select_STATUS(Map<String, Object> map) throws Exception {
	    	return qualityManagementHistory_10DAO.qualityManagementHistory_10Select_STATUS(map);
	    }

	}



