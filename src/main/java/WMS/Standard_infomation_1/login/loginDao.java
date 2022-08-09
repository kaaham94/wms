package WMS.Standard_infomation_1.login;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import WMS.common.dao.AbstractDAO;



@Repository("loginDAO")
public class loginDao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")
	 public Map<String, Object> login_check(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectOne("login.login_check", map);
	 }
	 
	 @SuppressWarnings("unchecked")
	 public Map<String, Object> login_info(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectOne("login.login_info", map);
	 }

	 @SuppressWarnings("unchecked")
	 public List<Map<String, Object>> loginSelect_MENU(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("login.loginSelect_MENU", map);     
	 }

	 @SuppressWarnings("unchecked")
	 public List<Map<String, Object>> loginSelect_PROG(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("login.loginSelect_PROG", map);     
	 }
	 
	 @SuppressWarnings("unchecked")
	 public Map<String, Object> loginSelect_ChoicePROG(Map<String, Object> map) throws Exception{
		 
		 return (Map<String, Object>)selectOne("login.loginSelect_ChoicePROG", map);     
		 
	 }
	 
	 @SuppressWarnings("unchecked")
	 public List<Map<String, Object>> loginSelect_TabPROG(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("login.loginSelect_TabPROG", map);     
	 }
}
