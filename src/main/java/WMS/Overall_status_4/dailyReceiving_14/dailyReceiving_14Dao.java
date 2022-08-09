package WMS.Overall_status_4.dailyReceiving_14;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("dailyReceiving_14DAO")
public class dailyReceiving_14Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> dailyReceiving_14Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyReceiving_14.dailyReceiving_14Select", map);     
	 }
	
	 public List<Map<String, Object>> dailyReceiving_14Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("dailyReceiving_14.dailyReceiving_14Select_WERKS", map);     
	 }

}
