package WMS.Overall_status_4.stockStatus_06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("stockStatus_06DAO")
public class stockStatus_06Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> stockStatus_06Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("stockStatus_06.stockStatus_06Select", map);     
	 }
	
	 public List<Map<String, Object>> stockStatus_06Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("stockStatus_06.stockStatus_06Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> stockStatus_06Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("stockStatus_06.stockStatus_06Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> stockStatus_06Select_STATUS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("stockStatus_06.stockStatus_06Select_STATUS", map);     
	 }

	public List<List<Object>> stockStatus_06Select_LOC(List<List<Object>> map) throws Exception{
		
		 return (List<List<Object>>)selectList("stockStatus_06.stockStatus_06Select_LOC", map);     
	}
	 
}
