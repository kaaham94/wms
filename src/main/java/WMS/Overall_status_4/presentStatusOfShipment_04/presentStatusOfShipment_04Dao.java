package WMS.Overall_status_4.presentStatusOfShipment_04;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("presentStatusOfShipment_04DAO")
public class presentStatusOfShipment_04Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> presentStatusOfShipment_04Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("presentStatusOfShipment_04.presentStatusOfShipment_04Select", map);     
	 }
	
	 public List<Map<String, Object>> presentStatusOfShipment_04Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("presentStatusOfShipment_04.presentStatusOfShipment_04Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> presentStatusOfShipment_04Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("presentStatusOfShipment_04.presentStatusOfShipment_04Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> presentStatusOfShipment_04Select_CUST(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("presentStatusOfShipment_04.presentStatusOfShipment_04Select_CUST", map);     
	 }

	public List<Map<String, Object>> presentStatusOfShipment_04Select_KUNNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("presentStatusOfShipment_04.presentStatusOfShipment_04Select_KUNNR", map);     
	}
	 
}
