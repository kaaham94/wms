package WMS.Overall_status_4.inventoryPaymentDepartment_11;

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
public class inventoryPaymentDepartment_11Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="inventoryPaymentDepartment_11Service")
    private inventoryPaymentDepartment_11Service inventoryPaymentDepartment_11Service;
     
    //page load
    @RequestMapping("/Overall_status_4/inventoryPaymentDepartment_11List.do") 
	public ModelAndView inventoryPaymentDepartment_11( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Overall_status_4/inventoryPaymentDepartment_11");
				
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
    @RequestMapping(value="/Overall_status_4/inventoryPaymentDepartment_11Select_LGORT.do") 
    public ModelAndView inventoryPaymentDepartment_11Select_LGORT (CommandMap commandMap) throws Exception{
    	
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
	
		List<Map<String,Object>> Select_LGORT = inventoryPaymentDepartment_11Service.inventoryPaymentDepartment_11Select_LGORT(map); //저장위 리스트 출력 

		mv.addObject("Select_LGORT", Select_LGORT);
		
    	return mv;
    }
    
    
    @RequestMapping(value="/Overall_status_4/inventoryPaymentDepartment_11Select_left.do") 
    public ModelAndView inventoryPaymentDepartment_11Select (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
    			
    			//{"0.인자값",   					  		"1.초기값", 			"2.map 키명"} 			
    			  {(String) commandMap.get("MANDT"),      	"100", 				"MANDT"    },  //클라이언트
    			  {(String) commandMap.get("FDATE"),      	"",					"FDATE"	   },  //시작일자
    			  {(String) commandMap.get("TDATE"),      	"",					"TDATE"	   },  //종료일자
    			  {(String) commandMap.get("WERKS"),     	"",  				"WERKS"	   },  //법인
    			  {(String) commandMap.get("LGORT"),        "",					"LGORT"	   },  //저장위치
    			  {(String) commandMap.get("CUST"),      	"",					"CUST"	   },  //제조사
    			  {(String) commandMap.get("LIFNR"),     	"",  				"LIFNR"	   },  //거래처
    			  {(String) commandMap.get("MAKTX"),        "",					"MAKTX"	   },  //품번
    			  {(String) commandMap.get("USERID"),      	"",					"USERID"   }   //사용자
       	};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
    	
		
		try {
	
			List<Map<String,Object>> list = inventoryPaymentDepartment_11Service.inventoryPaymentDepartment_11Select_left(map); //db 리스트 출력
			mv.addObject("list", list);

			//---------------rowspan 작업 시작---------------
			//rowspan 작업 시작 
	    	Map<String, Object> fianl_map = new HashMap<String, Object>(); 
	    	fianl_map.put ("WERKSNM","final");
	    	fianl_map.put ("LGORTNM", "final_2");
	   
	    	for(int i=0; i < 3 ; i++){
	    		list.add(fianl_map);
	    	}
	    	Map<String, Object> putMap = new HashMap<String, Object>(); 

	    	//System.out.println("WERKSNM:"+(String) list.get(0).get("WERKSNM"));
	    	//<-------1번쨰 rowspan ------->
	    	putMap.put("WERKSNM", 	String.valueOf(list.get(0).get("WERKSNM")) );
	    	putMap.put("WERKSNM_2", 	String.valueOf(list.get(1).get("WERKSNM")) );
	    	
	    	//<-------2번쨰 rowspan ------->
	    	putMap.put("LGORTNM", 	String.valueOf(list.get(0).get("LGORTNM")) );
	    	putMap.put("LGORTNM_2", 	String.valueOf(list.get(1).get("LGORTNM")) );
	    
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
				putMap.put("WERKSNM", 	String.valueOf(list.get(i).get("WERKSNM")) );
				putMap.put("WERKSNM_2",	String.valueOf(list.get(i+1).get("WERKSNM")) );
				if(!putMap.get("WERKSNM").equals(putMap.get("WERKSNM_2"))){
					
					//5. list rowspan 넣는 구간
					list.get(num2[0]).put("rowspan", num1[0]);
			    	
					//6. list2 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
					if(!fianl_map.get("WERKSNM").equals(putMap.get("WERKSNM"))) { 
						list2.add(fianl_map);	
					}	
					
					//7. 초기화
					num2[0] += num1[0];
					num1[0] = 0;
			    	
					//두번쨰 진행--------------------------------------- 
					for(int a=0; a<list2.size()-1; a++){
					
						//1. list3 넣는 구간  
						//list3.add(list2.get(a));
						//2. list3 맨 마지막 번쨰를 위한 
						//if(list2.size()-2 == a) { 
						//	list3.add(fianl_map);	
						//	list3.add(fianl_map);	
						//}	
						//3. rowspan 개수
						num1[1] += 1;

						//4. list2 겹치는 구간 
						putMap.put("LGORTNM", 	String.valueOf(list2.get(a).get("LGORTNM")) );
						putMap.put("LGORTNM_2",	String.valueOf(list2.get(a+1).get("LGORTNM")) );
						if(!putMap.get("LGORTNM").equals(putMap.get("LGORTNM_2"))){
							
							//5. list rowspan 넣는 구간
							list.get(num2[1]).put("rowspan2", num1[1]);
								
							//6. list3 상위 row 전환 / 맨 마지막 번쨰 값에 겹쳐서 넣지 않기 위해
							//if(!fianl_map.get("LGORTNM").equals(putMap.get("LGORTNM"))) { 
							//	list3.add(fianl_map);	
							//}	
							
							//7. 초기화
							num2[1] += num1[1];
							num1[1] = 0;

						}
					}
					list2.clear();
					
					//초기화
					num1[0]= 0;
					num1[1]= 0;
					
				}
		  	}	
			
			mv.addObject("list", list);
			//---------------rowspan 작업 끝---------------
			
			
		} 
		catch (Exception e ){
			e.printStackTrace();
		} 
		List<List<Object>>  map2 =  new ArrayList<List<Object>>();
		
		List<Map<String,Object>> Select_WERKS = inventoryPaymentDepartment_11Service.inventoryPaymentDepartment_11Select_WERKS(map); 	//법인 리스트 출력
		List<List<Object>> Select_CUST = inventoryPaymentDepartment_11Service.inventoryPaymentDepartment_11Select_CUST(map);
		
		mv.addObject("Select_WERKS",Select_WERKS);		//법인
		mv.addObject("Select_CUST", Select_CUST.get(1));		//거래처  
		mv.addObject("map", map);
    
    	return mv;
    }
    
    
    @RequestMapping(value="/Overall_status_4/inventoryPaymentDepartment_11Select_right_total.do") 
    public ModelAndView inventoryPaymentDepartment_11Select_right_total (CommandMap commandMap, HttpSession session, Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
			
			//{"0.인자값",   					  		"1.초기값", 			"2.map 키명"} 			
			  {(String) commandMap.get("MANDT"),      	"100", 				"MANDT"    },  //클라이언트
			  {(String) commandMap.get("FDATE"),      	"",					"FDATE"    },  //시작일자
			  {(String) commandMap.get("TDATE"),      	"",					"TDATE"    },  //종료일자
			  {(String) commandMap.get("WERKS"),     	"",  				"WERKS"    },  //법인
			  {(String) commandMap.get("LGORT"),        "",					"LGORT"    },  //저장위치
			  {(String) commandMap.get("CUST"),      	"",					"CUST"     },  //제조사
			  {(String) commandMap.get("LIFNR"),     	"",  				"LIFNR"    },  //거래처
			  {(String) commandMap.get("MAKTX"),        "",					"MAKTX"    },  //품번
			  {(String) commandMap.get("USERID"),      	"",					"USERID"   }   //사용자
		};
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}

		try {
			//
			List<Map<String,Object>> list = inventoryPaymentDepartment_11Service.inventoryPaymentDepartment_11Select_right_total(map); //db 리스트 출력
			mv.addObject("list", list);
			
			//---------------rowspan 작업 시작---------------
			//rowspan 작업 시작 
	    	Map<String, Object> fianl_map = new HashMap<String, Object>(); 
	    	fianl_map.put ("WERKS","final");
	
	    	for(int i=0; i < 3 ; i++){
	    		list.add(fianl_map);
	    	}
	    	Map<String, Object> putMap = new HashMap<String, Object>(); 

	    	//System.out.println("WERKS:"+(String) list.get(0).get("WERKS"));
	    	//<-------1번쨰 rowspan ------->
	    	putMap.put("WERKS", 	String.valueOf(list.get(0).get("WERKS")) );
	    	putMap.put("WERKS_2", 	String.valueOf(list.get(1).get("WERKS")) );
	    	
			int[] cnt = {0};
			int[] num1 = {0,0,0,0,0};
	    	int[] num2 =  {0,0,0,0,0};
			
			//첫번쨰 진행--------------------------------------- 
			for(int i=0; i < list.size()-1 ; i++){
			
				//1. list2 넣는 구간  
				//list2.add(list.get(i));
				
				//2. list2 맨 마지막 번쨰를 위한 
				//if(list.size()-2 == i) {
				//	list2.add(fianl_map);	
				//	list2.add(fianl_map);		
				//}
				
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
					//if(!fianl_map.get("WERKS").equals(putMap.get("WERKS"))) { 
					//	list2.add(fianl_map);	
					//}	
					
					//7. 초기화
					num2[0] += num1[0];
					num1[0] = 0;
			    	
					//두번쨰 진행--------------------------------------- 
				}
		  	}	
			
			mv.addObject("list", list);
			//---------------rowspan 작업 끝---------------
			
			
		} 
		catch (Exception e ){
			e.printStackTrace();
		} 
		List<List<Object>>  map2 =  new ArrayList<List<Object>>();
		mv.addObject("map", map);
    
    	return mv;
    }
    
    
  //insert 
    @RequestMapping(value="/Overall_status_4/inventoryPaymentDepartment_11InsertUpdate.do")
    public ModelAndView inventoryPaymentDepartment_11InsertUpdate(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {		   
					"MANDT",  //클라이언트
					"FDATE",  //시작일자
					"TDATE",  //종료일자
					"WERKS",  //법인
					"LGORT",  //저장위치
					"MATNR"	  //자재코드
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
         
          //9.receiptLabel_06Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            List<Map<String, Object>> returnlist = inventoryPaymentDepartment_11Service.inventoryPaymentDepartment_11InsertUpdate(list); 
         
        	mv.addObject("list", returnlist);
        } catch (Exception e) {
        	e.printStackTrace();
            return mv;
        }
    	return mv;
    }
    
}
    
   

     
  
