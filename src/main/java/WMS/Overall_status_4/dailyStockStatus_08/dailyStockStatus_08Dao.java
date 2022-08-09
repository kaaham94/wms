package WMS.Overall_status_4.dailyStockStatus_08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("dailyStockStatus_08DAO")
public class dailyStockStatus_08Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> dailyStockStatus_08Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyStockStatus_08.dailyStockStatus_08Select", map);     
	 }
	
	 public List<Map<String, Object>> dailyStockStatus_08Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyStockStatus_08.dailyStockStatus_08Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> dailyStockStatus_08Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyStockStatus_08.dailyStockStatus_08Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> dailyStockStatus_08Select_STATUS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyStockStatus_08.dailyStockStatus_08Select_STATUS", map);     
	 }

	public List<List<Object>> dailyStockStatus_08Select_LOC(List<List<Object>> map) throws Exception{
		
		 return (List<List<Object>>)selectList("dailyStockStatus_08.dailyStockStatus_08Select_LOC", map);     
	}
	 
}
