package WMS.Standard_infomation_1.partNumberMaster_08;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.PagingDTO;
import WMS.common.common.TapDTO;
import WMS.common.common.CommandMap;

@Controller
public class partNumberMaster_08Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="partNumberMaster_08Service")
    private partNumberMaster_08Service partNumberMaster_08Service;
    
     
    //page load
    @RequestMapping(value="/Standard_infomation_1/partNumberMaster_08List.do") 
	public ModelAndView partNumberMaster_08List( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Standard_infomation_1/partNumberMaster_08");
				
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
    @RequestMapping(value="/Standard_infomation_1/partNumberMaster_08InsertUpdate.do")
    public ModelAndView partNumberMaster_08Insert_codeType(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {	
            		"MANDT", 			
            		"MATNR", 			
            		"MAKTX", 			
            		"MAKTXLABEL",		
            		"MAKTXYURA",		
            		"MTART", 			
            		"CUSTCD",			
            		"SPEC",			
            		"MEINS",			
            		"UMREZ",			
            		"MOQ",				
            		"MPQ",				
            		"BOXSIZE",			
            		"BOXVOLUME",		
            		"BOXWEIGHT",		
            		"ERPHKCODE",		
            		"ERPSRTCODE",		
            		"INSPECTIONFLAG",
            		"INSPECTIONSDATE",
            		"INSPECTIONEDATE",
            		"INSPECTIONCOUNT",
            		"ELEMENTFLAG",		
            		"USEFLAG",			
            		"REMARK",			
            		"USERID", 			
            		"NEWFLAG" 
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
            
          //9.partNumberMaster_08Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = partNumberMaster_08Service.partNumberMaster_08InsertUpdate(list); 
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
    
    
    
    //search
    @RequestMapping(value="/partNumberMaster_08/partNumberMaster_08Select.do") 
    public ModelAndView partNumberMaster_08Select_test ( 
													   	HttpSession session, 
													   	CommandMap commandMap,
													   	Model model) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	PagingDTO pagingDTO = new PagingDTO();
     	Map<String,Object> map = new HashMap<String,Object>(); 
    	String valueArr[][] = {
            		
    			//{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
    			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
    			{(String) commandMap.get("CUSTCD"), 	"", 		"CUSTCD"},		//1.(select) 제조사  
    			{(String) commandMap.get("MATNR"), 		"", 		"MATNR"}, 		//2.(text) 	 WMS코드 
    			{(String) commandMap.get("USEFLAG"), 	"Y", 		"USEFLAG"}, 	//3.(select) 사용유무 
    			{(String) commandMap.get("MAKTX"), 		"", 		"MAKTX"}, 		//4.(text)	  품번 
    			{(String) commandMap.get("orderby"),	"MATNR", 	"orderby"},		//5.(select) 정렬 
    			{(String) commandMap.get("pageNo"), 	"1", 		"pageNo"}, 		//6.(페이지)현재 페이지
    			{(String) commandMap.get("pageSize"), 	(String)session.getAttribute("pageSize"), 	"pageSize"} //7.(페이지)노출될 페이지 로우 
        };
    	System.out.println("pageSize:"+map.get("pageSize"));
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
			
			List<Map<String,Object>> list = partNumberMaster_08Service.partNumberMaster_08Select(map); //db 리스트 출력 
			
			// list가 빈값이 아닐떄, 총 리스트개수 삽입 -> 페이징 생성 
			if(!list.isEmpty()) {
				int count =  Integer.parseInt(list.get(0).get("TOTAL_COUNT").toString()); 
				pagingDTO.setTotalCount(count);
			}
			 
			map.put("pageSize",pagingDTO.getPageSize()); // row수  
		
			//map 리턴 
			mv.addObject("map", map); 
			System.out.println("map:"+map);
			mv.addObject("list", list);
			
			//model 리턴
			mv.addObject("paging", pagingDTO);//페이징 리턴 
			System.out.println("pagingDTO:"+pagingDTO);
			
			//---------------페이징 부분 끝---------------
		} 
		catch (Exception e ){
			e.printStackTrace();
		} 
		
		
		List<Map<String,Object>> Select_CUSTCD = partNumberMaster_08Service.partNumberMaster_08Select_CUSTCD(map); //db 리스트 출력
		List<Map<String,Object>> Select_CODE = partNumberMaster_08Service.partNumberMaster_08Select_CODE(map); //db 리스트 출력
		//mv.addObject("list", list);
		mv.addObject("Select_CUSTCD",Select_CUSTCD);
		mv.addObject("Select_CODE",Select_CODE);
    	return mv;
    }
    
}
    
   

     
  
