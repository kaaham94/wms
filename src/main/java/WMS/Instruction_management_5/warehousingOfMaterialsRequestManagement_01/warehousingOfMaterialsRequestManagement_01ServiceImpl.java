package WMS.Instruction_management_5.warehousingOfMaterialsRequestManagement_01;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Instruction_management_5.warehousingOfMaterialsRequestManagement_01.warehousingOfMaterialsRequestManagement_01Dao;
	 
	@Service("warehousingOfMaterialsRequestManagement_01Service")
	public class warehousingOfMaterialsRequestManagement_01ServiceImpl implements warehousingOfMaterialsRequestManagement_01Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="warehousingOfMaterialsRequestManagement_01DAO")
	    private warehousingOfMaterialsRequestManagement_01Dao warehousingOfMaterialsRequestManagement_01DAO;
	
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_right(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_right(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_bottom(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_bottom(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_left(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_left(map);
	    }   
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_WERKS(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LGORT(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_CUSTCD(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_CUSTCD(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LIFNR(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_LIFNR(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_LFART(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_LFART(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> warehousingOfMaterialsRequestManagement_01Select_OUTCUST(Map<String, Object> map) throws Exception {
	    	return warehousingOfMaterialsRequestManagement_01DAO.warehousingOfMaterialsRequestManagement_01Select_OUTCUST(map);
	    }

		@Override
		public Map<String, Object> warehousingOfMaterialsRequestManagement_01InsertUpdate(List<Map<String, Object>> list)
				throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	 

	}



