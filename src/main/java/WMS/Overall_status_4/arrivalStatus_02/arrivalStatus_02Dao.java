package WMS.Overall_status_4.arrivalStatus_02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("arrivalStatus_02DAO")
public class arrivalStatus_02Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> arrivalStatus_02Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("arrivalStatus_02.arrivalStatus_02Select", map);     
	 }
	
	 public List<Map<String, Object>> arrivalStatus_02Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("arrivalStatus_02.arrivalStatus_02Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> arrivalStatus_02Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("arrivalStatus_02.arrivalStatus_02Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> arrivalStatus_02Select_LIFNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("arrivalStatus_02.arrivalStatus_02Select_LIFNR", map);     
	 }
	 
	 public List<Map<String, Object>> arrivalStatus_02Select_BSART(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("arrivalStatus_02.arrivalStatus_02Select_BSART", map);     
	 }

	public List<Map<String, Object>> arrivalStatus_02Select_KUNNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("arrivalStatus_02.arrivalStatus_02Select_KUNNR", map);     
	}
	 
}
