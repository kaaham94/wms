package WMS.Standard_infomation_1.main_menu;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

	 
	@Service("main_menuService")
	public class main_menuServiceImpl implements main_menuService{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="main_menuDAO")
	    private main_menuDao main_menuDAO;
	
	    @Override
	    public List<Map<String, Object>> noticeSelect(Map<String, Object> map) throws Exception {
	    	return main_menuDAO.noticeSelect(map);
	    }    
	}



