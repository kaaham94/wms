package WMS.SysMember.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.SysMember.dao.SysMemberDao;

	 
	@Service("sysMemberService")
	public class SysMemberServiceImpl implements SysMemberService{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="sysMemberDAO")
	    private SysMemberDao sysMemberDAO;
	     
	    @Override
	    public List<Map<String, Object>> list_SysMember(Map<String, Object> map) throws Exception {
	        return sysMemberDAO.list_SysMember(map);
	    }
	   
	    @Override
	    public Map<String, Object> view_SysMember(Map<String, Object> map) throws Exception {
	        Map<String, Object> resultMap = sysMemberDAO.view_SysMember(map);
	        //sysMemberDAO.updateHitCnt(map);
	        return resultMap;
	    }    
	  
	    @Override
	    public void updateInsert_SysMember(Map<String, Object> commandMap) throws Exception {
	 
	    	if (commandMap.get("save_Return") == "insert") {
	    		sysMemberDAO.insert_SysMember(commandMap);
	    		
	    	}else if (commandMap.get("save_Return") =="update") {
	    		sysMemberDAO.update_SysMember(commandMap);
	    	
	    	}
	    }
	    @Override
	    public void delete_SysMember(Map<String, Object> commandMap) throws Exception {
	    	//  sampleDAO.updateHitCnt(map);
	    	
	    	sysMemberDAO.delete_SysMember(commandMap);
	    }

	    @Override
	    public List<Map<String, Object>> excelALLDown_SysMember(Map<String, Object> map) throws Exception{
	    	return sysMemberDAO.excelALLDown_SysMember(map);
	    }
	    
	    @Override
	    public Map <String, Object> login_check(Map<String, Object> map) throws Exception {
	    	Map<String, Object> resultMap = sysMemberDAO.login_check(map);
	    	//sysMemberDAO.updateIP(map);
	    	return resultMap;
	    }    
	    
	    //new 
	    public Map <String, Object> login_check_new(Map<String, Object> map) throws Exception {
	    	Map<String, Object> resultMap = sysMemberDAO.login_check_new(map);
	    	return resultMap;
	    }
	    
	}



