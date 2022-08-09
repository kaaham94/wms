package WMS.Overall_status_4.processingVolumeOfDistributionCenter_13;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.Overall_status_4.processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Dao;
	 
	@Service("processingVolumeOfDistributionCenter_13Service")
	public class processingVolumeOfDistributionCenter_13ServiceImpl implements processingVolumeOfDistributionCenter_13Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="processingVolumeOfDistributionCenter_13DAO")
	    private processingVolumeOfDistributionCenter_13Dao processingVolumeOfDistributionCenter_13DAO;
	
	    @Override
	    public List<List<Map<String, Object>>> processingVolumeOfDistributionCenter_13Select(Map<String, Object> map) throws Exception {
	    	return processingVolumeOfDistributionCenter_13DAO.processingVolumeOfDistributionCenter_13Select(map);
	    }  
	 
	    @Override
	    public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_WERKS(Map<String, Object> map) throws Exception {
	    	return processingVolumeOfDistributionCenter_13DAO.processingVolumeOfDistributionCenter_13Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_LGORT(Map<String, Object> map) throws Exception {
	    	return processingVolumeOfDistributionCenter_13DAO.processingVolumeOfDistributionCenter_13Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_BSART(Map<String, Object> map) throws Exception {
	    	return processingVolumeOfDistributionCenter_13DAO.processingVolumeOfDistributionCenter_13Select_BSART(map);
	    } 
	  
	    @Override
	    public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_SHGBN(Map<String, Object> map) throws Exception {
	    	return processingVolumeOfDistributionCenter_13DAO.processingVolumeOfDistributionCenter_13Select_SHGBN(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_PODO(Map<String, Object> map) throws Exception {
	    	return processingVolumeOfDistributionCenter_13DAO.processingVolumeOfDistributionCenter_13Select_PODO(map);
	    } 
	    
	}



