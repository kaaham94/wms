package WMS.Overall_status_4.dailyReceiving_14;

import java.util.ArrayList;
import java.util.Enumeration;
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
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.CommandMap;
import WMS.common.common.PagingDTO;
import WMS.common.common.TapDTO;
@Controller
public class dailyReceiving_14Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="dailyReceiving_14Service")
    private dailyReceiving_14Service dailyReceiving_14Service;
     
    //page load
    @RequestMapping("/Overall_status_4/dailyReceiving_14List.do") 
	public ModelAndView dailyReceiving_14( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Overall_status_4/dailyReceiving_14");
				
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

  
    
    @RequestMapping(value="/Overall_status_4/dailyReceiving_14Select.do") 
    public ModelAndView dailyReceiving_14Select (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
    			
    			//{"0.인자값",   					  		"1.초기값", 			"2.map 키명" } 			
    			  {(String) commandMap.get("YYMM"),      	"", 				"YYMM"    	},  // 연월                      
    			  {(String) commandMap.get("MATNR"),   		"",					"MATNR"		},  // 품목
				  {(String) commandMap.get("STYPE"),      	"",					"STYPE"	  	},  // QTY(상품수량) / BOX(박스갯수)
    			  {(String) commandMap.get("USERID"),      	"",					"USERID"	},  // 사용자
    			  {(String) commandMap.get("MANDT"),     	"100",  			"MANDT"	   	},  // 클라이언트
    			  {(String) commandMap.get("WERKS"),        "",					"WERKS"	  	}   // 법인
       	};                                                 
		           
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}

		List<Map<String,Object>> Select_WERKS = dailyReceiving_14Service.dailyReceiving_14Select_WERKS(map); 	//법인 리스트 출력  
		List<Map<String,Object>> list = dailyReceiving_14Service.dailyReceiving_14Select(map); //db 리스트 출력
		
		mv.addObject("Select_WERKS",Select_WERKS);	//법인
		mv.addObject("list", list);		
		mv.addObject("map", map);
	
    	return mv;
    }
 
}
    
   

     
  
