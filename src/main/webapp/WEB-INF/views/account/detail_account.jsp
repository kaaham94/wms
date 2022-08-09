<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>


        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Home</a>
                    </li>
                    <li>시스템 관리</li>
                    <li class="active">회원 관리</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        	회원 관리
                    </h1>
                </div>

            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
             <div class="page-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						
							
					<form id="insert_sbmit">
						<div class="widget-body-sub">
							<div class="form-horizontal form-bordered">
								
							
								<input type="hidden" name="memo_submit" id="memo_submit" value="" />
							 
							 	<input type="hidden" id="number" name="number" value="${map.number}">
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">아이디</label>  
									<a  id="id_check" class="btn btn-default" onclick="javascript:ajax_id_check();" >아이디 중복확인</a>
                                  	<span id="id_check_message"></span>
                                   	
                                   	<div class="col-sm-4">
										<input type="text" class="form-control" id="id" name="id" value="${map.id}">
									</div>
                                </div>    

								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">패스워드</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="passwd" name="passwd" value="${map.passwd}">
									</div>
									
									<span id="english_vail" style="color:#444444">영어 포함 <i class='fa fa-chevron-circle-down fa-lg' aria-hidden='true'></i></span>&nbsp;&nbsp;
									<span id="specialCharacters_vail" style="color:#444444">특수문자 포함 <i class='fa fa-chevron-circle-down fa-lg' aria-hidden='true'></i></span>&nbsp;&nbsp; 
									<span id="number_vail" style="color:#444444">숫자 포함 <i class='fa fa-chevron-circle-down fa-lg' aria-hidden='true'></i></span>&nbsp;&nbsp; 
									<span id="length_vail" style="color:#444444">8자 이상 <i class='fa fa-chevron-circle-down fa-lg' aria-hidden='true'></i></span>&nbsp;&nbsp; 
							
								</div>
								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">이름</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="name" name="name" value="${map.name}" >
									</div>
								</div>
								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">소속</label>
									<div class="col-sm-6">
										<select class="form-control" id="position" name="position">
	                                           <option value="">Select</option>
											   <option value="관리자">관리자</option>
											   <option value="모바일팀">모바일팀</option>
											   <option value="구매팀">구매팀</option>
											   <option value="영업팀">영업팀</option>
											   <option value="기술팀">기술팀</option>
											   <option value="경영지원">경영지원</option>
											   <option value="기타">기타</option>
										</select>
									</div>
								</div>
				
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">등록일</label>
									<div class="col-sm-4 text">
										${map.date}
									</div>
								</div>

								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">수정일</label>
									<div class="col-sm-4 text">
										${map.modified_date} 
									</div>
								</div>
					
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">최근접속일</label>
									<div class="col-sm-4 text">
										${map.recent_visit}
									</div>
								</div>

								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">접속아이피</label>
									<div class="col-sm-10 text">
										 ${map.ipAdd}
									</div>
								</div>
						
								<hr>

							</div>
						</div>	
					
						<div class="footer">	
							<div class="btn-group">		
								<button type="button" id="btn_list" class="btn btn-warning" onclick="javascript:fn_back();return false;"><i class="fa fa-list"></i> 리스트</button>	
							</div>			
							<div class="btn-group">		
								<button type="button" id="btn_delete" class="btn btn-danger" onclick="javascript:deleteFrm();"><i class="fa fa-times"></i>삭제</button>	
							</div>			
													
							<div class="pull-right">		
								<div class="btn-group pull-right">		
									<button type="button" id="btn_insert" class="btn btn-primary" onclick="javascript:insertFrm();"><i class="fa fa-floppy-o"></i> 저장</button>		
								</div>		
							</div>			
						</div>  		
                       </form>
                       
                       
                    </div>
                </div><!-- /row -->
            </div><!-- /Page Body -->

            <footer class="text-center mb20">Copyright © WareHouse Management System. All Rights Reserved.</footer>
        </div><!-- /Page Content -->
    </div><!-- /Page Container -->
</div><!-- Main Container -->


<%@ include file ="/WEB-INF/views/include/include_footer.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_foot.jsp" %>

<form id="frmSearch" method="post" action="/sample/list_account.do">
	<input type="hidden" id="search_dt" name="search_dt" value="${commandMap.search_dt}" />	
	<input type="hidden" id="search_s_dt" name="search_s_dt" value="${commandMap.search_s_dt}" />   
	<input type="hidden" id="search_e_dt" name="search_e_dt" value="${commandMap.search_e_dt}" />   
	<input type="hidden" id="search_s_dt_simp" name="search_s_dt_simp" value="${commandMap.search_s_dt_simp}" />   
	<input type="hidden" id="search_e_dt_simp" name="search_e_dt_simp" value="${commandMap.search_e_dt_simp}" />   
	
	<input type="hidden" id="search_detail" name="search_detail" value="${commandMap.search_detail}" /> 		   	  
	<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${commandMap.search_detail_txt}" />
	<input type="hidden" id="pageNo" name="pageNo" value="${commandMap.pageNo}" />
</form>


<script type="text/javascript">
$(document).ready(function(){
	vali(mail_arr);
});


$("#ci_explain1").removeAttr("disabled");
		
var position = "${map.position}"
$("#position").val(position);

var text_string = ["id", "passwd", "name", "position"];
var return_message = ["아이디를","패스워드를","이름을","소속을"]


var id_chk_cnt=0;
if( "${map.id}" != null && "${map.id}" !="" ) {
			
    id_chk_cnt=1;
   	$('#id').attr("disabled","disabled"); //id 비활성화 
   	$('#id_check').hide(); //id 비활성화 
   	
}
	

//목록
function fn_back(){
	if( "${map.id}" != null && "${map.id}" !="" ) {
		var comSubmit = new ComSubmit("frmSearch");
	    comSubmit.setUrl("<c:url value='/sys/list_account.do' />");
	    comSubmit.submit();
	} else {
		var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/sys/list_account.do' />");
	    comSubmit.submit();
	}
}   

//저장하기
function insertFrm() {
	
	var empty_chk = "";
	var text = "";
	var fail ="";
	
	text_string.some(function(e,i) {
		empty_chk = $("#"+e+"").val();
		empty_chk = empty_chk.replace(/(^\s*)|(^\s$)/g, ""); // 공백제거
		
		if(empty_chk == ""){
		//	text = $("#"+e+"").closest("label").text();
			fail = "rr"
			alert(return_message[i] +" 기입해 주세요.");
			return (empty_chk == "");
		}
	});  
	
	if(mail_arr.retunVal ===  false ){
		alert("비밀번호를 맞게 기입했는지 확인 해주세요.");
		return;
	}
		
	if (id_chk_cnt == 0){
		alert("아이디 중복확인을 확인 해주세요.");
		return;
	}  
	
	
	
	if( (fail != "rr") ){
		
		var comSubmit = new ComSubmit("insert_sbmit");
	       comSubmit.setUrl("<c:url value='/sys/updateInsert_account.do' />");
	    //   comSubmit.addParam("number", "test");
	       comSubmit.submit();
	}
}

//삭제하기
function deleteFrm() {
	
	var number = $("#number").val();
	
	var comSubmit = new ComSubmit();
       comSubmit.setUrl("<c:url value='/sys/delete_account.do' />");
       comSubmit.addParam("number", number);
       comSubmit.submit();
}


//text박스에 아이디 입력 중복확인 초기화 
$("#id").on("keyup paste", function(){
	 $("#id_check_message").text("");
	 id_chk_cnt=0;
});



////////

var passwd = $('#passwd')
var re_mail =/^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{6,20}$/ ; // 이메일 검사식

var blank =   /\s/; 
var english = /[a-z]/;
var specialCharacters = /[!@#$%^~*+=-]/;
var number = /[0-9]/;
var regexp =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*/g;

var eventVal =  function (arr) {

	arr.idVal.keyup( function(){  vali(arr)} );  //$("#id").keyup 이벤트 발생 -> vali 함수 실행 -> 배열에 리턴값 저장
	arr.idVal.focus( function(){  vali(arr)} ); 
	arr.idVal.blur( function(){  vali(arr)} ); 
	 
}


$("#passwd").keydown( function() {
	if(event.keyCode==109 || event.keyCode==189) {
		$("#passwd").replace(" ","");
	}
});

var arrayTest = ["english_vail" ,"specialCharacters_vail" ,"number_vail" ,"length_vail" ];
var arrayTest2 = [0,0,0,0];

var vali = function (arr) {
	  var regexp =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*/gi;
	$("#passwd").val(arr.idVal.val().replace(/ /gi, "")); 
	$("#passwd").val(arr.idVal.val().replace(regexp, "")); 


	$("#english_vail").attr('style' ,'color: black ;'); 
	$("#specialCharacters_vail").attr('style' ,'color: black ;');
	$("#number_vail").attr('style' ,'color: black ;');
	$("#length_vail").attr('style' ,'color: black ;'); 
	
	if(arr.re.test(arr.idVal.val()) !== true ){
		
		arr.retunVal = false;	
		
		  
		
		if(english.test($("#passwd").val())){
			$("#english_vail").attr('style' ,'color: green ;');			 
		}
		
		if(specialCharacters.test($("#passwd").val())){
			$("#specialCharacters_vail").attr('style' ,'color: green ;'); 
		}
		
		if(number.test($("#passwd").val())){
			$("#number_vail").attr('style' ,'color: green ;'); 
		}
			
		if($("#passwd").val().length > 8 ){
			$("#length_vail").attr('style' ,'color: green ;'); 
		}
		
	}else{

		$("#english_vail").attr('style' ,'color: green;'); 
		$("#specialCharacters_vail").attr('style' ,'color: green ;');
		$("#number_vail").attr('style' ,'color: green ;');
		$("#length_vail").attr('style' ,'color: green ;'); 
		arr.retunVal = true;
	}
	
}

var mail_arr = { idVal:passwd, retunVal:false, re:re_mail };
eventVal(mail_arr)



	/*
	mail_arr.returnValue = function () {
			if ( this.retunVal === false  ) {
				this.idVal.attr( 'style' ,'border: 2px solid #ff0000;'); 
				$("#passwd_check_message").text("패스워드 조건이 맞지 않습니다.");
				testtt = false
			}
		};
		
		if (testtt === false){
			testtt = "" //false 값 초기화 
		}else{
			alert("succes");
		}
	
	*/


///////



//  id 중복확인
function ajax_id_check() {
	var id = $("#id").val();

	$.ajax({
		url:"/SampleNotice/sys/id_check_account.do",
		type:"post",
		data:"id="+id,
		datatype:"json",
		//cache : false,
		timeout:1000,
		error:function(){
			//alert("error");
		},
		success:function(json){
			var str = "";
			var id_check_message = $("#id_check_message");
			id_check_message.empty();
		
			if (json.map.return_id != 'null') {
				id_check_message.append("중복된 아이디입니다. 다시 변경해 주세요");
				id_chk_cnt = 0;
			}else{
				id_check_message.append("<i class='fa fa-circle-o'></i>  사용 가능한 아이디 입니다.");
				id_chk_cnt = 1;
			}	
		}
	})
};

$("#id_check").onclick = function() {
	 ajax_id_check(); 
};

</script>

	
