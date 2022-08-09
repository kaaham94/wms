package WMS.SysMember.service;

import java.util.List;
import java.util.Map;

public interface SysMemberService {

	List<Map<String, Object>> list_SysMember(Map<String, Object> commandMap) throws Exception;//리스트
	
	Map <String, Object> view_SysMember(Map<String, Object> commandMap) throws Exception;	 //상세보기
	
	void updateInsert_SysMember(Map<String, Object> commandMap) throws Exception; 			//글저장 &수정                  
	
	void delete_SysMember(Map<String, Object> commandMap) throws Exception;					//글삭제
	
	List<Map<String, Object>> excelALLDown_SysMember(Map<String, Object> commandMap) throws Exception; 		//엑셀 전체 다운로드
	
	Map <String, Object> login_check(Map<String, Object> commandMap) throws Exception; 		//로그인 확인
	
	//new 
	Map <String, Object> login_check_new(Map<String, Object> commandMap) throws Exception; //로그인 확인 
}
