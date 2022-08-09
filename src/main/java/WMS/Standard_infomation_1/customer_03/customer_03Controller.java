package WMS.Standard_infomation_1.customer_03;

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
public class customer_03Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="customer_03Service")
    private customer_03Service customer_03Service;
     
     
    //page load
    @RequestMapping(value="/Standard_infomation_1/customer_03List.do") 
	public ModelAndView customer_03List( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Standard_infomation_1/customer_03");
				
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
    @RequestMapping(value="/Standard_infomation_1/customer_03InsertUpdate.do")
    public ModelAndView customer_03Insert_codeType(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            				//코드,		거래처명,	  거래처 FULL명칭,	공급처,	납품처,	  제조사
            String[] temp = {"MANDT", "CUSTCD", "CUSTNM", "CUSTFULLNM", "IFLAG", "OFLAG", "MFLAG",
            				//품번 채번코드,  바코드 채번코드,	 거래처 이니셜, 사업자 번호, 담당자
            				"MATNRCODE", "BARINDEXCODE", "INITIAL", "REGNO", "SMAN",
            				//이메일,	 전화1, 	 전화2,	  팩스,	  주소,	 메모,	  사용유무,		사용자, 	   신규여부
            				"EMAIL", "TEL1", "TEL2", "FAX1", "ADDR", "MEMO", "USEFLAG", "USERID", "NEWFLAG" };
           
        	
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
            
          //9.customer_03Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = customer_03Service.customer_03InsertUpdate(list); 
            mv.addObject("value", returnMap.get("value"));
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
            
        } catch (Exception e) {
        	e.printStackTrace();
            return mv;
        }
    	return mv;
    }
    
    
    
    //search
    @RequestMapping(value="/customer_03/customer_03Select.do") 
    public ModelAndView customer_03Select_test (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
            		
		  //{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("CUSTCD"), 	"", 		"CUSTCD"},		//1.(text)	거래처코드  
			{(String) commandMap.get("CUSTNM"), 	"", 		"CUSTNM"}, 		//2.(text) 	거래처명 
			{(String) commandMap.get("USEFLAG"), 	"Y", 		"USEFLAG"}, 	//3.(select)사용유무 
			{(String) commandMap.get("IFLAG"), 		"", 		"IFLAG"}, 		//4.(checkbox)공급처 
			{(String) commandMap.get("OFLAG"), 		"", 		"OFLAG"}, 		//5.(checkbox)납품처 
			{(String) commandMap.get("MFLAG"), 		"", 		"MFLAG"}, 		//6.(checkbox)제조사 
			{(String) commandMap.get("orderby"),	"CUSTCD", 	"orderby"},		//7.(select)정렬 
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> list = customer_03Service.customer_03Select(map); //db 리스트 출력 
		mv.addObject("list", list);
		mv.addObject("map", map);
		
    	return mv;
    }
    
}
    
   

     
  
