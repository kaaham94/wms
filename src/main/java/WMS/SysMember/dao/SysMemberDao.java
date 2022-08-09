package WMS.SysMember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import WMS.common.dao.AbstractDAO;



@Repository("sysMemberDAO")
public class SysMemberDao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")
	 
	 public List<Map<String, Object>> list_SysMember(Map<String, Object> map) throws Exception{
	     
		 return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);     
	 }
	 
	 public Map<String, Object> view_SysMember(Map<String, Object> map) throws Exception{
		    return (Map<String, Object>)selectOne("sample.detail", map);
	 }
	 
	 public Map<String, Object> login_check(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectOne("sample.login_check", map);
	 }
	 
	 public void insert_SysMember(Map<String, Object> map) throws Exception{
		 	insert("sample.insert", map);
	
	 }
	 
	 public void update_SysMember(Map<String, Object> map) throws Exception{
		 	update("sample.update", map);
		 
	 }
	 
	 public List<Map<String, Object>> excelALLDown_SysMember(Map<String, Object> map) throws Exception{
			
		 return (List<Map<String, Object>>)selectList("sample.selectExcelList", map);     
	 }
	 
	 
	 public void delete_SysMember(Map<String, Object> map) throws Exception{
		 	update("sample.delete", map);
		 
	 }
	 
	 public void updateHitCnt(Map<String, Object> map) throws Exception{
		 	update("sample.updateHitCnt", map);
		 
	 }
	 
	 public void updateIP(Map<String, Object> map) throws Exception{
		 update("sample.updateIP", map);
		 
	 }
	 
	 public Map<String, Object> login_check_new (Map<String, Object> map) throws Exception {
		 return (Map<String, Object>)selectOne("hkwms.login_check_new", map);
	 }
}
