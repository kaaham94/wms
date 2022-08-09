package WMS.Overall_status_4.qualityManagementHistory_10;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("qualityManagementHistory_10DAO")
public class qualityManagementHistory_10Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> qualityManagementHistory_10Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("qualityManagementHistory_10.qualityManagementHistory_10Select", map);     
	 }
	
	 public List<Map<String, Object>> qualityManagementHistory_10Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("qualityManagementHistory_10.qualityManagementHistory_10Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> qualityManagementHistory_10Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("qualityManagementHistory_10.qualityManagementHistory_10Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> qualityManagementHistory_10Select_STATUS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("qualityManagementHistory_10.qualityManagementHistory_10Select_STATUS", map);     
	 }
	 
	
	 
}
