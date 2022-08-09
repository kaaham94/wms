package WMS.Standard_infomation_1.imageReference_05;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import WMS.Standard_infomation_1.imageReference_05.imageReference_05Dao;
	 
	@Service("imageReference_05Service")
	public class imageReference_05ServiceImpl implements imageReference_05Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="imageReference_05DAO")
	    private imageReference_05Dao imageReference_05DAO;
	
	    @Override
	    public List<Map<String, Object>> imageReference_05Select(Map<String, Object> map) throws Exception {
	    	return imageReference_05DAO.imageReference_05Select(map);
	    }    
	    
	    @Override
	    public Map<String, Object> imageReference_05Select_VIEWIMAGE(Map<String, Object> map) throws Exception {
	    	return imageReference_05DAO.imageReference_05Select_VIEWIMAGE(map);
	    }    
	    
	    @Override
	    public Map<String, Object> imageReference_05InsertUpdate(Map<String, Object> map) throws Exception {
	    	return imageReference_05DAO.imageReference_05InsertUpdate(map);
	    }    
	  
	 

	
	}



