package WMS.Overall_status_4.processingVolumeOfDistributionCenter_13;

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
public class processingVolumeOfDistributionCenter_13Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="processingVolumeOfDistributionCenter_13Service")
    private processingVolumeOfDistributionCenter_13Service processingVolumeOfDistributionCenter_13Service;
     
    //page load
    @RequestMapping("/Overall_status_4/processingVolumeOfDistributionCenter_13List.do") 
	public ModelAndView processingVolumeOfDistributionCenter_13( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Overall_status_4/processingVolumeOfDistributionCenter_13");
				
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

  
  //select
    @RequestMapping(value="/Overall_status_4/processingVolumeOfDistributionCenter_13Select_LGORT.do") 
    public ModelAndView processingVolumeOfDistributionCenter_13Select_LGORT (CommandMap commandMap) throws Exception{
    	
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
	
		List<Map<String,Object>> Select_LGORT = processingVolumeOfDistributionCenter_13Service.processingVolumeOfDistributionCenter_13Select_LGORT(map); //저장위 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
    
    @RequestMapping(value="/Overall_status_4/processingVolumeOfDistributionCenter_13Select.do") 
    public ModelAndView processingVolumeOfDistributionCenter_13Select (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
    			
    			//{"0.인자값",   					  		"1.초기값", 			"2.map 키명"} 			
    			  {(String) commandMap.get("MANDT"),      	"100", 				"MANDT"    },  // 클라이언트
    			  {(String) commandMap.get("SEARCHTYPE"),   "",					"SEARCHTYPE"}, // WEEK / DAY
				  {(String) commandMap.get("FDATE"),      	"",					"FDATE"	   },  // 시작일자
    			  {(String) commandMap.get("TDATE"),      	"",					"TDATE"	   },  // 종료일자
    			  {(String) commandMap.get("WERKS"),     	"",  				"WERKS"	   },  // 법인
    			  {(String) commandMap.get("LGORT"),        "",					"LGORT"	   },  // 저장위치
    			  {(String) commandMap.get("BSART"),      	"",					"BSART"	   },  // 입고요청구분
				  {(String) commandMap.get("SHGBN"),     	"",  				"SHGBN"	   },  // 배송방법
    			  {(String) commandMap.get("PODO"),         "",					"PODO"	   },  // PO / DO
				  {(String) commandMap.get("BELN"),         "",					"BELN"	   },  // 요청번호
    			  {(String) commandMap.get("USERID"),      	"",					"USERID"   }   // 사용자"
       	};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
    	
		
		try {
			
			List<List<Map<String, Object>>> list_wonbon = processingVolumeOfDistributionCenter_13Service.processingVolumeOfDistributionCenter_13Select(map); //db 리스트 출력
		
			List<Map<String,Object>> list = (List<Map<String, Object>>) list_wonbon.get(0);
			//rowspan 작업 시작 
	    	Map<String, Object> fianl_map = new HashMap<String, Object>(); 
	    	fianl_map.put ("WEEKDAY","final");
	    	fianl_map.put ("INDATE", "final_2");
	    	fianl_map.put ("WERKS", "final_3");
	  
	    	for(int i=0; i < 3 ; i++){
	    		list.add(fianl_map);
	    	}
	    	Map<String, Object> putMap = new HashMap<String, Object>(); 

	    	//System.out.println("WEEKDAY:"+(String) list.get(0).get("WEEKDAY"));
	    	//<-------1번쨰 rowspan ------->
	    	putMap.put("WEEKDAY", 	String.valueOf(list.get(0).get("WEEKDAY")) );
	    	putMap.put("WEEKDAY_2", 	String.valueOf(list.get(1).get("WEEKDAY")) );
	    	
	    	//<-------2번쨰 rowspan ------->
	    	putMap.put("INDATE", 	String.valueOf(list.get(0).get("INDATE")) );
	    	putMap.put("INDATE_2", 	String.valueOf(list.get(1).get("INDATE")) );
	    	
	    	//<-------3번쨰 rowspan ------->
	    	putMap.put("WERKS", 		String.valueOf(list.get(0).get("WERKS")) );
	    	putMap.put("WERKS_2", 	String.valueOf(list.get(1).get("WERKS")) );
	    	
	    	List<Map<String,Object>> list2 = new ArrayList<Map<String, Object>>();
	    	List<Map<String,Object>> list3 = new ArrayList<Map<String, Object>>();
	    	
			int[] cnt = {0};
			int[] num1 = {0,0,0,0,0};
	    	int[] num2 =  {0,0,0,0,0};
			
			//첫번쨰 진행--------------------------------------- 
			for(int i=0; i < list.size()-1 ; i++){
			
				//1. list2 넣는 구간  
				list2.add(list.get(i));
				//2. list2 맨 마지막 번쨰를 위한 
				if(list.size()-2 == i) {
					list2.add(fianl_map);	
					list2.add(fianl_map);		
				}
				//3. rowspan 개수
				num1[0] += 1;
			    if(num1[0] == 1){
					cnt[0] = i;
				}
				//4. list 겹치는 구간 
				putMap.put("WEEKDAY", 	String.valueOf(list.get(i).get("WEEKDAY")) );
				putMap.put("WEEKDAY_2",	String.valueOf(list.get(i+1).get("WEEKDAY")) );
				if(!putMap.get("WEEKDAY").equals(putMap.get("WEEKDAY_2"))){
					
					//5. list rowspan 넣는 구간
					list.get(num2[0]).put("rowspan", num1[0]);
			    	
					//6. list2 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
					if(!fianl_map.get("WEEKDAY").equals(putMap.get("WEEKDAY"))) { 
						list2.add(fianl_map);	
					}	
					
					//7. 초기화
					num2[0] += num1[0];
					num1[0] = 0;
			    	
					//두번쨰 진행--------------------------------------- 
					for(int a=0; a<list2.size()-1; a++){
					
						//1. list3 넣는 구간  
						list3.add(list2.get(a));
						//2. list3 맨 마지막 번쨰를 위한 
						if(list2.size()-2 == a) { 
							list3.add(fianl_map);	
							list3.add(fianl_map);	
						}	
						//3. rowspan 개수
						num1[1] += 1;

						//4. list2 겹치는 구간 
						putMap.put("INDATE", 	String.valueOf(list2.get(a).get("INDATE")) );
						putMap.put("INDATE_2",	String.valueOf(list2.get(a+1).get("INDATE")) );
						if(!putMap.get("INDATE").equals(putMap.get("INDATE_2"))){
							
							//5. list rowspan 넣는 구간
							list.get(num2[1]).put("rowspan2", num1[1]);
								
							//6. list3 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
							if(!fianl_map.get("INDATE").equals(putMap.get("INDATE"))) { 
								list3.add(fianl_map);	
							}	
							
							//7. 초기화
							num2[1] += num1[1];
							num1[1] = 0;
							
							//세번째 진행--------------------------------------- 
							for(int b=0; b<list3.size()-1; b++){
								
								//1. list4 넣는 구간  
								//list4.add(list3.get(b));
								//2. list4 맨 마지막 번쨰를 위한 
								//if(list3.size()-2 == b) { 
								//	list4.add(fianl_map);	
								//	list4.add(fianl_map);	
								//}	
								//3. rowspan 개수
								num1[2] += 1;
							
								//4. list3 겹치는 구간 
								putMap.put("WERKS", 	String.valueOf(list3.get(b).get("WERKS")) );
								putMap.put("WERKS_2",	String.valueOf(list3.get(b+1).get("WERKS")) );
								if(!putMap.get("WERKS").equals(putMap.get("WERKS_2"))){
									
									//5. list rowspan 넣는 구간
									list.get(num2[2]).put("rowspan3", num1[2]);
									
									//6. list4 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
								//	if(!fianl_map.get("WERKS").equals(putMap.get("WERKS"))) { 
								//		list4.add(fianl_map);	
								//	}
								
									//7. 초기화
									num2[2] += num1[2];
									num1[2] = 0;
									
								}
											
							}
							list3.clear();
							
						}
					}
					list2.clear();
					
					//초기화
					num1[0]= 0;
					num1[1]= 0;
					num1[2]= 0;
					num1[3]= 0;
				}
		  	}	
			
			mv.addObject("list", list);
			mv.addObject("chart", list_wonbon.get(1));
			//---------------rowspan 작업 끝---------------
			
			
		} 
		catch (Exception e ){
			e.printStackTrace();
		} 
		
		List<Map<String,Object>> Select_WERKS = processingVolumeOfDistributionCenter_13Service.processingVolumeOfDistributionCenter_13Select_WERKS(map); 	//법인 리스트 출력
		List<Map<String,Object>> Select_BSART = processingVolumeOfDistributionCenter_13Service.processingVolumeOfDistributionCenter_13Select_BSART(map); 	
		List<Map<String,Object>> Select_SHGBN = processingVolumeOfDistributionCenter_13Service.processingVolumeOfDistributionCenter_13Select_SHGBN(map); 
		List<Map<String,Object>> Select_PODO = processingVolumeOfDistributionCenter_13Service.processingVolumeOfDistributionCenter_13Select_PODO(map); 	    
		
		mv.addObject("Select_WERKS",Select_WERKS);		//법인
		mv.addObject("Select_BSART", Select_BSART);		//입고요청구분  
		mv.addObject("Select_SHGBN", Select_SHGBN);		//배송방법  
		mv.addObject("Select_PODO", Select_PODO);		//입출고구분  
		mv.addObject("map", map);
	
    	return mv;
    }
 
}
    
   

     
  
