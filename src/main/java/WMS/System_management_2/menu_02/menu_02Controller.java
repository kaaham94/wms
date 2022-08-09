package WMS.System_management_2.menu_02;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.CommandMap;
import WMS.common.common.TapDTO;

@Controller
public class menu_02Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="menu_02Service")
    private menu_02Service menu_02Service;
     
    //page load
    @RequestMapping("/System_management_2/menu_02List.do") 
	public ModelAndView menu_02Select( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("System_management_2/menu_02");
				TapDTO tapDTO = new TapDTO();
				tapDTO.setRequestSession(session, request);
				tapDTO.makeMenu(); 
				mv.addObject("MENU", tapDTO.getMenuList());
				mv.addObject("PROG", tapDTO.getProgList());
				mv.addObject("map", tapDTO.makeTitle());
				mv.addObject("list", tapDTO.getTabList());
			
	        }
    	}catch (Exception e ){
			e.printStackTrace();
		} 
    	
		return mv;
	}
 
    
    //update
    @RequestMapping(value="/System_management_2/menu_02Update.do")
    public ModelAndView menu_02Update_code(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {
            		"SORTKEY",    
            		"MENUID",		
            		"MENUSTEP",   
            		"KORMENUNAME",
            		"ENGMENUNAME",
            		"CHIMENUNAME",
            		"BEFMENUID",  
            		"ETC",        
            		"USEFLAG",    
            		"UPDUSER"   
            };
        	
            //4.List<Map<String,Object>>로 json값을 SQL쿼리로 전달할 map 객체 생성. 
            Map<String, Object> listMap = null;
            
            //5. 화면에서 받아온 json배열을  for문으로   List<Map<String,Object>>로 값 삽입 
            for(int i=0; i<array.length(); i++){
      			
            	listMap = new HashMap<String, Object>() ; 
      			JSONObject tmp = (JSONObject)array.get(i);
      		
      			//6. temp배열에 있는 배열 이름으로 json 매칭  
  		    	for(String str : temp) {
  		    		
  		    		//7. Map에 값을 넣어준다.
  		    		listMap.put(str, (String)tmp.get(str));
  		    	} 		    	
  		    	//8.list객체에 List<Map<String,Object>>으로 값을 넣어준다.
  		    	list.add(listMap);
      		}
            System.out.println("list:"+ list);
            
            //9.menu_02Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = menu_02Service.menu_02Update(list); 
          
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
        } catch (Exception e) {
            e.printStackTrace();
            return mv;
        }
    	return mv;
    }    

    
    //insert 
    @RequestMapping(value="/System_management_2/menu_02Insert.do")
    public ModelAndView menu_02Insert_codeType(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {
            		"SORTKEY",    
            		"MENUID",		
            		"MENUSTEP",   
            		"KORMENUNAME",
            		"ENGMENUNAME",
            		"CHIMENUNAME",
            		"BEFMENUID",  
            		"ETC",        
            		"USEFLAG",    
            		"UPDUSER"   
            };
        	
            //4.List<Map<String,Object>>로 json값을 SQL쿼리로 전달할 map 객체 생성. 
            Map<String, Object> listMap = null;
            
            //5. 화면에서 받아온 json배열을  for문으로   List<Map<String,Object>>로 값 삽입 
            for(int i=0; i<array.length(); i++){
      			
            	listMap = new HashMap<String, Object>() ; 
      			JSONObject tmp = (JSONObject)array.get(i);
      		
      			//6. temp배열에 있는 배열 이름으로 json 매칭  
  		    	for(String str : temp) {
  		    		
  		    		//7. Map에 값을 넣어준다.
  		    		listMap.put(str, (String)tmp.get(str));
  		    	}
  		    	
  		    	//8.list객체에 List<Map<String,Object>>으로 값을 넣어준다.
  		    	list.add(listMap);
      		}
            System.out.println("list:"+ list);
            
          //9.menu_02Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = menu_02Service.menu_02Insert(list); 
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
            
        } catch (Exception e) {
        	e.printStackTrace();
            return mv;
        }
    	return mv;
    }
    
  //delete
    @RequestMapping(value="/System_management_2/menu_02Delete.do")
    public ModelAndView menu_02Delete_code(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            //System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {"MENUID"};
        	
            //4.List<Map<String,Object>>로 json값을 SQL쿼리로 전달할 map 객체 생성. 
            Map<String, Object> listMap = null;
            
            //5. 화면에서 받아온 json배열을  for문으로   List<Map<String,Object>>로 값 삽입 
            for(int i=0; i<array.length(); i++){
      			
            	listMap = new HashMap<String, Object>() ; 
      			JSONObject tmp = (JSONObject)array.get(i);
      		
      			//6. temp배열에 있는 배열 이름으로 json 매칭  
  		    	for(String str : temp) {
  		    		
  		    		//7. Map에 값을 넣어준다.
  		    		listMap.put(str, (String)tmp.get(str));
  		    	} 		    	
  		    	//8.list객체에 List<Map<String,Object>>으로 값을 넣어준다.
  		    	list.add(listMap);
      		}
            System.out.println("list:"+ list);
            
            //9.code_01Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = menu_02Service.menu_02Delete(list); 
          
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
        } catch (Exception e) {
            e.printStackTrace();
            return mv;
        }
    	return mv;
    }    
    
    //search
    @RequestMapping(value="/menu_02/menu_02Select.do") 
    public ModelAndView menu_02Select_test (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
            		
		  //{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("BEFMENUID"), 	"", 		"BEFMENUID"},	//1.(select)상위메뉴  
			{(String) commandMap.get("USEFLAG"), 	"", 		"USEFLAG"}, 	//2.(select)사용유무  
			{(String) commandMap.get("orderby"),	"SORTKEY", 	"orderby"},		//3.(select)정렬 
			{(String) commandMap.get("language"),	"KOREAN", 	"language"}		//3.(select)정렬 
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> list = menu_02Service.menu_02Select(map); //db 리스트 출력 
		List<Map<String,Object>> menu_02Select_SearchMENUNAME = menu_02Service.menu_02Select_SearchMENUNAME(map); //db 리스트 출력 
		List<Map<String,Object>> menu_02Select_GridMENUNAME = menu_02Service.menu_02Select_GridMENUNAME(map); //db 리스트 출력 
		List<Map<String,Object>> menu_02Select_LEVEL = menu_02Service.menu_02Select_LEVEL(map); //db 리스트 출력
		
		mv.addObject("map", map);
		mv.addObject("list", list);
		mv.addObject("Select_SearchMENUNAME", menu_02Select_SearchMENUNAME);
		mv.addObject("Select_GridMENUNAME", menu_02Select_GridMENUNAME);
		mv.addObject("Select_LEVEL", menu_02Select_LEVEL);
		
    	return mv;
    }
    
}
    
   

     
  
