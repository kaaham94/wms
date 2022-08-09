package WMS.Overall_status_4.dailyRelease_15;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("dailyRelease_15DAO")
public class dailyRelease_15Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> dailyRelease_15Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyRelease_15.dailyRelease_15Select", map);     
	 }
	
	 public List<Map<String, Object>> dailyRelease_15Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyRelease_15.dailyRelease_15Select_WERKS", map);     
	 }

}
