package WMS.Standard_infomation_1.imageReference_05;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pengrad.telegrambot.passport.decrypt.Base64;
import com.pengrad.telegrambot.passport.decrypt.Base64.Encoder;

import WMS.common.common.CommandMap;
import WMS.common.common.TapDTO;
@Controller
public class imageReference_05Controller {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="imageReference_05Service")
    private imageReference_05Service imageReference_05Service;
    
     
    //page load
    @RequestMapping(value="/Standard_infomation_1/imageReference_05List.do") 
	public ModelAndView imageReference_05List( HttpSession session, HttpServletRequest request ) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/login.do");

    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Standard_infomation_1/imageReference_05");
				
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
    @RequestMapping(value="/Standard_infomation_1/imageReference_05InsertUpdate.do", method=RequestMethod.POST)
    public ModelAndView imageReference_05Insert_codeType(CommandMap commandMap,  MultipartHttpServletRequest request, @RequestParam Map<String,Object> param) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//1. json값을 SQL쿼리로 전달할 list 객체 생성 
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    	Map<String,Object> map = new HashMap<String, Object>();
    	try {
    		//2. 화면에서 ajax로 데이터 받아온 json 객체 
            //JSONArray array = new JSONArray(param.get("target").toString());  //json 배열
            //System.out.println("array:" + array);
            
            //3.받아온 json 객체dp 지정할 이름을 배열에 넣어준다. 
            				//클라이언트, 이미지코드,		이미지명,		파일명,  		이미지,		이미지 존재여부		사용유무	  비고	 	사용자	   신규여부		리턴 메세지
            //String[] temp = {"MANDT", "IMAGECODE", "IMAGENAME", "FILENAME", "VIEWIMAGE", "IMAGEEDIT", "USEFLAG", "REMARK", "USERID" ,"NEWFLAG" ,"RTNMSG"};
           
            //4.List<Map<String,Object>>로 json값을 SQL쿼리로 전달할 map 객체 생성. 
            //Map<String, Object> listMap = null;
            
            //파일 저장할 경로 생성 -------------------------------------------------------------------
    		//int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
    		
		   // MultipartRequest multi =null;
           // String uploadPath = request.getSession().getServletContext().getRealPath("/Upload");

         // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	       // multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		   
							//클라이언트, 이미지코드,		이미지명,		파일명,  		이미지,		이미지 존재여부		사용유무	  비고	 	사용자	   신규여부		리턴 메세지
            String[] temp = {"MANDT", "IMAGECODE", "IMAGENAME", "FILENAME", "VIEWIMAGE", "IMAGEEDIT", "USEFLAG", "REMARK", "USERID" ,"NEWFLAG" ,"RTNMSG"};
          
			for(String str : temp) {
				map.put(str, request.getParameter(str));
				
			}
			map.put("VIEWIMAGE", request.getFile("VIEWIMAGE").getBytes());
			//byte[] imgFile;
			//imgFile  = request.getParameter("VIEWIMAGE").getBytes();
			System.out.println("getFile:"+request.getFile("VIEWIMAGE"));
		//MultipartFile report = request.getFile("VIEWIMAGE");

		//byte[] imageContent = (byte[])
		
    		// -------------------------------------------------------------------
    		
            
          //9.imageReference_05Insert 서비스에 화면에서 받아온 값 List<Map<String,Object>>객체를 인자값으로 전달 
            Map<String, Object> returnMap = imageReference_05Service.imageReference_05InsertUpdate(map); 
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
    @RequestMapping(value="/imageReference_05/imageReference_05Select.do") 
    public ModelAndView imageReference_05Select_test (CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	
    	String valueArr[][] = {
            		
		  //{"0.인자값",   							"1.초기값", 	 "2.map 키명", 			
			{(String) commandMap.get("MANDT"), 		"100", 		"MANDT"}, 		//0.(hidden)'회사코드' 전역변수
			{(String) commandMap.get("IMAGECODE"), 	"", 		"IMAGECODE"},	//1.(text)	이미지코드  
			{(String) commandMap.get("IMAGENAME"), 	"", 		"IMAGENAME"}, 	//2.(text) 	이미지명 
			{(String) commandMap.get("USEFLAG"), 	"Y", 		"USEFLAG"}, 	//3.(select)사용유무 
			{(String) commandMap.get("orderby"),	"IMAGECODE", 	"orderby"},	//4.(select)정렬 
        };
    	
		for(int i=0; i<valueArr.length; i++) {
    		
        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
        	}														 // }
        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
      	}
	
		List<Map<String,Object>> list = imageReference_05Service.imageReference_05Select(map); //db 리스트 출력 
		
		mv.addObject("list", list);
		mv.addObject("map", map);
		
    	return mv;
    }
    
    
                                
	    @RequestMapping(value="/imageReference_05Select_VIEWIMAGE.do")
	    public ResponseEntity<byte[]> getByteImage(CommandMap commandMap) throws Exception {
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	map.put("MANDT", commandMap.get("MANDT"));
	    	map.put("IMAGECODE", commandMap.get("IMAGECODE"));
	    	Map<String,Object> VIEWIMAGE = imageReference_05Service.imageReference_05Select_VIEWIMAGE(map);
	    	//System.out.println("map:"+commandMap.get("IMAGECODE"));
			//System.out.println("VIEWIMAGE:"+(byte[]) VIEWIMAGE.get("VIEWIMAGE"));
			byte[] imageContent = (byte[]) VIEWIMAGE.get("VIEWIMAGE");
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	    }
}
    
   

     
  
