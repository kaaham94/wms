package WMS.Standard_infomation_1.PDAip_09;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.PDAip_09.PDAip_09Dao;
	 
	@Service("PDAip_09Service")
	public class PDAip_09ServiceImpl implements PDAip_09Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="PDAip_09DAO")
	    private PDAip_09Dao PDAip_09DAO;
	
	    @Override
	    public List<Map<String, Object>> PDAip_09Select(Map<String, Object> map) throws Exception {
	    	return PDAip_09DAO.PDAip_09Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> PDAip_09Select_WERKS(Map<String, Object> map) throws Exception {
	    	return PDAip_09DAO.PDAip_09Select_WERKS(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> PDAip_09Select_LGORT(Map<String, Object> map) throws Exception {
	    	return PDAip_09DAO.PDAip_09Select_LGORT(map);
	    }  
	
	    @Override
	    public Map<String, Object> PDAip_09Insert(List<Map<String, Object>> list) throws Exception {
	    	return PDAip_09DAO.PDAip_09Insert(list);
	    }    

	    @Override
	    public Map<String, Object> PDAip_09Update(List<Map<String, Object>> list) throws Exception {
	    	return PDAip_09DAO.PDAip_09Update(list);
	    }
	    
	    @Override
		public  Map<String, Object> PDAip_09Delete(List<Map<String, Object>> list) throws Exception {
	    	return PDAip_09DAO.PDAip_09Delete(list);
	    }
	
	}



