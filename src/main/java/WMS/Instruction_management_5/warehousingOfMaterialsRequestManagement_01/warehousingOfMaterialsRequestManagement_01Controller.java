package WMS.Instruction_management_5.warehousingOfMaterialsRequestManagement_01;

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
public class warehousingOfMaterialsRequestManagement_01Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="warehousingOfMaterialsRequestManagement_01Service")
    private warehousingOfMaterialsRequestManagement_01Service warehousingOfMaterialsRequestManagement_01Service;
     
    //page load
    @RequestMapping("/Instruction_management_5/warehousingOfMaterialsRequestManagement_01List.do") 
	public ModelAndView warehousingOfMaterialsRequestManagement_01Select( HttpSession session, HttpServletRequest request  ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Instruction_management_5/warehousingOfMaterialsRequestManagement_01");
			
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
    @RequestMapping(value="/Instruction_management_5/warehousingOfMaterialsRequestManagement_01Select_bottom.do") 
    public ModelAndView warehousingOfMaterialsRequestManagement_01Select_bottom (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	String valueArr[][] = {
    			
  			  //{"0.인자값",   						 "1.초기값", 	"2.map 키명"} 			
  				{(String) commandMap.get("MANDT"),    "100", 		"MANDT"		},	 //클라이언트
  				{(String) commandMap.get("WERKS"),    	"",			"WERKS"		},	 //법인
  				{(String) commandMap.get("LGORT"),      "",			"LGORT"		},	 //저장위치
  				{(String) commandMap.get("LIFNR"),      "",  		"LIFNR"		},	 //제조사
  				{(String) commandMap.get("MAKTX"),  	"",			"MAKTX"		},	 //품번
  				{(String) commandMap.get("CUSTCD"),     "",			"CUSTCD"	},	 //거래처
  				{(String) commandMap.get("EBELN"),    	"",			"EBELN"		},	 //입고요청번호
  				{(String) commandMap.get("MKUSER"),    	"",			"MKUSER"	},	 //작성자
  				{(String) commandMap.get("SBEDAT"),    	"",			"SBEDAT"	},	 //입고요청일
  				{(String) commandMap.get("EBEDAT"),    	"",			"EBEDAT"	},	 //입고요청일
  				{(String) commandMap.get("SEINDT"),  	"",			"SEINDT"	},	 //입고예정일
  				{(String) commandMap.get("EEINDT"),	 	"",			"EEINDT"	},	 //입고예정일
  				{(String) commandMap.get("DATEFLAG"),   "",			"DATEFLAG"	},	 //입고요청일(B) / 입고예정일(E)
  				{(String) commandMap.get("VIEWALL"),   	"N",		"VIEWALL"	},   //미마감전체조회(Y/N)
  				{(String) commandMap.get("USERID"),   	"",			"USERID"	}	 //사용자

    	};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
		
		List<Map<String,Object>> list = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_bottom(map); //db 리스트 출력 
	
		//---------------rowspan 작업 시작---------------
			//rowspan 작업 시작 
	    	Map<String, Object> fianl_map = new HashMap<String, Object>(); 
	    	fianl_map.put ("EBELN","final");
	    	fianl_map.put ("BSART", "final_2");
	    	fianl_map.put ("EINDT", "final_3");
	  
	    	for(int i=0; i < 3 ; i++){
	    		list.add(fianl_map);
	    	}
	    	Map<String, Object> putMap = new HashMap<String, Object>(); 

	    	//System.out.println("EBELN:"+(String) list.get(0).get("EBELN"));
	    	//<-------1번쨰 rowspan ------->
	    	putMap.put("EBELN", 	String.valueOf(list.get(0).get("EBELN")) );
	    	putMap.put("EBELN_2", 	String.valueOf(list.get(1).get("EBELN")) );
	    	
	    	//<-------2번쨰 rowspan ------->
	    	putMap.put("BSART", 	String.valueOf(list.get(0).get("BSART")) );
	    	putMap.put("BSART_2", 	String.valueOf(list.get(1).get("BSART")) );
	    	
	    	//<-------3번쨰 rowspan ------->
	    	putMap.put("EINDT", 		String.valueOf(list.get(0).get("EINDT")) );
	    	putMap.put("EINDT_2", 	String.valueOf(list.get(1).get("EINDT")) );
	    	
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
				putMap.put("EBELN", 	String.valueOf(list.get(i).get("EBELN")) );
				putMap.put("EBELN_2",	String.valueOf(list.get(i+1).get("EBELN")) );
				if(!putMap.get("EBELN").equals(putMap.get("EBELN_2"))){
					
					//5. list rowspan 넣는 구간
					list.get(num2[0]).put("rowspan", num1[0]);
			    	
					//6. list2 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
					if(!fianl_map.get("EBELN").equals(putMap.get("EBELN"))) { 
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
						putMap.put("BSART", 	String.valueOf(list2.get(a).get("BSART")) );
						putMap.put("BSART_2",	String.valueOf(list2.get(a+1).get("BSART")) );
						if(!putMap.get("BSART").equals(putMap.get("BSART_2"))){
							
							//5. list rowspan 넣는 구간
							list.get(num2[1]).put("rowspan2", num1[1]);
								
							//6. list3 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
							if(!fianl_map.get("BSART").equals(putMap.get("BSART"))) { 
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
								putMap.put("EINDT", 	String.valueOf(list3.get(b).get("EINDT")) );
								putMap.put("EINDT_2",	String.valueOf(list3.get(b+1).get("EINDT")) );
								if(!putMap.get("EINDT").equals(putMap.get("EINDT_2"))){
									
									//5. list rowspan 넣는 구간
									list.get(num2[2]).put("rowspan3", num1[2]);
									
									//6. list4 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
								//	if(!fianl_map.get("EINDT").equals(putMap.get("EINDT"))) { 
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
		

			List<Map<String,Object>> Select_WERKS = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_WERKS(map);   //법인 리스트 출력
			List<Map<String,Object>> Select_CUSTCD = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_CUSTCD(map); //저장위 리스트 출력
			List<Map<String,Object>> Select_LIFNR = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_LIFNR(map); 	 //저장위 리스트 출력
			
			List<Map<String,Object>> Select_LFART = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_LFART(map); 	 
			List<Map<String,Object>> Select_OUTCUST = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_OUTCUST(map); 	 
			
			mv.addObject("Select_WERKS", Select_WERKS);		//법인
			mv.addObject("Select_CUSTCD", Select_CUSTCD);	//공급처(=거래처)
			mv.addObject("Select_LIFNR", Select_LIFNR);		//제조사
			
			mv.addObject("Select_LFART", Select_LFART);		//출고유형
			mv.addObject("Select_OUTCUST", Select_OUTCUST);	//출하예정처
			
    	return mv;
    }
    
    
  
    //search
    @RequestMapping(value="/Instruction_management_5/warehousingOfMaterialsRequestManagement_01Select_right.do") 
    public ModelAndView warehousingOfMaterialsRequestManagement_01Select_right (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
				
    			  //{"0.인자값",   						 "1.초기값", 		"2.map 키명", 			
    				{(String) commandMap.get("MANDT"),    "100", 		"MANDT"  },	 //클라이언트
    				{(String) commandMap.get("WERKS"),    "",			"WERKS"  },	 //법인
    				{(String) commandMap.get("LGORT"),    "",			"LGORT"  },	 //저장위치
    				{(String) commandMap.get("ARBPL"),    "",  			"ARBPL"  },	 //작업장
    				{(String) commandMap.get("SUDAT_S"),  "",			"SUDAT_S"},	 //수불일자_S
    				{(String) commandMap.get("SUDAT_E"),  "",			"SUDAT_E"},	 //수불일자_E
    				{(String) commandMap.get("CRDTC_S"),  "",			"CRDTC_S"},	 //실적일자_S
    				{(String) commandMap.get("CRDTC_E"),  "",			"CRDTC_E"},	 //실적일자_E
    				{(String) commandMap.get("MATNR"),    "",			"MATNR"  },	 //품목
    				{(String) commandMap.get("LIFNR"),    "",			"LIFNR"  },	 //공급처
    				{(String) commandMap.get("SEQ"),  	  "",		 	"SEQ" 	 },	 //주야간
    				{(String) commandMap.get("HH"),		  "",		 	"HH"	 },	 //시간
    				{(String) commandMap.get("BWART_1"),  "N",		 	"BWART_1"},	 //현창입고
    				{(String) commandMap.get("BWART_2"),  "Y",		 	"BWART_2"},  //구매입고
    				{(String) commandMap.get("BWART_3"),  "N",		 	"BWART_3"},	 //이전입고
    				{(String) commandMap.get("BWART_4"),  "N",		 	"BWART_4"},	 //기타입고
    				{(String) commandMap.get("USERID"),	  "20160000",	"USERID" }	 //사용자
    	};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
		
		List<Map<String,Object>> list = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_right(map); //db 리스트 출력 
	
		//rowspan 작업 시작 
		Map<String, Object> fianl_map = new HashMap<String, Object>(); 
		fianl_map.put ("CUST","final");
		fianl_map.put ("MAKTX", "final_2");
		for(int i=0; i < 3 ; i++){
			list.add(fianl_map);
		}
	
		Map<Integer, Integer> rowspan_1 = new HashMap<Integer, Integer>();
		Map<Integer, Integer> rowspan_2 = new HashMap<Integer, Integer>(); 

		int[] num4 = { 0, 0 };
		int[] CNT = { 0, 0 };

		Map<String, Object> putMap = new HashMap<String, Object>(); 
		
		putMap.put("CUST", 		(String) list.get(0).get("CUST"));
		putMap.put("CUST_2", 	(String) list.get(1).get("CUST"));
		putMap.put("MAKTX", 	(String) list.get(0).get("MAKTX"));
		putMap.put("MAKTX_2", 	(String) list.get(1).get("MAKTX"));
		
		System.out.println("list:"+list.size());
		
		for(int i=0; i < list.size()-3 ; i++){
			
			num4[0] += 1;
			if(num4[0] == 1) { CNT[0] = i; }
				
			//다음에 받을 값과 비교하기 위함
			putMap.put("CUST", 	(String) list.get(i).get("CUST"));
			putMap.put("CUST_2",(String) list.get(i+1).get("CUST"));
			putMap.put("CUST_3",(String) list.get(i+2).get("CUST"));
			
			if(!putMap.get("CUST").equals(putMap.get("CUST_2"))){
			
				list.get(CNT[0]).put("rowspan", num4[0] ); 
				
				
				//큰 rowspan이 1줄 일떄, 그 하위도 1줄 필요 
				if(num4[0] == 1) { 
					list.get(i).put("rowspan2", 1 ); 
				}
					
				//초기화 
				num4[0]= 0;
				num4[1]= 0;
			}else {
				num4[1] += 1;
				if(num4[1] == 1) { CNT[1] = i; }
				
				putMap.put("MAKTX", 	(String) list.get(i).get("MAKTX"));
				putMap.put("MAKTX_2", (String) list.get(i+1).get("MAKTX"));
			
				//마지막 if 공간 
				if(!putMap.get("CUST_2").equals(putMap.get("CUST_3"))){
					num4[1] += 1;
					list.get(CNT[1]).put("rowspan2", num4[1] ); 
				}	
			
				if(!putMap.get("MAKTX").equals(putMap.get("MAKTX_2"))){
					list.get(CNT[1]).put("rowspan2", num4[1] ); 
					num4[1]= 0;
				}
			}
		}

		mv.addObject("list", list);
		
		List<Map<String,Object>> Select_WERKS = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_WERKS(map);   //법인 리스트 출력
		List<Map<String,Object>> Select_CUSTCD = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_CUSTCD(map); //저장위 리스트 출력
		List<Map<String,Object>> Select_LIFNR = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_LIFNR(map); 	 //저장위 리스트 출력
	
		mv.addObject("Select_WERKS", Select_WERKS);		//법인
		mv.addObject("Select_CUSTCD", Select_CUSTCD);	//공급처(=거래처)
		mv.addObject("Select_LIFNR", Select_LIFNR);		//제조사
		
    	return mv;
    }
    
    //select
    @RequestMapping(value="/Instruction_management_5/warehousingOfMaterialsRequestManagement_01Select_LGORT.do") 
    public ModelAndView warehousingOfMaterialsRequestManagement_01Select_LGORT (CommandMap commandMap) throws Exception{
    	
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
	
		List<Map<String,Object>> Select_LGORT = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_LGORT(map); //저장위 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
    
    //search
    @RequestMapping(value="/Instruction_management_5/warehousingOfMaterialsRequestManagement_01Select_left.do") 
    public ModelAndView warehousingOfMaterialsRequestManagement_01Select_left(CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
				
    			//{"0.인자값",   					"1.초기값", 	"2.map 키명", 			
    			{(String) commandMap.get("MANDT"),    "100", 			"MANDT" },	 //클라이언트
    			{(String) commandMap.get("SDATE"),    "",				"SDATE" },	 //시작일자
    			{(String) commandMap.get("EDATE"),    "",				"EDATE" },	 //완료일자
    			{(String) commandMap.get("WERKS"),    "",  				"WERKS"	},	 //법인
    			{(String) commandMap.get("LGORT"),    "",				"LGORT"	},	 //저장위치
    			//{(String) commandMap.get("ARBPL"),  "",				"ARBPL"	},	 //작업장
    			{(String) commandMap.get("MAKTX"),    "",				"MAKTX"	},	 //품목코드
    			{(String) commandMap.get("LIFNR"),    "",				"LIFNR"	},	 //공급처
    			{(String) commandMap.get("USERID"),   "",				"USERID"}	 //사용자

    	};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
		List<Map<String,Object>> Select_WERKS = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_WERKS(map); //법인 리스트 출력
		List<Map<String,Object>> Select_CUSTCD = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_CUSTCD(map); //저장위 리스트 출력
		
		List<Map<String,Object>> list = warehousingOfMaterialsRequestManagement_01Service.warehousingOfMaterialsRequestManagement_01Select_left(map); //db 리스트 출력 
		
		String SEQINX_str = "";
		String BCQTY_str = "";
		int BCQTY_str2 = 0;
		int num = 0;
		
		//그래프값 백분율 전체 & SEQINDX 맨앞 한자리씩 출력 
		for(int i=0; i < list.size(); i++){
		
			//--SEQINX--
			//String형 변환
			SEQINX_str = String.valueOf(list.get(i).get("SEQINX"));
			
			//맨 앞자리 문자열 추출
			SEQINX_str = SEQINX_str.substring(0, 1);
			list.get(i).put("SEQINX", SEQINX_str);
			
			//--BCQTY--
			//String형 변환
			BCQTY_str = String.valueOf(list.get(i).get("BCQTY"));
		
		    //소수점 제거
		    BCQTY_str = BCQTY_str.substring(0, BCQTY_str.indexOf("."));
		    
		    //int형 변환
		    BCQTY_str2 =  Integer.parseInt(BCQTY_str);
			
		    //string 길이 비교 
		    if(num < BCQTY_str2){
		    	num = BCQTY_str2;
		    }
		}
		mv.addObject("totalPercent", num);
		mv.addObject("list", list);
		mv.addObject("Select_WERKS",Select_WERKS);
		mv.addObject("Select_CUSTCD",Select_CUSTCD);
		mv.addObject("map", map);
		return mv;
    }
    
}
    
   

     
  
