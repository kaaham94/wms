package WMS.Standard_infomation_1.code_01;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import WMS.Standard_infomation_1.code_01.code_01Dao;
	 
	@Service("code_01Service")
	public class code_01ServiceImpl implements code_01Service{
	    Logger log = Logger.getLogger(this.getClass());
	     
	    @Resource(name="code_01DAO")
	    private code_01Dao code_01DAO;
	
	    @Override
	    public List<Map<String, Object>> code_01Select(Map<String, Object> map) throws Exception {
	    	return code_01DAO.noticeSelect(map);
	    }    
	    
	    @Override
	    public List<Map<String, Object>> code_01Search_CODEGRP() throws Exception {
	    	return code_01DAO.code_01Search_CODEGRP();
	    }  
	
	    @Override
	    public Map<String, Object> code_01Insert_code(List<Map<String, Object>> list) throws Exception {
	    	return code_01DAO.code_01Insert_code(list);
	    }    
	  
	    @Override
	    public Map<String, Object> code_01Insert_codeType(List<Map<String, Object>> list) throws Exception {
	    	return code_01DAO.code_01Insert_codeType(list);
	    }    

	    @Override
	    public Map<String, Object> code_01Update_code(List<Map<String, Object>> list) throws Exception {
	    	return code_01DAO.code_01Update_code(list);
	    }
	
	    @Override
		public  Map<String, Object> code_01Delete_code(List<Map<String, Object>> list) throws Exception {
	    	return code_01DAO.code_01Delete_code(list);
	    }
	}



