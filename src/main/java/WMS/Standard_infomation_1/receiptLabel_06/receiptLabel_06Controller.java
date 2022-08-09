package WMS.Standard_infomation_1.receiptLabel_06;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.CommandMap;
import WMS.common.common.TapDTO;

@Controller
public class receiptLabel_06Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="receiptLabel_06Service")
    private receiptLabel_06Service receiptLabel_06Service;
     
     
    //page load
    @RequestMapping(value="/Standard_infomation_1/receiptLabel_06List.do") 
	public ModelAndView receiptLabel_06List( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Standard_infomation_1/receiptLabel_06");
				
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
    @RequestMapping(value="/Standard_infomation_1/receiptLabel_06InsertUpdate.do")
    public ModelAndView receiptLabel_06Insert_codeType(@RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
     
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            System.out.println("array:" + array);
           
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            String[] temp = {		   
					"MANDT",   		//클라이언트
					"CUSTCD",  	    //거래처
					"CTYPE", 	 	//라벨종류
					"BARTYPE", 	    //바코드타입
					"PINPUT", 	    //P코드 수기입력
					"PSPLITSTRING", //조회제거문자
					"PPREFIX", 	    //전구분자
					"PLASTFIX", 	//후구분자
					"PLENGTH", 	    //길이
					"QINPUT", 	    //Q코드 수기입력
					"QPREFIX", 	    //전구분자
					"QLASTFIX", 	//후구분자
					"QLENGTH", 	    //길이
					"SINPUT", 	    //S코드 수기입력
					"SDATETYPE", 	//일자타입
					"SPREFIX", 	    //전구분자
					"SLASTFIX", 	//후구분자
					"IMAGECODE",	//이미지코드
					"CMATNRFLAG",	//거래처품번매핑처리
					"USEFLAG",	    //사용유무
					"REMARK",		//비고
					"EXBARDATA",	//바코드예제
					"USERID", 	    //사용자
					"NEWFLAG"    //신규여부
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
            
          //9.receiptLabel_06Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = receiptLabel_06Service.receiptLabel_06InsertUpdate(list); 
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
    @RequestMapping(value="/receiptLabel_06/receiptLabel_06Select.do") 
    public ModelAndView receiptLabel_06Select_test (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	String valueArr[][] = {
            		
		  //{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("CUSTCD"), 	"", 		"CUSTCD"},		//1.(text)	거래처코드  
			{(String) commandMap.get("CUSTNM"), 	"", 		"CUSTNM"}, 		//2.(text) 	거래처명 
			{(String) commandMap.get("USEFLAG"), 	"Y", 		"USEFLAG"}, 	//3.(select) 사용유무 
			{(String) commandMap.get("BARTYPE"), 	"", 		"BARTYPE"}, 	//4.(select) 바코드타입 
			{(String) commandMap.get("orderby"),	"CUSTCD", 	"orderby"},		//5.(select)정렬 
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> list = receiptLabel_06Service.receiptLabel_06Select(map); //db 리스트 출력 
		List<Map<String,Object>> Select_VIEWIMAGE = receiptLabel_06Service.receiptLabel_06Select_VIEWIMAGE(map); //db 리스트 출력
		List<Map<String,Object>> Select_BARTYPE = receiptLabel_06Service.receiptLabel_06Select_BARTYPE(map); //db 리스트 출력
		List<Map<String,Object>> Select_CUSTCD = receiptLabel_06Service.receiptLabel_06Select_CUSTCD(map); //db 리스트 출력
		List<Map<String,Object>> Select_SDATETYPE = receiptLabel_06Service.receiptLabel_06Select_SDATETYPE(map); //db 리스트 출력
		
		mv.addObject("Select_VIEWIMAGE",Select_VIEWIMAGE);
		mv.addObject("Select_BARTYPE",Select_BARTYPE);
		mv.addObject("Select_CUSTCD",Select_CUSTCD);
		mv.addObject("Select_SDATETYPE",Select_SDATETYPE);
		mv.addObject("list", list);
		mv.addObject("map", map);
    	return mv;
    }
    
    
    
}
    
   

     
  
