package WMS.Management_of_workers_3.groupAuthority_03;

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
public class groupAuthority_03Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="groupAuthority_03Service")
    private groupAuthority_03Service groupAuthority_03Service;
     
    //page load
    @RequestMapping("/Management_of_workers_3/groupAuthority_03List.do") 
	public ModelAndView groupAuthority_03Select( HttpSession session, HttpServletRequest request   ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Management_of_workers_3/groupAuthority_03");
			
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
    @RequestMapping(value="/Management_of_workers_3/groupAuthority_03InsertUpdate.do")
    public ModelAndView groupAuthority_03InsertUpdate(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
           //System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {
            		"MANDT"    ,	//클라이언트  
					"ROLLID"   ,	//그룹ID 
					"PROGID"   ,	//화면ID(=프로그램ID) 
					"FINDGRANT",	//조회권한:I(등록),U(업데이트),D(삭제) 
					"NEWGRANT" ,	//신규
					"SAVEGRANT",	//저장
					"DELGRANT" ,	//삭제
					"EXPGRANT" ,	//엑셀
					"PRTGRANT" ,	//출력
					"UPDUSER" 	//수정자 
				
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
            
            //9.groupAuthority_03Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = groupAuthority_03Service.groupAuthority_03InsertUpdate(list); 
          
            mv.addObject("message", returnMap.get("message"));
            mv.addObject("result", returnMap.get("result"));
        } catch (Exception e) {
            e.printStackTrace();
            return mv;
        }
    	return mv;
    }    

  
    //search
    @RequestMapping(value="/groupAuthority_03/groupAuthority_03Select_right.do") 
    public ModelAndView groupAuthority_03Select_right (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
            		
		  //{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 	//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("language"), 	"KOREAN", 	"language"},//1.언어   
			{(String) commandMap.get("ROLLID"), 	"", 		"ROLLID"}	//2.그룹 ID
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
		
		//M100 -기준 정보    
		//M103 -지시 관리    
		//M110 -제품 관리    
		//M115 -로케이션 관리
		//M800 -재고 실사    
		//M810 -외주관리     
		//M850 -종합 현황    
		//M001 -작업자 관리  
		//M000 -시스템 관리  

		List<Map<String,Object>> list = groupAuthority_03Service.groupAuthority_03Select_right(map); //db 리스트 출력 
		
		int cnt = 0;
		String getMenuid ="";
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		
		List dataRow = new ArrayList();
		int num = 0;
	
		for(int i=0; i < list.size(); i++){

			//1. list배열에 있는 menuid를 받는다.
			Map map3 = (HashMap)list.get(i);
			
			//2. menuid가 전 배열의 값과 다를 떄,
			if(!getMenuid.equals((String)map3.get("menuid"))){
	
				dataRow.add(i);
				num += 1;
			}
			cnt += 1; //for문 횟수
			map2.put((String) map3.get("menuid"), map2.getOrDefault(map3.get("menuid"), 0)+1);	//해당 menuid의 갯수	
			
			//3. mednuid를 넣어준다 -> 다음에 받을 값과 비교하기 위함
			getMenuid = (String) map3.get("menuid");
		}
		
		//map2:{M110=1, M000=3, M103=6, M850=15, M100=9, M001=4, M800=6, M810=6, M115=1}
		
		for(int i=0; i < dataRow.size(); i++ ) {
			num = (Integer)dataRow.get(i);
			list.get(num).put("rowspan", map2.get(list.get(num).get("menuid")));
		}
		
	
		System.out.println("map2:"+map2);	
		System.out.println("list:"+list);
	
		mv.addObject("list", list);
		mv.addObject("map", map2);
    	return mv;
    }
    
    
    //search
    @RequestMapping(value="/groupAuthority_03/groupAuthority_03Select_left.do") 
    public ModelAndView groupAuthority_03Select_left() throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
		List<Map<String,Object>> list = groupAuthority_03Service.groupAuthority_03Select_left(); //db 리스트 출력 
		
		mv.addObject("list", list);

    	return mv;
    }
    
}
    
   

     
  
