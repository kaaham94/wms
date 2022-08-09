package WMS.Overall_status_4.materialsDetail_03;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("materialsDetail_03DAO")
public class materialsDetail_03Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> materialsDetail_03Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("materialsDetail_03.materialsDetail_03Select", map);     
	 }
	
	 public List<Map<String, Object>> materialsDetail_03Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("materialsDetail_03.materialsDetail_03Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> materialsDetail_03Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("materialsDetail_03.materialsDetail_03Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> materialsDetail_03Select_LIFNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("materialsDetail_03.materialsDetail_03Select_LIFNR", map);     
	 }
	 
	 public List<Map<String, Object>> materialsDetail_03Select_BSART(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("materialsDetail_03.materialsDetail_03Select_BSART", map);     
	 }

	public List<Map<String, Object>> materialsDetail_03Select_KUNNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("materialsDetail_03.materialsDetail_03Select_KUNNR", map);     
	}
	 
}
