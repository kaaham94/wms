package WMS.Overall_status_4.dailyStockStatus_08;

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
public class dailyStockStatus_08Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="dailyStockStatus_08Service")
    private dailyStockStatus_08Service dailyStockStatus_08Service;
     
    //page load
    @RequestMapping("/Overall_status_4/dailyStockStatus_08List.do") 
	public ModelAndView dailyStockStatus_08Select( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Overall_status_4/dailyStockStatus_08");
				
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
    @RequestMapping(value="/Overall_status_4/dailyStockStatus_08Select_LGORT.do") 
    public ModelAndView dailyStockStatus_08Select_LGORT (CommandMap commandMap) throws Exception{
    	
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
	
		List<Map<String,Object>> Select_LGORT = dailyStockStatus_08Service.dailyStockStatus_08Select_LGORT(map); //저장위 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
    
    @RequestMapping(value="/Overall_status_4/dailyStockStatus_08Select.do") 
    public ModelAndView dailyStockStatus_08Select (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
				
    			//{"0.인자값",   					"1.초기값", 			"2.map 키명", 			
    			{(String) commandMap.get("MANDT"),    "100", 			"MANDT" },	 //클라이언트
    			{(String) commandMap.get("SDATE"),    "",				"SDATE" },	 //시작일자
    			{(String) commandMap.get("EDATE"),    "",				"EDATE" },	 //완료일자
    			{(String) commandMap.get("WERKS"),    "",  				"WERKS"	},	 //법인
    			{(String) commandMap.get("LGORT"),    "",				"LGORT"	},	 //저장위치
    			{(String) commandMap.get("MAKTX"),    "",				"MAKTX"	},	 //품번
    			{(String) commandMap.get("STATUS"),   "",				"STATUS"},	 //상태
    			{(String) commandMap.get("LOC"),   	  "",				"LOC"	},	 //로케이션
    			{(String) commandMap.get("FDATE"),    "",				"FDATE"	},	 //재고일자
    			{(String) commandMap.get("TDATE"),    "",				"TDATE"	},	 //재고일자
    			{(String) commandMap.get("USERID"),   "",				"USERID"},	 //
    			{(String) commandMap.get("pageNo"),   "1", 				"pageNo"}, 	 //6.(페이지)현재 페이지
    			{(String) commandMap.get("pageSize"), 	(String)session.getAttribute("pageSize"), 	"pageSize"} //7.(페이지)노출될 페이지 로우 

    	};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
    	
		
		try {
			//---------------페이징 부분 시작---------------
			session.setAttribute("pageSize", map.get("pageSize"));
			pagingDTO.setPageSize(Integer.parseInt((String) map.get("pageSize")));// 한 페이지에 보일 게시글 수
			pagingDTO.setPageNo(Integer.parseInt((String) map.get("pageNo"))); 	// 현재 페이지 번호
			pagingDTO.setBlockSize(10); 
			
			//페이지 시작 리스트번호, 끝 리스트번호 생성
			map.put("START",pagingDTO.getStartRowNum()); 	//시작 리스트 번호 
			map.put("END",pagingDTO.getEndRowNum()); 		//끝 리스트 번호 
			
			List<Map<String,Object>> list = dailyStockStatus_08Service.dailyStockStatus_08Select(map); //db 리스트 출력
			
			// list가 빈값이 아닐떄, 총 리스트개수 삽입 -> 페이징 생성 
			if(!list.isEmpty()) {
				int count =  Integer.parseInt(list.get(0).get("TOTAL_COUNT").toString()); 
				pagingDTO.setTotalCount(count);
			}
			 
			map.put("pageSize",pagingDTO.getPageSize()); // row수  
		
			//map 리턴 
			mv.addObject("map", map); 
			//System.out.println("map:"+map);
			mv.addObject("list", list);
			
			//model 리턴
			mv.addObject("paging", pagingDTO);//페이징 리턴 
			//System.out.println("pagingDTO:"+pagingDTO);
			
			//---------------페이징 부분 끝---------------
			
			//---------------rowspan 작업 시작---------------
			//rowspan 작업 시작 
	    	Map<String, Object> fianl_map = new HashMap<String, Object>(); 
	    	fianl_map.put ("IDATE","final");
	    	fianl_map.put ("WERKS", "final_2");
	    	fianl_map.put ("LGORT", "final_3");
	  
	    	for(int i=0; i < 3 ; i++){
	    		list.add(fianl_map);
	    	}
	    	Map<String, Object> putMap = new HashMap<String, Object>(); 

	    	//System.out.println("IDATE:"+(String) list.get(0).get("IDATE"));
	    	//<-------1번쨰 rowspan ------->
	    	putMap.put("IDATE", 	String.valueOf(list.get(0).get("IDATE")) );
	    	putMap.put("IDATE_2", 	String.valueOf(list.get(1).get("IDATE")) );
	    	
	    	//<-------2번쨰 rowspan ------->
	    	putMap.put("WERKS", 	String.valueOf(list.get(0).get("WERKS")) );
	    	putMap.put("WERKS_2", 	String.valueOf(list.get(1).get("WERKS")) );
	    	
	    	//<-------3번쨰 rowspan ------->
	    	putMap.put("LGORT", 		String.valueOf(list.get(0).get("LGORT")) );
	    	putMap.put("LGORT_2", 	String.valueOf(list.get(1).get("LGORT")) );
	    	
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
				putMap.put("IDATE", 	String.valueOf(list.get(i).get("IDATE")) );
				putMap.put("IDATE_2",	String.valueOf(list.get(i+1).get("IDATE")) );
				if(!putMap.get("IDATE").equals(putMap.get("IDATE_2"))){
					
					//5. list rowspan 넣는 구간
					list.get(num2[0]).put("rowspan", num1[0]);
			    	
					//6. list2 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
					if(!fianl_map.get("IDATE").equals(putMap.get("IDATE"))) { 
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
						putMap.put("WERKS", 	String.valueOf(list2.get(a).get("WERKS")) );
						putMap.put("WERKS_2",	String.valueOf(list2.get(a+1).get("WERKS")) );
						if(!putMap.get("WERKS").equals(putMap.get("WERKS_2"))){
							
							//5. list rowspan 넣는 구간
							list.get(num2[1]).put("rowspan2", num1[1]);
								
							//6. list3 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
							if(!fianl_map.get("WERKS").equals(putMap.get("WERKS"))) { 
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
								putMap.put("LGORT", 	String.valueOf(list3.get(b).get("LGORT")) );
								putMap.put("LGORT_2",	String.valueOf(list3.get(b+1).get("LGORT")) );
								if(!putMap.get("LGORT").equals(putMap.get("LGORT_2"))){
									
									//5. list rowspan 넣는 구간
									list.get(num2[2]).put("rowspan3", num1[2]);
									
									//6. list4 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
								//	if(!fianl_map.get("LGORT").equals(putMap.get("LGORT"))) { 
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
			//---------------rowspan 작업 끝---------------
			
		} 
		catch (Exception e ){
			e.printStackTrace();
		} 


		List<List<Object>>  map2 =  new ArrayList<List<Object>>();
		
		List<Map<String,Object>> Select_WERKS = dailyStockStatus_08Service.dailyStockStatus_08Select_WERKS(map); 	//법인 리스트 출력
		List<Map<String,Object>> Select_STATUS = dailyStockStatus_08Service.dailyStockStatus_08Select_STATUS(map); 	//상태 리스트 출력
	//	List<Map<String,Object>> Select_LOC = dailyStockStatus_08Service.dailyStockStatus_08Select_LOC(map);  //로케이션 리스트 출력
		List<List<Object>> Select_LOC = dailyStockStatus_08Service.dailyStockStatus_08Select_LOC(map2);  //로케이션 리스트 출력

    	mv.addObject("Select_WERKS",Select_WERKS);	//법인
		mv.addObject("Select_STATUS", Select_STATUS);	//상태  
		mv.addObject("Select_LOC",Select_LOC.get(1));	//로케이션 
		mv.addObject("map", map);
    
    	return mv;
    }
    
    



}
    
   

     
  
