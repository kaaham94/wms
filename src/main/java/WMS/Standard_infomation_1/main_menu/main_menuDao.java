package WMS.Standard_infomation_1.main_menu;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import WMS.common.dao.AbstractDAO;



@Repository("main_menuDAO")
public class main_menuDao extends AbstractDAO{
	 
	 @SuppressWarnings("unchecked")

	 public List<Map<String, Object>> noticeSelect(Map<String, Object> map) throws Exception{
		 return (List<Map<String, Object>>)selectList("main_menu.noticeSelect", map);     
	 }
}
