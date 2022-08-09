package WMS.Standard_infomation_1.storageLocation_04;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.storageLocation_04.storageLocation_04Dao;
	 
	@Service("storageLocation_04Service")
	public class storageLocation_04ServiceImpl implements storageLocation_04Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="storageLocation_04DAO")
	    private storageLocation_04Dao storageLocation_04DAO;
	
	    @Override
	    public List<Map<String, Object>> storageLocation_04Select(Map<String, Object> map) throws Exception {
	    	return storageLocation_04DAO.storageLocation_04Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> storageLocation_04Select_PLANTNAME(Map<String, Object> map) throws Exception {
	    	return storageLocation_04DAO.storageLocation_04Select_PLANTNAME(map);
	    }    
	    
	    @Override
	    public Map<String, Object> storageLocation_04InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return storageLocation_04DAO.storageLocation_04InsertUpdate(list);
	    }    

	
	}



