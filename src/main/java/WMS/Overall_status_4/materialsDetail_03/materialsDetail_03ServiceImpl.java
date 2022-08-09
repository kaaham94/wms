package WMS.Overall_status_4.materialsDetail_03;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.materialsDetail_03.materialsDetail_03Dao;
	 
	@Service("materialsDetail_03Service")
	public class materialsDetail_03ServiceImpl implements materialsDetail_03Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="materialsDetail_03DAO")
	    private materialsDetail_03Dao materialsDetail_03DAO;
	
	    @Override
	    public List<Map<String, Object>> materialsDetail_03Select(Map<String, Object> map) throws Exception {
	    	return materialsDetail_03DAO.materialsDetail_03Select(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> materialsDetail_03Select_WERKS(Map<String, Object> map) throws Exception {
	    	return materialsDetail_03DAO.materialsDetail_03Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> materialsDetail_03Select_LGORT(Map<String, Object> map) throws Exception {
	    	return materialsDetail_03DAO.materialsDetail_03Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> materialsDetail_03Select_LIFNR(Map<String, Object> map) throws Exception {
	    	return materialsDetail_03DAO.materialsDetail_03Select_LIFNR(map);
	    }

	    @Override
	    public List<Map<String, Object>> materialsDetail_03Select_BSART(Map<String, Object> map) throws Exception {
	    	return materialsDetail_03DAO.materialsDetail_03Select_BSART(map);
	    }

	    @Override
	    public List<Map<String, Object>> materialsDetail_03Select_KUNNR(Map<String, Object> map) throws Exception {
	    	return materialsDetail_03DAO.materialsDetail_03Select_KUNNR(map);
	    }


	}



