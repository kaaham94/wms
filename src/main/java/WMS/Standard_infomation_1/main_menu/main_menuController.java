package WMS.Standard_infomation_1.main_menu;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import WMS.common.common.CommandMap;
import WMS.common.common.PagingDTO;

@Controller("/main_menu/*")
public class main_menuController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="main_menuService")
    private main_menuService main_menuService;
     
    //리스트 Json
    @RequestMapping("/main_menu/notice_list.do") 
	public ModelAndView noticeSelect( HttpSession session, 
									   Map<String,Object> map, 
									   CommandMap commandMap) throws Exception{
    	ModelAndView mv;
    	
    	//ID 세션 체크 
		if(( StringUtils.isEmpty((String) session.getAttribute("UID")) ) == false  || (StringUtils.isEmpty((String) session.getAttribute("PWD")) == false)){	
			System.out.println("main_menu/notice_list.do");
			
			mv = new ModelAndView("Standard_infomation_1/notice/notice_list");
			
			List<Map<String,Object>> list = main_menuService.noticeSelect(map); //db 리스트 출력 
			mv.addObject("list", list);
			
        }else {
        	
        	mv = new ModelAndView("redirect:/login.do");
        }
    	
		return mv;
	}
   
   
}

     
  
