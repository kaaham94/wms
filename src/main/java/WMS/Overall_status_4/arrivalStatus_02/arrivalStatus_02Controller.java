package WMS.Overall_status_4.arrivalStatus_02;

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
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.CommandMap;
import WMS.common.common.PagingDTO;
import WMS.common.common.TapDTO;

@Controller
public class arrivalStatus_02Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="arrivalStatus_02Service")
    private arrivalStatus_02Service arrivalStatus_02Service;
     
    //page load
    @RequestMapping("/Overall_status_4/arrivalStatus_02_list.do") 
	public ModelAndView arrivalStatus_02Select( HttpSession session, HttpServletRequest request) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Overall_status_4/arrivalStatus_02");
			
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

  //search
    
    /*
    @RequestMapping(value="/Overall_status_4/arrivalStatus_02Select_right_bottom.do") 
    public ModelAndView arrivalStatus_02Select_right_bottom (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	List<Map<String,Object>> list2 =  new ArrayList<Map<String, Object>>();
    	
		List<Map<String,Object>> list = arrivalStatus_02Service.arrivalStatus_02Select_right_bottom(map); //db 리스트 출력 

		
		//rowspan 작업 시작 
		Map<String, Object> fianl_map = new HashMap<String, Object>(); 
		fianl_map.put ("WERKS","final");
		fianl_map.put ("LGORT", "final_2");
	
		for(int i=0; i < 3 ; i++){
			list.add(fianl_map);
		}

		int[] num4 = { 0, 0, 0, 0, 0, 0};
		int[] CNT = { 0, 0, 0, 0, 0, 0};

		Map<String, Object> putMap = new HashMap<String, Object>(); 

		System.out.println("WERKS:"+(String) list.get(0).get("WERKS"));
		//<-------1번쨰 rowspan ------->
		putMap.put("WERKS", 	String.valueOf(list.get(0).get("WERKS")) );
		putMap.put("WERKS_2", 	String.valueOf(list.get(1).get("WERKS")) );
		
		//<-------2번쨰 rowspan ------->
		putMap.put("LGORT", 	String.valueOf(list.get(0).get("LGORT")) );
		putMap.put("LGORT_2", 	String.valueOf(list.get(1).get("LGORT")) );
		
		
		for(int i=0; i < list.size()-3 ; i++){
			
			num4[0] += 1;
			if(num4[0] == 1) { CNT[0] = i; }
				
			//다음에 받을 값과 비교하기 위함
			putMap.put("WERKS", 	String.valueOf(list.get(i).get("WERKS")) );
			putMap.put("WERKS_2",	String.valueOf(list.get(i+1).get("WERKS")) );
			putMap.put("WERKS_3",	String.valueOf(list.get(i+2).get("WERKS")) );
			 
			if(!putMap.get("WERKS").equals(putMap.get("WERKS_2"))){
				//<-------1번쨰 rowspan 구간------->
				list.get(CNT[0]).put("rowspan", num4[0] ); 
				
				
				//큰 rowspan이 1줄 일떄, 그 하위도 1줄 필요 
				if(num4[0] == 1) { 
					list.get(CNT[0]).put("rowspan", 1 ); 
					list.get(CNT[0]).put("rowspan2", 1 ); 
				}
					
				//초기화 
				num4[0]= 0;
				num4[1]= 0;
			}else {
				//<-------2번쨰 rowspan 구간------->  
				num4[1] += 1;
				if(num4[1] == 1) { CNT[1] = i; }
				//System.out.println("test:"+String.valueOf(num4[1]-1));
				//list2.get(num4[1]-1).put("LGORT",String.valueOf(list.get(i).get("LGORT")));
				
				putMap.put("LGORT", 	String.valueOf(list.get(i).get("LGORT")) );
				putMap.put("LGORT_2", 	String.valueOf(list.get(i+1).get("LGORT")) );
				putMap.put("LGORT_3", 	String.valueOf(list.get(i+2).get("LGORT")) );
				putMap.put("LGORT_4", 	String.valueOf(list.get(i+3).get("LGORT")) );
				
				//마지막 if 공간 
				if(!putMap.get("WERKS_2").equals(putMap.get("WERKS_3"))  || ("null".equals(putMap.get("WERKS")))  ){
					num4[1] += 1;
					list.get(CNT[1]).put("rowspan2", num4[1] ); 
				}	
			
				if(!putMap.get("LGORT").equals(putMap.get("LGORT_2")) ||  ("null".equals(putMap.get("LGORT"))) ){
					list.get(CNT[1]).put("rowspan2", num4[1] ); 
					
					//큰 rowspan이 1줄 일떄, 그 하위도 1줄 필요 
					if(num4[1] == 1) { 
						list.get(CNT[1]).put("rowspan2", 1 ); 
					}
					
					//초기화 
					num4[1]= 0;
					num4[2]= 0;
				}
			}
			list.get(i).put("WERKS", String.valueOf(putMap.get("WERKS")).replace("null", "") );
			list.get(i).put("WERKSNM", String.valueOf(list.get(i).get("WERKSNM")).replace("null", "") );
			list.get(i).put("LGORT", String.valueOf(putMap.get("LGORT")).replace("null", " ") );
			list.get(i).put("LGORTNM", String.valueOf(list.get(i).get("LGORTNM")).replace("null", "") );
			list.get(i).put("SUDAT", String.valueOf(list.get(i).get("SUDAT")).replace("null", "") );
			list.get(i).put("BSART", String.valueOf(list.get(i).get("BSART")).replace("null", "") );
			list.get(i).put("MAKTX", String.valueOf(list.get(i).get("MAKTX")).replace("null", "") );
		}
		//System.out.println("list2:"+list2);
		mv.addObject("list", list);
	
    	return mv;
    }
*/
  //select
    @RequestMapping(value="/Overall_status_4/arrivalStatus_02Select_LGORT.do") 
    public ModelAndView arrivalStatus_02Select_LGORT (CommandMap commandMap) throws Exception{
    	
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
	
		List<Map<String,Object>> Select_LGORT = arrivalStatus_02Service.arrivalStatus_02Select_LGORT(map); //저장위 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
    
    @RequestMapping(value="/Overall_status_4/arrivalStatus_02Select.do") 
    public ModelAndView arrivalStatus_02Select (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
				
    			//{"0.인자값",   						"1.초기값", 			"2.map 키명", 			
    			{(String) commandMap.get("MANDT"),    "100", 			"MANDT" },	 //클라이언트
    			{(String) commandMap.get("SDATE"),    "",				"SDATE" },	 //시작일자
    			{(String) commandMap.get("EDATE"),    "",				"EDATE" },	 //완료일자
    			{(String) commandMap.get("WERKS"),    "",  				"WERKS"	},	 //법인
    			{(String) commandMap.get("LGORT"),    "",				"LGORT"	},	 //저장위치
    			{(String) commandMap.get("MAKTX"),    "",				"MAKTX"	},	 //품목코드(=품번)
    			{(String) commandMap.get("EBELN"),    "",				"EBELN"	},	 //요청번호
    			{(String) commandMap.get("BSART"),    "",				"BSART"	},	 //입고유형
    			{(String) commandMap.get("LIFNR"),    "",				"LIFNR"	},	 //공급처
    			{(String) commandMap.get("KUNNR"),    "",				"KUNNR"	},	 //제조사
    			{(String) commandMap.get("USERID"),   "",				"USERID"},	 //사용자
    			{(String) commandMap.get("pageNo"),   "1", 				"pageNo"}, 		//6.(페이지)현재 페이지
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
			
			List<Map<String,Object>> list = arrivalStatus_02Service.arrivalStatus_02Select(map); //db 리스트 출력
			
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
	    	fianl_map.put ("WERKS","final");
	    	fianl_map.put ("LGORT", "final_2");
	    	fianl_map.put ("SUDAT", "final_3");
	    	/*
	    	fianl_map.put ("BSART", "final_4");
	    	fianl_map.put ("CUSTMN","final_5");
	    	fianl_map.put ("MAKTX", "final_6");
	    	*/
	    	
	    	for(int i=0; i < 3 ; i++){
	    		list.add(fianl_map);
	    	}
	    	Map<String, Object> putMap = new HashMap<String, Object>(); 

	    	//System.out.println("WERKS:"+(String) list.get(0).get("WERKS"));
	    	//<-------1번쨰 rowspan ------->
	    	putMap.put("WERKS", 	String.valueOf(list.get(0).get("WERKS")) );
	    	putMap.put("WERKS_2", 	String.valueOf(list.get(1).get("WERKS")) );
	    	
	    	//<-------2번쨰 rowspan ------->
	    	putMap.put("LGORT", 	String.valueOf(list.get(0).get("LGORT")) );
	    	putMap.put("LGORT_2", 	String.valueOf(list.get(1).get("LGORT")) );
	    	
	    	//<-------3번쨰 rowspan ------->
	    	putMap.put("SUDAT", 	String.valueOf(list.get(0).get("SUDAT")) );
	    	putMap.put("SUDAT_2", 	String.valueOf(list.get(1).get("SUDAT")) );
	    	
	    	/*
	    	//<-------4번쨰 rowspan ------->
	    	putMap.put("BSART", 	String.valueOf(list.get(0).get("BSART")) );
	    	putMap.put("BSART_2", 	String.valueOf(list.get(1).get("BSART")) );
	    	
	    	//<-------5번쨰 rowspan ------->
	    	putMap.put("CUSTMN", 	String.valueOf(list.get(0).get("CUSTMN")) );
	    	putMap.put("CUSTMN_2", 	String.valueOf(list.get(1).get("CUSTMN")) );
	    	
	    	//<-------6번쨰 rowspan ------->
	    	putMap.put("MAKTX", 	String.valueOf(list.get(0).get("MAKTX")) );
	    	putMap.put("MAKTX_2", 	String.valueOf(list.get(1).get("MAKTX")) );
	    	*/
	    	
	    	List<Map<String,Object>> list2 = new ArrayList<Map<String, Object>>();
	    	List<Map<String,Object>> list3 = new ArrayList<Map<String, Object>>();
	    	List<Map<String,Object>> list4 = new ArrayList<Map<String, Object>>();
	    	List<Map<String,Object>> list5 = new ArrayList<Map<String, Object>>();
	    	List<Map<String,Object>> list6 = new ArrayList<Map<String, Object>>();
	    	int[] num1 = {0,0,0,0,0};
	    	int[] cnt = {0};
	    	
	    	
			for(int i=0; i < list.size()-1 ; i++){
				
				//첫번쨰 진행--------------------------------------- 
				list2.add(list.get(i));
				if(list.size()-2 == i) {
					list2.add(fianl_map);	
				}	
				num1[0]+=1;
				 if(num1[0] == 1){
					cnt[0] = i;
				}
				putMap.put("WERKS", 	String.valueOf(list.get(i).get("WERKS")) );
				putMap.put("WERKS_2",	String.valueOf(list.get(i+1).get("WERKS")) );
				
				
				if(!putMap.get("WERKS").equals(putMap.get("WERKS_2"))){
					
					list.get(cnt[0]).put("rowspan", num1[0]);
			    	list2.add(fianl_map);
			    	
					for(int a=0; a<list2.size()-1; a++){
						//두번쨰 진행--------------------------------------- 
						list3.add(list2.get(a));
						if(list2.size()-2 == a) {
							list3.add(fianl_map);	
						}	
						num1[1] += 1;

						putMap.put("LGORT", 	String.valueOf(list2.get(a).get("LGORT")) );
						putMap.put("LGORT_2",	String.valueOf(list2.get(a+1).get("LGORT")) );
								
						if(!putMap.get("LGORT").equals(putMap.get("LGORT_2"))){
							list.get((cnt[0]+a+1)-num1[1]).put("rowspan2", num1[1]);
							num1[1] = 0;
							
							for(int b=0; b<list3.size()-1; b++){
								//세번째 진행--------------------------------------- 
								list4.add(list3.get(b));
								if(list3.size()-2 == b) {
									list4.add(fianl_map);	
								}	
								num1[2] += 1;
							
								putMap.put("SUDAT", 	String.valueOf(list3.get(b).get("SUDAT")) );
								putMap.put("SUDAT_2",	String.valueOf(list3.get(b+1).get("SUDAT")) );
								if(!putMap.get("SUDAT").equals(putMap.get("SUDAT_2"))){
									list.get((cnt[0]+b+1)-num1[2]).put("rowspan3", num1[2]);
									num1[2] = 0;
									
									//네번째 진행(없음)--------------------------------------- 
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
    	
		
		List<Map<String,Object>> Select_WERKS = arrivalStatus_02Service.arrivalStatus_02Select_WERKS(map); //법인 리스트 출력
		List<Map<String,Object>> Select_LIFNR = arrivalStatus_02Service.arrivalStatus_02Select_LIFNR(map); //공급처 리스트 출력
		List<Map<String,Object>> Select_BSART = arrivalStatus_02Service.arrivalStatus_02Select_BSART(map); //입고유형 리스트 출력
		List<Map<String,Object>> Select_KUNNR = arrivalStatus_02Service.arrivalStatus_02Select_KUNNR(map); //제조사 리스트 출력
		
    	mv.addObject("Select_WERKS",Select_WERKS);	//법인
		mv.addObject("Select_LIFNR",Select_LIFNR);	//공급처  
		mv.addObject("Select_BSART",Select_BSART);	//입고유형
		mv.addObject("Select_KUNNR",Select_KUNNR);	//제조사 
		mv.addObject("map", map);
    
    	return mv;
    }
}
    
   

     
  
