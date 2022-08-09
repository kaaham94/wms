package WMS.Overall_status_4.detailStatusOfShipment_05;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("detailStatusOfShipment_05DAO")
public class detailStatusOfShipment_05Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> detailStatusOfShipment_05Select(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStatusOfShipment_05.detailStatusOfShipment_05Select", map);     
	 }
	
	 public List<Map<String, Object>> detailStatusOfShipment_05Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStatusOfShipment_05.detailStatusOfShipment_05Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> detailStatusOfShipment_05Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStatusOfShipment_05.detailStatusOfShipment_05Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> detailStatusOfShipment_05Select_CUST(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStatusOfShipment_05.detailStatusOfShipment_05Select_CUST", map);     
	 }

	public List<Map<String, Object>> detailStatusOfShipment_05Select_KUNNR(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("detailStatusOfShipment_05.detailStatusOfShipment_05Select_KUNNR", map);     
	}
	 
}
