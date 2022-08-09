package WMS.Standard_infomation_1.login;

import java.util.List;
import java.util.Map;

public interface loginService {

	Map <String, Object> login_check(Map<String, Object> commandMap) throws Exception; 		//로그인 확인

	Map <String, Object> login_info(Map<String, Object> commandMap) throws Exception; 		//로그인 정보
	
	List<Map<String, Object>> loginSelect_MENU(Map<String, Object> map) throws Exception; //메뉴
	
	List<Map<String, Object>> loginSelect_PROG(Map<String, Object> map) throws Exception; //해당 메뉴화면

	Map<String, Object> loginSelect_ChoicePROG(Map<String, Object> map) throws Exception;
}
