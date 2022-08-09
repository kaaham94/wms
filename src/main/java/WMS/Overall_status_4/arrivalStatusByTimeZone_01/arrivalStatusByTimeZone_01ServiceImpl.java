package WMS.Overall_status_4.arrivalStatusByTimeZone_01;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.arrivalStatusByTimeZone_01.arrivalStatusByTimeZone_01Dao;
	 
	@Service("arrivalStatusByTimeZone_01Service")
	public class arrivalStatusByTimeZone_01ServiceImpl implements arrivalStatusByTimeZone_01Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="arrivalStatusByTimeZone_01DAO")
	    private arrivalStatusByTimeZone_01Dao arrivalStatusByTimeZone_01DAO;
	
	    @Override
	    public List<Map<String, Object>> arrivalStatusByTimeZone_01Select_right(Map<String, Object> map) throws Exception {
	    	return arrivalStatusByTimeZone_01DAO.arrivalStatusByTimeZone_01Select_right(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatusByTimeZone_01Select_right_bottom(Map<String, Object> map) throws Exception {
	    	return arrivalStatusByTimeZone_01DAO.arrivalStatusByTimeZone_01Select_right_bottom(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatusByTimeZone_01Select_left(Map<String, Object> map) throws Exception {
	    	return arrivalStatusByTimeZone_01DAO.arrivalStatusByTimeZone_01Select_left(map);
	    }   
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatusByTimeZone_01Select_WERKS(Map<String, Object> map) throws Exception {
	    	return arrivalStatusByTimeZone_01DAO.arrivalStatusByTimeZone_01Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatusByTimeZone_01Select_LGORT(Map<String, Object> map) throws Exception {
	    	return arrivalStatusByTimeZone_01DAO.arrivalStatusByTimeZone_01Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> arrivalStatusByTimeZone_01Select_CUSTCD(Map<String, Object> map) throws Exception {
	    	return arrivalStatusByTimeZone_01DAO.arrivalStatusByTimeZone_01Select_CUSTCD(map);
	    }

		@Override
		public Map<String, Object> arrivalStatusByTimeZone_01InsertUpdate(List<Map<String, Object>> list)
				throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
	 

	}



