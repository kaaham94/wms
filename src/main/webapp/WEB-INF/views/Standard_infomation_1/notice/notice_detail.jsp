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
									<label class="col-sm-2 control-label no-padding-right">회사명</label>
									 <div class="col-sm-4">
                                        <input type="text" class="form-control" id="company" name="company" value="${map.company}">
                                    </div>
                                </div>    


								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">이름</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="name" name="name" value="${map.name} ">
									</div>
								</div>
								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">전화번호</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${map.phoneNumber} " >
									</div>
								</div>
								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">이메일</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="email" name="email" value="${map.email} " >
									</div>
								</div>
								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">분야</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="category" name="category" value="${map.category} " >
									</div>
								</div>

								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">제목</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="title" name="title" value="${map.title} " >
									</div>
								</div>
					
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">내용</label>
									<div class="col-sm-10 text remaining">
<textarea id="content"  name="content" class="autosize-transition form-control textarea-autosize" style="height:250px;" >
 ${map.content}
</textarea>
										<div style="text-align:right; font-size:20px; font-weight:bold"><span style="color:red" class="count">25</span> / <span class="maxcount">900</span>Byte</div>					
									</div>
								</div>
								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">등록일</label>
									<div class="col-sm-10 text">
										 ${map.date}
									</div>
								</div>
								
								<hr>

								
								<div class="form-group sub"> 
									<label class="col-sm-2 control-label no-padding-right">메모</label>
									<div class="col-sm-10 text">
<textarea id="memo" name="memo" class="autosize-transition form-control textarea-autosize" style="height:150px;">
 ${map.memo}
</textarea>
									</div>
								</div>

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

<form id="frmSearch" method="post" action="/sample/list_event.do">
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
//byte수 벨리데이션 체크
$(function () {
    $('.remaining').each( function () {
        // count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
        var $maxcount = $('.maxcount', this);
        var $count = $('.count', this);
        var $input = $("#content", this);

        // .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
        var maximumByte = $maxcount.text() * 1;
        // update 함수는 keyup, paste, input 이벤트에서 호출한다.
        var update = function () {
            var before = $count.text() * 1;
            var str_len = $input.val().length;
            var cbyte = 0;
            var li_len = 0;
            
            for (i = 0; i < str_len; i++) {
                var ls_one_char = $input.val().charAt(i);
                if (escape(ls_one_char).length > 4) {
                    cbyte += 2; //한글이면 2를 더한다
                } else {
                    cbyte++; //한글아니면 1을 다한다
                }
                if (cbyte <= maximumByte) {
                    li_len = i + 1;
                }
            }
            // 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
            if (parseInt(cbyte) > parseInt(maximumByte)) {
                 alert('허용된 글자수가 초과되었습니다.\r\n초과된 부분은 자동으로 삭제됩니다.');
                var str = $input.val();
                var str2 = $input.val().substr(0, li_len);
                $input.val(str2);
                var cbyte = 0;
                for (i = 0; i < $input.val().length; i++) {
                    var ls_one_char = $input.val().charAt(i);
                    if (escape(ls_one_char).length > 4) {
                        cbyte += 2; //한글이면 2를 더한다
                    } else {
                        cbyte++; //한글아니면 1을 다한다
                    }
                }
            }
            $count.text(cbyte);
        };
        // input, keyup, paste 이벤트와 update 함수를 바인드한다
        $input.bind('input keyup keydown paste change', function () {
            setTimeout(update, 0)
        });
        update();
    });
});
</script>

<script type="text/javascript">

$("#ci_explain1").removeAttr("disabled");

var text_string = ["company", "name", "phoneNumber", "email", "category", "title", "content"];
var return_message = ["을","을","를","을","를","을","을"]


//목록
function fn_back(){

	var comSubmit = new ComSubmit("frmSearch");
    comSubmit.setUrl("<c:url value='/sys/list_SysMember.do' />");
    comSubmit.submit();
}	        

//저장하기
function insertFrm() {
	
	var empty_chk = "";
	var label_text = "";
	var fail ="";
	
	text_string.some(function(e,i) { 							// e:해당 배열 값(=id명), i:회전되는 숫자   

		empty_chk = $("#"+e+"").val(); 							// id값을 가져오는 부분 
		empty_chk = empty_chk.replace(/(^\s*)|(^\s$)/g, "");	// id값 공백제거
		
		label_text = $("#"+e+"").closest("div").prev().text(); 	// id명으로 label text 가져오기  
		
		if(empty_chk == ""){ 									// id값이 공백일떄 
			fail = "Y" 		 		
			alert(label_text + return_message[i] +" 기입해 주세요.");
			return (empty_chk == ""); 							// id값  변수 초기화 
		}
	});  
	
	if(fail != "Y"){ 											// fail이 Y가 아니면 -> 저장 
		var comSubmit = new ComSubmit("insert_sbmit");
	       comSubmit.setUrl("<c:url value='/sys/updateInsert_SysMember.do' />");
	       comSubmit.submit();
	}
}

//삭제하기
function deleteFrm() {
	
	var number = $("#number").val();
	
	var comSubmit = new ComSubmit();
       comSubmit.setUrl("<c:url value='/sys/delete_SysMember.do' />");
       comSubmit.addParam("number", number);
       comSubmit.submit();
}

</script>




