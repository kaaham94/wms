package WMS.Overall_status_4.presentStatusOfShipment_04;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.presentStatusOfShipment_04.presentStatusOfShipment_04Dao;
	 
	@Service("presentStatusOfShipment_04Service")
	public class presentStatusOfShipment_04ServiceImpl implements presentStatusOfShipment_04Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="presentStatusOfShipment_04DAO")
	    private presentStatusOfShipment_04Dao presentStatusOfShipment_04DAO;
	
	    @Override
	    public List<Map<String, Object>> presentStatusOfShipment_04Select(Map<String, Object> map) throws Exception {
	    	return presentStatusOfShipment_04DAO.presentStatusOfShipment_04Select(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> presentStatusOfShipment_04Select_WERKS(Map<String, Object> map) throws Exception {
	    	return presentStatusOfShipment_04DAO.presentStatusOfShipment_04Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> presentStatusOfShipment_04Select_LGORT(Map<String, Object> map) throws Exception {
	    	return presentStatusOfShipment_04DAO.presentStatusOfShipment_04Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> presentStatusOfShipment_04Select_CUST(Map<String, Object> map) throws Exception {
	    	return presentStatusOfShipment_04DAO.presentStatusOfShipment_04Select_CUST(map);
	    }

	    @Override
	    public List<Map<String, Object>> presentStatusOfShipment_04Select_KUNNR(Map<String, Object> map) throws Exception {
	    	return presentStatusOfShipment_04DAO.presentStatusOfShipment_04Select_KUNNR(map);
	    }


	}



