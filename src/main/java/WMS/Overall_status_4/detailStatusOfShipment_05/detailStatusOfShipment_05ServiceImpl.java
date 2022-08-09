package WMS.Overall_status_4.detailStatusOfShipment_05;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Overall_status_4.detailStatusOfShipment_05.detailStatusOfShipment_05Dao;
	 
	@Service("detailStatusOfShipment_05Service")
	public class detailStatusOfShipment_05ServiceImpl implements detailStatusOfShipment_05Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="detailStatusOfShipment_05DAO")
	    private detailStatusOfShipment_05Dao detailStatusOfShipment_05DAO;
	
	    @Override
	    public List<Map<String, Object>> detailStatusOfShipment_05Select(Map<String, Object> map) throws Exception {
	    	return detailStatusOfShipment_05DAO.detailStatusOfShipment_05Select(map);
	    }  
	    
	    @Override
	    public List<Map<String, Object>> detailStatusOfShipment_05Select_WERKS(Map<String, Object> map) throws Exception {
	    	return detailStatusOfShipment_05DAO.detailStatusOfShipment_05Select_WERKS(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> detailStatusOfShipment_05Select_LGORT(Map<String, Object> map) throws Exception {
	    	return detailStatusOfShipment_05DAO.detailStatusOfShipment_05Select_LGORT(map);
	    } 
	    
	    @Override
	    public List<Map<String, Object>> detailStatusOfShipment_05Select_CUST(Map<String, Object> map) throws Exception {
	    	return detailStatusOfShipment_05DAO.detailStatusOfShipment_05Select_CUST(map);
	    }

	    @Override
	    public List<Map<String, Object>> detailStatusOfShipment_05Select_KUNNR(Map<String, Object> map) throws Exception {
	    	return detailStatusOfShipment_05DAO.detailStatusOfShipment_05Select_KUNNR(map);
	    }


	}



