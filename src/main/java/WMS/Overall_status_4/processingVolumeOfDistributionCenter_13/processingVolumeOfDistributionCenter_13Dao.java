package WMS.Overall_status_4.processingVolumeOfDistributionCenter_13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import WMS.common.common.CommandMap;
import WMS.common.dao.AbstractDAO;



@Repository("processingVolumeOfDistributionCenter_13DAO")
public class processingVolumeOfDistributionCenter_13Dao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<List<Map<String, Object>>> processingVolumeOfDistributionCenter_13Select(Map<String, Object> map) throws Exception{
		 
		 return (List<List<Map<String, Object>>>)selectList("processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Select", map);     
	 }
	
	 public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_WERKS(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Select_WERKS", map);     
	 }

	 public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_LGORT(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Select_LGORT", map);     
	 }
	 
	 public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_BSART(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Select_BSART", map);     
	 }
	 
	 public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_SHGBN(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Select_SHGBN", map);     
	 }
	 
	 public List<Map<String, Object>> processingVolumeOfDistributionCenter_13Select_PODO(Map<String, Object> map) throws Exception{
		 
		 return (List<Map<String, Object>>)selectList("processingVolumeOfDistributionCenter_13.processingVolumeOfDistributionCenter_13Select_PODO", map);     
	 }
	 
}
