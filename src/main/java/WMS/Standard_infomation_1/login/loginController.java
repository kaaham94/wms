package WMS.Standard_infomation_1.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.CommandMap;
import WMS.common.common.TapDTO;

@Controller
public class loginController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="loginService")
    private loginService loginService;
     

    //로그인
    @RequestMapping(value="/login.do")
    public ModelAndView login(HttpSession session, Model model ) throws Exception{
    	ModelAndView mv = new ModelAndView("Standard_infomation_1/login");
    	
    	return mv;
    }
    
  
    /*
   //로그인 체크
    @RequestMapping(value="/loginCheck.do")
    public ModelAndView sys_member(HttpServletResponse response, CommandMap commandMap, HttpSession session, HttpServletRequest request ,Model model) throws Exception{
    
        String ID = (String) commandMap.get("id");
        String PWD = (String) commandMap.get("pwd");
        String num = "";
        
        String valueArr[][] = {
			  //{"0.ID", "1.PWD" }
    			{"admin","123"},
    		    {"admin2","123"},				
    		    {"admin3","123"}
        };
    
        if(("".equals(ID) == false)  || ("".equals(PWD) == false)){	
			 	
			for (int i = 0; i < valueArr.length; i++) {//배열 valueArr의  행의 길이만큼 반복문이 수행된다
				if(valueArr[i][0].equals(ID) && valueArr[i][1].equals(PWD) ) { // 배열 값 안의 id 와  pw 가 같다면 
					num = Integer.toString(i); 
				}
			}
        }
       
        
        if( "".equals(num) ){ //id, pw 가 맞지 않을 떄 
        	
        	ModelAndView mv = new ModelAndView("redirect:/login.do");
        	return mv;
        	
        }else { //id, pw 가 적합할 떄
        	
        	ModelAndView mv = new ModelAndView("redirect:/sys/list_SysMember.do"); 
        	
    		session.setAttribute("ID"   , ID); //ID, PWD 세션 생성 
    		session.setAttribute("PW"	, PWD);
    		session.setAttribute("pageSize", (String) commandMap.get("pageSize") );

    		return mv;
        }
    }
    */

    @RequestMapping(value="/loginCheck.do")
    public ModelAndView login_check(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        
    	ModelAndView mv = new ModelAndView("jsonView");
    	
        Map<String,Object> map = loginService.login_check(commandMap.getMap()); 
        
    	// name이  null이 아닐때 (= passwd값과 id값이 존재할때)
    	try{
    		if("OK".equals(map.get("RESULT")) ){
    			
    			Map<String,Object> login_info = loginService.login_info(commandMap.getMap()); 
    		
        		System.out.println ("map:"+map.get("RESULT")+","+map.get("MSG"));
        		System.out.println ("pageSize:"+commandMap.get("pageSize"));
        		//session.setAttribute("pageSession", (String) commandMap.get("row") );
        		
        		session.setAttribute("USERNAME", (String) login_info.get("USERNAME") ); //이름
        		session.setAttribute("DEPTNM", (String) login_info.get("DEPTNM") );	//부서
        		session.setAttribute("UID", (String) commandMap.get("UID") );
        		session.setAttribute("PWD", (String) commandMap.get("PWD") );
        		session.setAttribute("pageSize", (String) commandMap.get("pageSize") );
        	}
    		
    		mv.addObject("map", map);
    		
    	}catch(NullPointerException e){
    		System.out.println(e.getClass() + e.getMessage());
    	}
    	
    	return mv;
    }
    
  //세션 끊김 페이지
    @RequestMapping(value="/session_out.do")
    public ModelAndView session_out(HttpSession session, Model model) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/login.do");
    	
    	session.invalidate();
    	
    	return mv;
    }
    
  
    @RequestMapping(value="/menuSelect.do")
    public ModelAndView menuSelect(CommandMap commandMap) throws Exception{
        
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = new HashMap<String, Object>(); 
        map.put("MENUID" , (String) commandMap.get("MENUID")) ;
    	
        List<Map<String,Object>> list = loginService.loginSelect_PROG(map); 
      
    	mv.addObject("list", list);

    	return mv;
    }
    
    
    @RequestMapping(value="/tabDelete_json.do")
    public ModelAndView tabDelete_json(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        
    	ModelAndView mv = new ModelAndView("jsonView");
    	
      	String TabList = (String) session.getAttribute("TabList");
        String PROGID = (String) commandMap.get("PROGID");
       
        //삭제 탭 세션 없애기 처리 
        TabList = TabList.replace(",'"+PROGID+"'", "");
        TabList = TabList.replace("'"+PROGID+"',", "");
        TabList = TabList.replace("'"+PROGID+"'", "");
     
        session.setAttribute("TabList", (String)TabList);
        System.out.println("tabDelete_json.do:"+(String)TabList);
        mv.addObject("sessionDelete", "OK");
        
    	return mv;
    }
   
    /*
    @RequestMapping(value="/tabDelete.do")
    public ModelAndView tabDelete(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        
    	ModelAndView mv = new ModelAndView("redirect:/Standard_infomation_1/tabEmpty.do");
    	
        Map<String,Object> map = new HashMap<String, Object>(); 
        map.put("PROGID" , "" ) ;
        map.put("MENUID" , (String) commandMap.get("MENUID")) ;
        
        String TabList = (String) session.getAttribute("TabList");
        String PROGID = (String) commandMap.get("PROGID");
        
    	//삭제 탭이 현재 페이지일때 진행 
        if(TabList.indexOf(",") != -1 ){
        	
        	String[] TabListArray =  (TabList.replace("'","")).split(",");
         	int num = 0;
         	System.out.println("TabListArray:"+TabListArray);
         	System.out.println("PROGID:"+PROGID);
         	for(int i=0; i<TabListArray.length; i++) {
         		System.out.println("TabListArray["+i+"]:"+TabListArray[i]);
         		if(PROGID.equals(TabListArray[i])){
         			
         			System.out.println("****TabListArray["+i+"]****:"+TabListArray[i]);
         			num = (i > 0) ? i-1 : 1 ;     				//삭제탭 이전의 페이지 이동 
     				map.put("PROGID" , (String)TabListArray[num]) ;   
     				System.out.println("TabListArray[num]:"+TabListArray[num]);
     				Map<String,Object> ChoicePROG = loginService.loginSelect_ChoicePROG(map);
     				mv = new ModelAndView("redirect:"+((String) ChoicePROG.get("WEBURL")).replace("/WMS", ""));
         			
         		}
         	}
        }
       
    	//삭제 탭 세션 없애기 처리 
        TabList = TabList.replace(",'"+PROGID+"'", "");
        TabList = TabList.replace("'"+PROGID+"',", "");
        TabList = TabList.replace("'"+PROGID+"'", "");
     
        System.out.println("TabList:"+TabList);
        
        session.setAttribute("TabList", (String)TabList);
    	
        //mv.addObject("sessionDelete", "OK");
        
    	return mv;
    }
    */
    
    @RequestMapping(value="/tabDelete.do")
    public ModelAndView tabDelete(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        
    	//ModelAndView mv = new ModelAndVqew("redirect:/Standard_infomation_1/tabEmpty.do");
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("WEBURL", "/WMS/Standard_infomation_1/tabEmpty.do");
    	
        Map<String,Object> map = new HashMap<String, Object>(); 
        map.put("PROGID" , "" ) ;
   
        
        String TabList = (String) session.getAttribute("TabList");
        String PROGID = (String) commandMap.get("PROGID");
        
    	//삭제 탭이 현재 페이지일때 진행 
        if(TabList.indexOf(",") != -1 ){
        	
        	String[] TabListArray =  (TabList.replace("'","")).split(",");
         	int num = 0;
         	//System.out.println("TabListArray:"+TabListArray);
         	//System.out.println("PROGID:"+PROGID);
         	for(int i=0; i<TabListArray.length; i++) {
         		System.out.println("TabListArray["+i+"]:"+TabListArray[i]);
         		if(PROGID.equals(TabListArray[i])){
         			
         			//System.out.println("****TabListArray["+i+"]****:"+TabListArray[i]);
         			num = (i > 0) ? i-1 : 1 ;     				//삭제탭 이전의 페이지 이동 
     				map.put("PROGID" , (String)TabListArray[num]) ;   
     				//System.out.println("TabListArray[num]:"+TabListArray[num]);
     				//System.out.println("map:"+map);
     				Map<String,Object> ChoicePROG = loginService.loginSelect_ChoicePROG(map);
     				//mv = new ModelAndView("redirect:"+((String) ChoicePROG.get("WEBURL")).replace("/WMS", ""));
     				 mv.addObject("WEBURL", (String) ChoicePROG.get("WEBURL"));
     				 mv.addObject("PROGID", (String) ChoicePROG.get("PROGID"));
         		}
         	}
        }
       
    	//삭제 탭 세션 없애기 처리 
        TabList = TabList.replace(",'"+PROGID+"'", "");
        TabList = TabList.replace("'"+PROGID+"',", "");
        TabList = TabList.replace("'"+PROGID+"'", "");
     
        System.out.println("TabList:"+TabList);
        
        session.setAttribute("TabList", (String)TabList);
    	
       
        
    	return mv;
    }
    
    @RequestMapping(value="Standard_infomation_1/tabEmpty.do")
    public ModelAndView tabEmpty( HttpSession session,  HttpServletRequest request) throws Exception{
        
    	ModelAndView mv = new ModelAndView("redirect:/login.do");
    	Map<String,Object> map = new HashMap<String, Object>(); 
    	try {
	    	//ID 세션 체크 
			if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
				
				mv = new ModelAndView("Standard_infomation_1/emptyPage");
				List<Map<String,Object>> MENU = loginService.loginSelect_MENU(map);		//db 리스트 출력
				mv.addObject("MENU", MENU);
	        }
    	}catch (Exception e ){
			e.printStackTrace();
		} 
   
    	return mv;
    }
    
}

     
  
