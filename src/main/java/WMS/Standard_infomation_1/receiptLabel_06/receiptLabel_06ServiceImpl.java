package WMS.Standard_infomation_1.receiptLabel_06;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.receiptLabel_06.receiptLabel_06Dao;
	 
	@Service("receiptLabel_06Service")
	public class receiptLabel_06ServiceImpl implements receiptLabel_06Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="receiptLabel_06DAO")
	    private receiptLabel_06Dao receiptLabel_06DAO;
	
	    @Override
	    public List<Map<String, Object>> receiptLabel_06Select(Map<String, Object> map) throws Exception {
	    	return receiptLabel_06DAO.receiptLabel_06Select(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> receiptLabel_06Select_VIEWIMAGE(Map<String, Object> map) throws Exception {
	    	return receiptLabel_06DAO.receiptLabel_06Select_VIEWIMAGE(map);
	    }   
	    
	    @Override
	    public List<Map<String, Object>> receiptLabel_06Select_BARTYPE(Map<String, Object> map) throws Exception {
	    	return receiptLabel_06DAO.receiptLabel_06Select_BARTYPE(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> receiptLabel_06Select_CUSTCD(Map<String, Object> map) throws Exception {
	    	return receiptLabel_06DAO.receiptLabel_06Select_CUSTCD(map);
	    }
	    
	    @Override
	    public List<Map<String, Object>> receiptLabel_06Select_SDATETYPE(Map<String, Object> map) throws Exception {
	    	return receiptLabel_06DAO.receiptLabel_06Select_SDATETYPE(map);
	    }
	    
	    @Override
	    public Map<String, Object> receiptLabel_06InsertUpdate(List<Map<String, Object>> list) throws Exception {
	    	return receiptLabel_06DAO.receiptLabel_06InsertUpdate(list);
	    }    

	
	}



