package WMS.Management_of_workers_3.user_01;

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
public class user_01Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="user_01Service")
    private user_01Service user_01Service;
    
     
    //page load
    @RequestMapping("/Management_of_workers_3/user_01List.do") 
	public ModelAndView user_01Select( HttpSession session, HttpServletRequest request   ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("/Management_of_workers_3/user_01");
			
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
 
  
    
    //insert 
    @RequestMapping(value="/Management_of_workers_3/user_01InsertUpdate.do")
    public ModelAndView user_01Insert_codeType(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {	
            		"WKCOD"	 
            		,"DEPT"	
            		,"JKCOD"
            		,"USERNAME" 
            		,"ENGNAME"  
            		,"USERID"   
            		,"STYPE"	
            		,"DATEFROM"
            		,"DATETO"	
            		,"STAT2"	
            		,"AUTH"	
            		,"PLANTCD"	
            		,"LGORT"	
            		,"OUTSCFLAG"
            		,"STCAUTH"	 
            		,"EMAIL"    
            		,"MANDT"    
            		,"NEWFLAG"  
            		,"DEPTNM"   
            		,"UPDUSER"  
            		,"DIRECT"   
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
            
          //9.user_01Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = user_01Service.user_01InsertUpdate(list); 
            mv.addObject("value", returnMap.get("value"));
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
            System.out.println("Controller : value->"+returnMap.get("value"));
            System.out.println("\nController : result->"+returnMap.get("result"));
        } catch (Exception e) {
        	e.printStackTrace();
            return mv;
        }
    	return mv;
    }
    
  //select
    @RequestMapping(value="/user_01/user_01Select_LGORT.do") 
    public ModelAndView PDAip_09Select_LGORT (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
            		
		  //{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("WERKS"), 		"", 		"WERKS"}		//1.(select)법인코드  
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> Select_LGORT = user_01Service.user_01Select_LGORT(map); //근로구분 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
    //search
    @RequestMapping(value="/user_01/user_01Select.do") 
    public ModelAndView user_01Select_test (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
            		
    			//{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
    			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
    			{(String) commandMap.get("WERKS"), 		"", 		"WERKS"},		//1.(select)법인  
    			{(String) commandMap.get("DEPT"), 		"", 		"DEPT"}, 		//2.(select)부서 
    			{(String) commandMap.get("STATUS"), 	"", 		"STATUS"}, 		//3.(select)상태 
    			{(String) commandMap.get("USERID"), 	"", 		"USERID"}, 		//4.(text)	사용자ID
    			{(String) commandMap.get("USERNAME"), 	"",		 	"USERNAME"}, 	//5.(text)	사용자명
    			{(String) commandMap.get("STYPE"),		"", 		"STYPE"},		//6.(select)근로구분 
    			{(String) commandMap.get("WKCOD"),		"", 		"WKCOD"},		//7.(select)작업자구분 
    			{(String) commandMap.get("JKCOD"),		"", 		"JKCOD"},		//8.(select)직급 
    			{(String) commandMap.get("orderby"),	"", 		"orderby"}		//9.(select)정렬 
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> list = user_01Service.user_01Select(map); //db 리스트 출력 
		List<Map<String,Object>> Select_WERKS = user_01Service.user_01Select_WERKS(map); //법인 리스트 출력
		List<Map<String,Object>> Select_DEPT  = user_01Service.user_01Select_DEPT (map); //부서 리스트 출력
		List<Map<String,Object>> Select_STAT2 = user_01Service.user_01Select_STAT2(map); //상태 리스트 출력
		List<Map<String,Object>> Select_WKCOD = user_01Service.user_01Select_WKCOD(map); //작업자구분 리스트 출력
		List<Map<String,Object>> Select_JKCOD = user_01Service.user_01Select_JKCOD(map); //직급 리스트 출력
		List<Map<String,Object>> Select_STYPE = user_01Service.user_01Select_STYPE(map); //근로구분 리스트 출력
		List<Map<String,Object>> Select_AUTH = user_01Service.user_01Select_AUTH(map); //근로구분 리스트 출력
		List<Map<String,Object>> Select_LGORT = user_01Service.user_01Select_LGORT(map); //저장위치 리스트 출력

		mv.addObject("list", list);
		
		mv.addObject("map", map);
		mv.addObject("Select_WERKS",Select_WERKS);
		mv.addObject("Select_DEPT",Select_DEPT);
		mv.addObject("Select_STAT2",Select_STAT2);
		mv.addObject("Select_WKCOD",Select_WKCOD);
		mv.addObject("Select_JKCOD",Select_JKCOD);
		mv.addObject("Select_STYPE",Select_STYPE);
		mv.addObject("Select_AUTH",Select_AUTH);
		mv.addObject("Select_LGORT",Select_LGORT);
		
    	return mv;
    }
    
    
    //delete
    @RequestMapping(value="/Management_of_workers_3/user_01Delete.do")
    public ModelAndView code_01Delete_code(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {"USERID" ,"MANDT"};
        	
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
            Map<String, Object> returnMap = user_01Service.user_01Delete(list); 
          
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
        } catch (Exception e) {
            e.printStackTrace();
            return mv;
        }
    	return mv;
    }    
    
    
    //password reset
    @RequestMapping(value="/Management_of_workers_3/user_01PasswordReset.do")
    public ModelAndView user_01PasswordReset(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {"USERID" ,"MANDT"};
        	
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
            Map<String, Object> returnMap = user_01Service.user_01PasswordReset(list); 
          
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
        } catch (Exception e) {
            e.printStackTrace();
            return mv;
        }
    	return mv;
    }  
}
    
   

     
  
