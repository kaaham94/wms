package WMS.Standard_infomation_1.partNumberMaster_08;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.partNumberMaster_08.partNumberMaster_08Dao;
	 
	@Service("partNumberMaster_08Service")
	public class partNumberMaster_08ServiceImpl implements partNumberMaster_08Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="partNumberMaster_08DAO")
	    private partNumberMaster_08Dao partNumberMaster_08DAO;
	
	    @Override
	    public List<Map<String, Object>> partNumberMaster_08Select(Map<String, Object> map) throws Exception {
	    	return partNumberMaster_08DAO.partNumberMaster_08Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> partNumberMaster_08Select_CUSTCD(Map<String, Object> map) throws Exception {
	    	return partNumberMaster_08DAO.partNumberMaster_08Select_CUSTCD(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> partNumberMaster_08Select_CODE(Map<String, Object> map) throws Exception {
	    	return partNumberMaster_08DAO.partNumberMaster_08Select_CODE(map);
	    } 
	    
	    @Override
	    public Map<String, Object> partNumberMaster_08InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return partNumberMaster_08DAO.partNumberMaster_08InsertUpdate(list);
	    }    

	
	}



