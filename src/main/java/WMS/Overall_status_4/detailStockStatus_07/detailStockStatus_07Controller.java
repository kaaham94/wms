package WMS.Overall_status_4.detailStockStatus_07;

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
public class detailStockStatus_07Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="detailStockStatus_07Service")
    private detailStockStatus_07Service detailStockStatus_07Service;
     
    //page load
    @RequestMapping("/Overall_status_4/detailStockStatus_07List.do") 
	public ModelAndView detailStockStatus_07( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Overall_status_4/detailStockStatus_07");
				
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

    //insertupdate 
    @RequestMapping(value="/Overall_status_4/detailStockStatus_07InsertUpdate_REPRINT.do")
    public ModelAndView detailStockStatus_07InsertUpdate_REPRINT(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체db 지정할 이름을 배열에 넣어준다. 
            String[] temp = {	
            		 "MANDT"	 
            		,"PRTDEMON"	
            		,"BARNO"
            		,"USERID" 
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
            Map<String, Object> returnMap = detailStockStatus_07Service.detailStockStatus_07InsertUpdate_REPRINT(list); 
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
    @RequestMapping(value="/Overall_status_4/detailStockStatus_07Select_LGORT.do") 
    public ModelAndView detailStockStatus_07Select_LGORT (CommandMap commandMap) throws Exception{
    	
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
	
		List<Map<String,Object>> Select_LGORT = detailStockStatus_07Service.detailStockStatus_07Select_LGORT(map); //저장위 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
   
    @RequestMapping(value="/Overall_status_4/detailStockStatus_07Select_REPRINT.do") 
    public ModelAndView detailStockStatus_07Select_REPRINT (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
        		
		  //{"0.인자값",   							"1.초기값", 	"2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("PRTDEMON"), 	"",		 	"PRTDEMON"},	//1.(select)프린트  
			{(String) commandMap.get("BARNO"), 		"", 		"BARNO"},		//2.(select)바코드  
			{(String) commandMap.get("USERID"), 	"", 		"USERID"}		//3.(select)사용자  
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> Select_REPRINT = detailStockStatus_07Service.detailStockStatus_07Select_REPRINT(map); //저장위 리스트 출력 

		mv.addObject("Select_REPRINT", Select_REPRINT);
		
    	return mv;
    }
    
    
    @RequestMapping(value="/Overall_status_4/detailStockStatus_07Select.do") 
    public ModelAndView detailStockStatus_07Select (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
				
    			//{"0.인자값",   						"1.초기값", 			"2.map 키명", 			
    			  {(String) commandMap.get("MANDT"),    	"100", 			"MANDT" },	 //1.클라이언트(hidden)
    			  {(String) commandMap.get("WERKS"),    	"",  			"WERKS"	},	 //2.법인(select)
    			  {(String) commandMap.get("LGORT"),    	"",				"LGORT"	},	 //3.저장위치(select)
    			  {(String) commandMap.get("STATUS"),    	"",				"STATUS"},	 //4.상태(select)
    			  {(String) commandMap.get("LOC"),   	 	"",				"LOC"	},	 //5.로케이션(select)
    			  {(String) commandMap.get("MAKTX"),    	"",				"MAKTX"	},	 //6.품번(text)
    			  {(String) commandMap.get("BARNO"),    	"",				"BARNO"	},	 //7.바코드(text)
    			  {(String) commandMap.get("MATNR"),    	"",				"MATNR"	},	 //8.자재코드 (?)
    			  {(String) commandMap.get("USERID"),    	"",				"USERID"},	 // 사용자
    			  {(String) commandMap.get("pageNo"),   	"1", 			"pageNo"}, 	 //(페이지)현재 페이지
    			  {(String) commandMap.get("pageSize"), 	(String)session.getAttribute("pageSize"), 	"pageSize"} //(페이지)노출될 페이지 로우 
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
			
			List<Map<String,Object>> list = detailStockStatus_07Service.detailStockStatus_07Select(map); //db 리스트 출력
			
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
	    	fianl_map.put ("STATUS", "final_3");
	  
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
	    	putMap.put("STATUS", 		String.valueOf(list.get(0).get("STATUS")) );
	    	putMap.put("STATUS_2", 	String.valueOf(list.get(1).get("STATUS")) );
	    	
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
				putMap.put("WERKS", 	String.valueOf(list.get(i).get("WERKS")) );
				putMap.put("WERKS_2",	String.valueOf(list.get(i+1).get("WERKS")) );
				if(!putMap.get("WERKS").equals(putMap.get("WERKS_2"))){
					
					//5. list rowspan 넣는 구간
					list.get(num2[0]).put("rowspan", num1[0]);
			    	
					//6. list2 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
					if(!fianl_map.get("WERKS").equals(putMap.get("WERKS"))) { 
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
						putMap.put("LGORT", 	String.valueOf(list2.get(a).get("LGORT")) );
						putMap.put("LGORT_2",	String.valueOf(list2.get(a+1).get("LGORT")) );
						if(!putMap.get("LGORT").equals(putMap.get("LGORT_2"))){
							
							//5. list rowspan 넣는 구간
							list.get(num2[1]).put("rowspan2", num1[1]);
								
							//6. list3 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
							if(!fianl_map.get("LGORT").equals(putMap.get("LGORT"))) { 
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
								putMap.put("STATUS", 	String.valueOf(list3.get(b).get("STATUS")) );
								putMap.put("STATUS_2",	String.valueOf(list3.get(b+1).get("STATUS")) );
								if(!putMap.get("STATUS").equals(putMap.get("STATUS_2"))){
									
									//5. list rowspan 넣는 구간
									list.get(num2[2]).put("rowspan3", num1[2]);
									
									//6. list4 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
								//	if(!fianl_map.get("STATUS").equals(putMap.get("STATUS"))) { 
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
		
		List<Map<String,Object>> Select_WERKS = detailStockStatus_07Service.detailStockStatus_07Select_WERKS(map); 	//법인 리스트 출력
		List<Map<String,Object>> Select_STATUS = detailStockStatus_07Service.detailStockStatus_07Select_STATUS(map); 	//상태 리스트 출력
		List<List<Object>> Select_LOC = detailStockStatus_07Service.detailStockStatus_07Select_LOC(map2);  //로케이션 리스트 출력
		List<Map<String,Object>> Select_PRTDEMON = detailStockStatus_07Service.detailStockStatus_07Select_PRTDEMON(map); 	//바코드 리스트 출력
	//	List<Map<String,Object>> Select_LOC = detailStockStatus_07Service.detailStockStatus_07Select_LOC(map);  //로케이션 리스트 출력
		

    	mv.addObject("Select_WERKS",Select_WERKS);		//법인
		mv.addObject("Select_STATUS", Select_STATUS);	//상태  
		mv.addObject("Select_LOC",Select_LOC.get(1));	//로케이션 
		mv.addObject("Select_PRTDEMON",Select_PRTDEMON);//프린트 
		mv.addObject("map", map);
    
    	return mv;
    }
}
    
   

     
  
