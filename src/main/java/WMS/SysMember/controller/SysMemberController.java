package WMS.SysMember.controller;

import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import WMS.SysMember.service.SysMemberService;
import WMS.common.common.CommandMap;
import WMS.common.common.PagingDTO;

@Controller("/sys/*")
public class SysMemberController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="sysMemberService")
    private SysMemberService sysMemberService;
     

    
    //리스트 Json
    @RequestMapping("/sys/list_SysMember.do") 
	public ModelAndView list_SysMember(@ModelAttribute("pagingDTO") PagingDTO pagingDTO, 
									   HttpSession session, 
									   Map<String,Object> map, 
									   Model model,
									   CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("SysMember/list_SysMember");
    	
    	GregorianCalendar today = new GregorianCalendar();
    	int year = today.get ( today.YEAR );
    
    	String valueArr[][] = {
            		
		  //{"0.인자값",   									"1.초기값", 	 	"2.map 키명", 			
			{(String) commandMap.get("search_detail"), 		"category", 		"search_detail"}, 	 //0.(검색)상세검색 - 카테고리, 이메일, 등록자
			{(String) commandMap.get("search_detail_txt"), 	"%%", 				"search_detail_txt"},//1.(검색)상세검색 - 텍스트    
			{(String) commandMap.get("search_s_dt"), 		year+"년 01월 01일", 	"search_s_dt"}, 	 //2.(검색)기간검색 - 시작날짜
			{(String) commandMap.get("search_e_dt"), 		year+"년 12월 31일", 	"search_e_dt"}, 	 //3.(검색)기간검색 - 시작날짜
			{(String) commandMap.get("search_s_dt_simp"), 	year +"-01-01", 	"search_s_dt_simp"}, //4.(검색)기간검색 - 시작날짜
			{(String) commandMap.get("search_e_dt_simp"), 	year +"-12-31", 	"search_e_dt_simp"}, //5.(검색)기간검색 - 종료날짜
			{(String) commandMap.get("search_dt"), 			"date", 			"search_dt"}, 		 //6.(검색)기간검색 - 등록, 수정
			{(String) commandMap.get("pageNo"), 			"1", 				"pageNo"}, 			 //7.(페이지)현재 페이지
			{(String) commandMap.get("pageSize"), 			(String)session.getAttribute("pageSize"), 				"pageSize"} 		 //8.(페이지)노출될 페이지 로우 
        };
    	
    	//ID 세션 체크 
		if(( StringUtils.isEmpty((String) session.getAttribute("ID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
		
			for(int i=0; i<valueArr.length; i++) {
	    		
	        	if(StringUtils.isEmpty(valueArr[i][0])){				 // if(StringUtils.isEmpty(valueArr[i][0]){  
	        		valueArr[i][0] = valueArr[i][1];					 //		valueArr[i][0]  = "category"
	        	}														 // }
	        	map.put(valueArr[i][2], valueArr[i][0]); 				 // map.put("search_detail", valueArr[i][0]);
	      	}
			
        }else {
        	mv = new ModelAndView("redirect:/loginCheck.do");
        	return mv;
        }
    	  
    	session.setAttribute("pageSize", map.get("pageSize"));
    	pagingDTO.setPageSize(Integer.parseInt((String) map.get("pageSize")));// 한 페이지에 보일 게시글 수
    	pagingDTO.setPageNo(Integer.parseInt((String) map.get("pageNo"))); 	// 현재 페이지 번호
    	pagingDTO.setBlockSize(10); 
    	
    	//페이지 시작 리스트번호, 끝 리스트번호 생성
    	map.put("START",pagingDTO.getStartRowNum()); 	//시작 리스트 번호 
    	map.put("END",pagingDTO.getEndRowNum()); 		//끝 리스트 번호 
    	
    
    	List<Map<String,Object>> list = sysMemberService.list_SysMember(map); //db 리스트 출력 
    	
    	// list가 빈값이 아닐떄, 총 리스트개수 삽입 -> 페이징 생성 
		if(!list.isEmpty()) {
			int count =  Integer.parseInt(list.get(0).get("TOTAL_COUNT").toString()); 
    		pagingDTO.setTotalCount(count);
		}
		 
		
		
    	map.put("search_se_dt", map.get("search_s_dt")+" - "+ map.get("search_e_dt")); // YYYY년 MM월 DD일 - YYYY년 MM월 DD일 
		map.put("pageSize",pagingDTO.getPageSize()); // row수  
		map.put("search_detail_txt", ((String) map.get("search_detail_txt")).replaceAll("%", "")); // % 제외한 검색 
		//map 리턴 
		mv.addObject("map", map); 
		mv.addObject("list", list);
		
		//model 리턴
		model.addAttribute("paging", pagingDTO);//페이징 리턴 
    
    	
		return mv;
	}
   
    //상세페이지 
    @RequestMapping(value="/sys/view_SysMember.do")
    public ModelAndView view_SysMember(CommandMap commandMap) throws Exception{
    	
        ModelAndView mv = new ModelAndView("SysMember/detail_SysMember");
        Map<String,Object> map = sysMemberService.view_SysMember(commandMap.getMap());
        	
        mv.addObject("map",map);
        mv.addObject("commandMap",commandMap.getMap());

        return mv;
    }
    
   
    
    //글작성 페이지 
    @RequestMapping(value="/sys/write_SysMember.do")
    public ModelAndView write_SysMember(CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("SysMember/detail_SysMember");
    	
    	return mv;
    }
    
    //글 삭제 
    @RequestMapping(value="/sys/delete_SysMember.do") 
    public ModelAndView delete_SysMember(CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/sys/list_SysMember.do");
    	sysMemberService.delete_SysMember(commandMap.getMap()); 
    	
    	return mv;
    }
    
    //글저장 & 수정                    
    @RequestMapping(value="/sys/updateInsert_SysMember.do") 
    public ModelAndView writeInsert_SysMember(@RequestParam Map<String, Object> map,CommandMap commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("redirect:/sys/list_SysMember.do");

    	//number 키값이 공백일 때
    	if(StringUtils.isEmpty(commandMap.get("number"))){
    		commandMap.put("save_Return" ,"insert");
    		System.out.println ("insert");
		}else {
			commandMap.put("save_Return" ,"update");
			System.out.println ("update");
		}
    	
    	String title = (String) commandMap.get("title");
    	title.replace('"', '\"'); 
    	title = title.replaceAll("\"", "&#34");
    	title = title.replace("'", "&#39");
    	commandMap.put("title" ,title);
        
    	sysMemberService.updateInsert_SysMember(commandMap.getMap()); 

    	//int pushIdx = (Integer) map.get("idx"); 	
    	//System.out.println(commandMap.get("idx"));
        return mv;
    }

    //엑셀 다운로드
    @RequestMapping(value="/sys/excelDown_SysMember.do") //download_excel_event
    public ModelAndView excelDown_SysMember(CommandMap commandMap, Map<String,Object> map) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("SysMember/excelDown_SysMember");
    	
    	map.put("search_s_dt_simp",(String)commandMap.get("search_s_dt_simp"));
    	map.put("search_e_dt_simp",(String)commandMap.get("search_e_dt_simp"));
    	map.put("search_dt",(String)commandMap.get("search_dt"));
        	
    	map.put("search_detail",(String)commandMap.get("search_detail"));
    	map.put("search_detail_txt",'%'+(String)commandMap.get("search_detail_txt")+'%');
    	
    	map.put("START",Integer.parseInt((String)commandMap.get("pageStart")));
    	map.put("END",Integer.parseInt((String)commandMap.get("pageEnd")));
    	System.out.println("map:===> "+ map);

    	
    	if("total".equals((String)commandMap.get("param"))){
    		List<Map<String,Object>> list = sysMemberService.excelALLDown_SysMember(map); //전체 출력
    		mv.addObject("list", list);
    	}else {
    		List<Map<String,Object>> list = sysMemberService.list_SysMember(map); //db 리스트 출력 
    		mv.addObject("list", list);
    	}
    	
    	mv.addObject("map", map);
    	
    	return mv;
    	
    }
/*
    
    //============================로그인 로직 
    //로그인
    @RequestMapping(value="/login.do")
    public ModelAndView login(HttpSession session, Model model ) throws Exception{
    	ModelAndView mv = new ModelAndView("login");
    	
    	return mv;
    }
    
   //로그인 체크_new 
    @RequestMapping(value="loginCheck_new.do")
    public ModelAndView sys_member_2(CommandMap commandMap, HttpSession session, HttpServletRequest request ) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/login.do"); 
    	
    	Map<String,Object> map = sysMemberService.login_check_new(commandMap.getMap());
    //	map.forEach((k,v) -> System.out.println("key :"+k+", value :"+v)) ;
    	System.out.println("MapTest:"+map.get("studentNo"));
    	
    	Set set = map.keySet();
    	Iterator iterator =set.iterator();
    	
    	while(iterator.hasNext()) {
    		String key = (String)iterator.next();
    		System.out.println("Map Key :" + key );
    		System.out.println("Map Key :" + map.get(key) );
    	}
    	
    	return mv;
    	
    }
    
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
    /*
    
    @RequestMapping(value="/loginCheck.do")
    public ModelAndView login_check(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        
    	ModelAndView mv = new ModelAndView("redirect:/login.do");
    	
        Map<String,Object> map = sysMemberService.login_check(commandMap.getMap()); 
        
    	// name이  null이 아닐때 (= passwd값과 id값이 존재할때)
    	try{
    		if(!map.isEmpty()){
        		System.out.println ("map:"+map);
        		session.setAttribute("pageSession", (String) commandMap.get("row") );
        		session.setAttribute("ID", (String) map.get("name") );
        		
        		mv = new ModelAndView("redirect:/sys/list_SysMember.do");
        		mv.addObject("map", map);
        	}
    	    
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
    */
}

     
  
