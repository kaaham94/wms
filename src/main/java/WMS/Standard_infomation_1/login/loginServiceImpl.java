package WMS.Standard_infomation_1.login;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import WMS.Standard_infomation_1.login.loginDao;

 
@Service("loginService")
public class loginServiceImpl implements loginService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="loginDAO")
    private loginDao loginDAO;

    @Override
    public Map <String, Object> login_check(Map<String, Object> map) throws Exception {
    	Map<String, Object> resultMap = loginDAO.login_check(map);
    	//sysMemberDAO.updateIP(map);
    	return resultMap;
    }    
    
    @Override
    public Map <String, Object> login_info(Map<String, Object> map) throws Exception {
    	Map<String, Object> resultMap = loginDAO.login_info(map);
    	return resultMap;
    }  
    
    @Override
    public List<Map<String, Object>> loginSelect_MENU(Map<String, Object> map) throws Exception {
    	return loginDAO.loginSelect_MENU(map);
    } 
    
    @Override
    public List<Map<String, Object>> loginSelect_PROG(Map<String, Object> map) throws Exception {
    	return loginDAO.loginSelect_PROG(map);
    } 
    
    @Override
    public Map <String, Object> loginSelect_ChoicePROG(Map<String, Object> map) throws Exception {
    	Map<String, Object> resultMap = loginDAO.loginSelect_ChoicePROG(map);
    	return resultMap;
    }  
    
}



