package WMS.common.common;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import WMS.Standard_infomation_1.login.loginDao;
import WMS.Standard_infomation_1.login.loginService;
import WMS.common.dao.AbstractDAO;

@Component
public class TapDTO extends AbstractDAO{

 
	 private static loginDao staticDao;
	 
	 @Autowired
	 private loginDao loginDAO;
	 
	 @PostConstruct     
	 private void initStaticDao () {
	     staticDao = this.loginDAO;
	 }
	
    @Autowired
    private SqlSessionTemplate sqlSession;
    
	public static HttpSession session;				//session
	public static HttpServletRequest request;		//request
	public static List<Map<String,Object>> menuList;	//메뉴 리스트
	public static List<Map<String,Object>> progList;	//해당 페이지 리스트 
	public static List<Map<String,Object>> tabList;		//탭 페이지 리스트
	public static String MENUID;					//MENUID
	public static String PROGID;					//ProgID
	public static String MENUNAME; 					//메뉴명
	public static String KORPROGNAME; 				//해당 페이지명 
	
	public void setRequestSession(HttpSession setSession, HttpServletRequest setRequest ) {
		session = setSession;
		request = setRequest;
		
		MENUID = setRequest.getParameter("menu");
		if(MENUID == null || MENUID.equals("") || MENUID.equals("null")) {
			MENUID = "";
		}
		  
		PROGID = setRequest.getParameter("prog");
		if(PROGID == null || PROGID.equals("") || PROGID.equals("null")) {
			PROGID = "";
		}
	}

	public static void setTabList(List<Map<String,Object>> setTabList) {
		tabList = setTabList;
	}
	
	public List<Map<String,Object>> getTabList() {
		return tabList;
	}
	
	public static String getMENUNAME() {
		return MENUNAME;
	}
	
	public static void setMENUNAME(String setMENUNAME) {
		MENUNAME = setMENUNAME;
	}
	
	public static String getKORPROGNAME() {
		return KORPROGNAME;
	}
	
	public static void setKORPROGNAME(String setKORPROGNAME) {
		KORPROGNAME = setKORPROGNAME;
	}
	
	public static String getMENUID() {
		return MENUID;
	}
	
	public static void setMENUID(String setMENUID) {
		MENUID = setMENUID;
	}
	
	public static String getPROGID() {
		return PROGID;
	}
	
	public static void setPROGID(String setPROGID) {
		PROGID = setPROGID;
	}
	
	public static void setMenuList(List<Map<String,Object>> setMenuList) {
		menuList = setMenuList;
	}
	
	public List<Map<String,Object>> getMenuList() {
		return menuList;
	}
	
	public static void setProgList(List<Map<String,Object>> setProgList) {
		progList = setProgList;
	}
	
	public List<Map<String,Object>> getProgList() {
		return progList;
	}

	public static Map<String,Object> makeTitle() {
		Map<String, Object> map = new HashMap(); 
		
		map.put("PROGID", getPROGID());
		map.put("MENUID", getMENUID());
		map.put("topMenu", getMENUNAME());
		map.put("pageName", getKORPROGNAME());
		
		return map;
	}
	/*
	public static List<Map<String,Object>> makeTap( HttpServletRequest request) {
	
		  String urlSession = request.getRequestURI().toString();
		  HttpSession httpSession = request.getSession();
		  httpSession.setAttribute(pageName, urlSession);	
	
		  Enumeration enumer = null;
		  Map<String, Object> sessionAllMap = null;
		  List<Map<String,Object>> sessionAll = new ArrayList<Map<String, Object>>();
		  
		  try{
			   enumer = httpSession.getAttributeNames();
			   while(enumer.hasMoreElements()){
				   sessionAllMap = new HashMap(); 
				   String key = (String)enumer.nextElement();
				   
				   //System.out.println("key:"+(String) httpSession.getAttribute(key));
				 
					if(httpSession.getAttribute(key).toString().indexOf(".do") > -1) {
						if(urlSession.equals(httpSession.getAttribute(key)) ) {
							sessionAllMap.put("active", "active");
						}else {
							sessionAllMap.put("active", ""); 
						}
						sessionAllMap.put("tapURL", httpSession.getAttribute(key)); //url
						sessionAllMap.put("tapNAME", key); //전체현황
						sessionAll.add(sessionAllMap);
					}
				}
			   
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  
		  return sessionAll;
	}
	*/
	public void makeMenu() throws Exception {
		 
		 //메뉴 
		  Map<String,Object> map = new HashMap<String, Object>(); 
		  
		  map.put("MENUID", getMENUID());
		  map.put("PROGID", getPROGID());
		  
		  try{
			  List<Map<String,Object>> MENU = staticDao.loginSelect_MENU(map);		//db 리스트 출력
			  List<Map<String,Object>> PROG = staticDao.loginSelect_PROG(map); 		//db 리스트 출력
			  Map<String,Object> ChoicePROG = staticDao.loginSelect_ChoicePROG(map);
			  
			  setKORPROGNAME((String) ChoicePROG.get("KORPROGNAME"));
			  setMENUNAME((String) ChoicePROG.get("MENUNAME"));
			  setMENUID((String) ChoicePROG.get("MENUID"));
			  setPROGID((String) ChoicePROG.get("PROGID"));
			  setMenuList(MENU);
			  setProgList(PROG);  
			 
			  //탭
			  String TabList = (String) session.getAttribute("TabList");
			
			  if(TabList == null || TabList.equals("") || TabList.equals("null")) {
				  TabList = (String) "'"+ChoicePROG.get("PROGID")+"'";
			  }else {
				  if(TabList.indexOf((String)ChoicePROG.get("PROGID")) == -1) {
					  TabList = (String) "'"+ChoicePROG.get("PROGID")+"'"+","+TabList;
				  }
			  }
			 //TabList :'P9340','P9370','P9412','P9410','P9420','P9700','P9482','P8410','P8430'...
			  session.setAttribute("TabList", (String)TabList);	
			  
			  map.put("TapList", TabList);
			  map.put("orderByTapList", TabList.replace("'", ""));
			  List<Map<String,Object>> loginSelect_TabPROG = staticDao.loginSelect_TabPROG(map);
			  
			  setTabList(loginSelect_TabPROG);
			  
			  System.out.println("makeMenu() - map:"+map);
			  
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  
	}


	 
}
