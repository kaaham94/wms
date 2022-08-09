<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 기준정보 - 코드관리  -->   
<%@ include file ="/WEB-INF/views/include/include_tap.jsp" %>

            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					
					
						<div class="search_box">
                            <div class="search_box_sub">  
                            <form name='search' id='search'>
                            	<input type="hidden" id="MANDT" name="MANDT" value="100" />
                           		<div class="col-sm-2">   
									<label class="control-label text-align-left">Filter</label>
									<div>
										<label style="padding-right:20px;">
											<input name="filter" id="filter_codeType" type="radio" value="codeType" >
											<span class="text">코드종류</span>
										</label>
									</div>
									<div>
										<label style="padding-right:20px;">
											<input name="filter" id="filter_code" type="radio" value="code" >
											<span class="text">코드</span>
										</label>
									</div>
								</div>	
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">코드종류</span>
										</span>

										<select id="CODEGRP" name="CODEGRP" class="form-control" style="">
												<option value=""></option>
												<option value="AUTH">[AUTH] 최고 권한</option>
												<option value="BARTYPE">[BARTYPE] 바코드 타입 구분</option>
												<option value="BKTXT">[BKTXT] 보류상태변경사유</option>
												<option value="BSART">[BSART] 입고유형</option>
												<option value="CARNO">[CARNO] 배차차량번호</option>
												<option value="DATETYPE">[DATETYPE] 일자타입</option>
												<option value="DEPT">[DEPT] 부서</option>
												<option value="FIFO">[FIFO] 선입선출 구분</option>
												<option value="JKCOD">[JKCOD] 직급</option>
												<option value="LFART">[LFART] 출고유형</option>
												<option value="LOCST">[LOCST] 로케이션상태</option>
												<option value="LOCSTBAR">[LOCSTBAR] 빈관리바코드상태</option>
												<option value="M100">[M100] 품목유형</option>
												<option value="MSFLAG">[MSFLAG] 소분/병합구분</option>
												<option value="PRTDEMON">[PRTDEMON] 바코드 출력 데몬타입</option>
												<option value="PRTMODEL">[PRTMODEL] 프린터 모델</option>
												<option value="QKTXT">[QKTXT] 품질상태변경사유</option>
												<option value="RACKTYPE">[RACKTYPE] RACK 종류</option>
												<option value="SHGBN">[SHGBN] 배송방법</option>
												<option value="SHGBNIN">[SHGBNIN] 입고배송방법</option>
												<option value="STCSTATUS">[STCSTATUS] 재고실사상태</option>
												<option value="STOCK">[STOCK] 재고유형</option>
												<option value="WH">[WH] 창고</option>
												<option value="WKCOD">[WKCOD] 작업자구분</option>
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">코드</span>
										</span>
										<input type="text" id="CODE" name="CODE" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>
								
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">사용유무</span>
										</span>
										<select id="USEFLAG" name="USEFLAG" class="form-control" style="">
											<option value="Y">[Y] YES</option>
											<option value="N">[N] NO</option>
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">코드명(Kor.)</span>
										</span>
										<input type="text" id="CODENAME" name="CODENAME" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>					
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:60px;">정렬</span>
										</span>
										<select id="orderby" name="orderby" class="form-control" style="">
											<option value="CODEGRP">코드종류</option>
											<option value="DATE">수정일</option>
										</select>
									</div>
								</div>
								
								<div class="col-sm-2">
                                    <button type="button" id="searchButton"  style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search" onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
                                </div>
                            </form>
                            </div>
                        </div>
<style>
.table.table-bordered th { top: -1px; }
.tableFixHead          { overflow-x: hidden; overflow-y: auto; height: 540px; }
.tableFixHead thead th { position: sticky; top: 0; }

input[type=checkbox] { width: 5px; height: 1px; position: static;}
input[type=checkbox] + .text { position: static;}

</style>
						
                        
						<div class="widget ">  
							<div class="widget-header">
								<div class="widget-buttons" style="display: block">
									<div class="pull-left">
									    <a class="btn btn-default" id="adder"><i class="fa fa-plus"></i>신규  </a>
									    <!--a class="btn btn-primary" id="btn-delete-row"><i class="fa fa-plus"></i> 삭제 하기 </a -->
									    <a class="btn btn-warning" id="res"><i class="fa fa-floppy-o"></i> 신규저장 </a>
									    <a class="btn btn-primary" id="updateButton"><i class="fa fa-pencil " aria-hidden="true"></i> 수정 </a>
										<button type="button" id="deleteButton" class="btn btn-danger"><i class="fa fa-times"></i>삭제</button>
									</div>            
									<div class="pull-right">	
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
									</div>
								</div>
	                        </div>
                            <div id="scroll" class="table-responsive tableFixHead">
                                <table id="mytable" class="table table-bordered table-striped table-condensed ">
                                    <colgroup>
                                        <col style="width: 50px;">
                                        <col style="width:25%;">
                                        <col style="width:10%;">
                                        <col style="width:20%;">
                                        <col>
                                        <col style="width:7%;">
                                        <col style="width:10%;">
                                        <col style="width:10%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                        	<th><label><input type='checkbox' id='chkAll'/><span class='text'></span></label></th>
                                            <th>코드종류</th>
                                            <th>코드</th>
                                            <th>코드명(Kor.)</th>
                                            <th>비고</th>
                                            <th>사용여부</th>
                                            <th>수정자</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody> 
								          
                                    </tbody>
                                </table>
                            </div>
                    	</div>
                </div><!-- /row -->
            </div><!-- /Page Body -->
            
                <div class="bottom_t">
					<div class="dataTables_length">
						<label id="TOTAL_COUNT"></label>
					</div>
				</div>
				
            <footer class="text-center mb20">Copyright © WareHouse Management System. All Rights Reserved.</footer>
        </div><!-- /Page Content -->
    </div><!-- /Page Container -->
</div><!-- Main Container -->



<%@ include file ="/WEB-INF/views/include/include_footer.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_foot.jsp" %>

	<form id="frmDownloadExcel" method="post" action="/sample/openExcel_down.do">
		<input type="hidden" id="pageStart" name="pageStart" value="${map.START}" />				
		<input type="hidden" id="pageEnd" name="pageEnd" value="${map.END}" />						
		
		<input type="hidden" id="search_date" name="search_date" value="${map.search_date}" />	
		<input type="hidden" id="search_date_start" name="search_date_start" value="${map.search_date_start}" />   
		<input type="hidden" id="search_date_end" name="search_date_end" value="${map.search_date_end}" />   
		
		<input type="hidden" id="search_detail" name="search_detail" value="${map.search_detail}" /> 		   	  
		<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${map.search_detail_txt}" />
		
		<input type="hidden" id="param" name="param" value="" />
	</form>

	<form id="frmDownloadExcel" method="post" action="/sample/openExcel_down.do">
	
		<input type="hidden" id="pageStart" name="pageStart" value="${map.START}" />				
		<input type="hidden" id="pageEnd" name="pageEnd" value="${map.END}" />						
		
		<input type="hidden" id="search_date" name="search_date" value="${map.search_date}" />	
		<input type="hidden" id="search_date_start" name="search_date_start" value="${map.search_date_start}" />   
		<input type="hidden" id="search_date_end" name="search_date_end" value="${map.search_date_end}" />   
		
		<input type="hidden" id="search_detail" name="search_detail" value="${map.search_detail}" /> 		   	  
		<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${map.search_detail_txt}" />
		
		<input type="hidden" id="param" name="param" value="" />
	</form>


<script type="text/javascript">

//코드종류 Select
var Search_CODEGRP =  new Array();
var Search_CODEGRP_list = "";

function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/code_01/code_01_list_test.do',
		type: "post",
		dataType : 'json',
		data: params,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){ 

			$("#chkAll").prop("checked", false); //전체체크 해제	
			$('#mytable tbody').html('');
			$("#TOTAL_COUNT").html('');
			$('#CODEGRP').html('');	
			
			var select_list ="";
			var TOTAL_COUNT = "";
			Search_CODEGRP_list = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}	
		
			//코드종류 Select
			Search_CODEGRP = data['Search_CODEGRP'];
			for(var j = 0 ; j < Search_CODEGRP.length; j ++ ){
				Search_CODEGRP_list += "<option value="+Search_CODEGRP[j].CODEGRP+">"+Search_CODEGRP[j].CODETYPE+"</option>";
			}
			
			if(data['map'].filter == "codeType"){ //필터 코드종류 체크 
		
				for(var i = 0 ; i < data['list'].length ; i ++ ){
					select_list += "<tr name='defaultTd'>"+
							        "	<td class='text-align-center'>"+
							        "		<label>"+
							        "			<input type='checkbox' name='chk[]' value='' onclick='check(this)'><span class='text'></span>"+
							        "		</label>"+
							        "    </td>"+
							        "    <td class='text-align-left'>"+ data['list'][i].CODEGRP +"</td>"+
							        "    <td class='text-align-left'>"+ data['list'][i].CODENAME +"</td>"+
							        "    <td class='text-align-left'>"+ data['list'][i].ETC +"</td>"+
							        "    <td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+
							        "    <td class='text-align-center'>"+ data['list'][i].UPDUSER +"</td>"+
							        "    <td class='text-align-center'>"+ data['list'][i].DATE +"</td>"+
						        	"</tr>";
				}				

			}else{ //필터 코드 체크 
		
				for(var i = 0 ; i < data['list'].length ; i ++ ){

					select_list += "<tr name='defaultTd'>"+
							        "	<td class='text-align-center'>"+
							        "		<label>"+
							        "			<input type='checkbox' name='chk[]' value='' onclick='check(this)'><span class='text'></span>"+
							        "		</label>"+
							        "    </td>"+
							        "    <td value='"+data['list'][i].hidden_CODEGRP+"'  class='text-align-left'>"+ data['list'][i].CODEGRP +"</td>"+
							        "    <td class='text-align-left'>"+ data['list'][i].CODE +"</td>"+
							        "    <td class='text-align-left'>"+ data['list'][i].CODENAME +"</td>"+
							        "    <td class='text-align-left'>"+ data['list'][i].ETC +"</td>"+
							        "    <td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+
							        "    <td class='text-align-center'>"+ data['list'][i].UPDUSER +"</td>"+
							        "    <td class='text-align-center'>"+ data['list'][i].DATE +"</td>"+
						        	"</tr>";
				}
			}
			
			$('#mytable tbody').append(select_list);		
			$('#CODEGRP').append(Search_CODEGRP_list);	
			$("#TOTAL_COUNT").append("전체 "+TOTAL_COUNT+"개");
			
			$("input:radio[name='filter']:radio[value='"+data['map'].filter+"']").prop('checked', true); // 선택하기
			$("#CODEGRP").val(data['map'].CODEGRP ); 	//코드종류
			$("#USEFLAG").val(data['map'].USEFLAG ); 	//사용유무
			$("#CODE").val(data['map'].CODE ); 	   	 	//코드
			$("#CODENAME").val(data['map'].CODENAME );  //코드명
			
			//스크롤 영역 
		    var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	$('html, #scroll').animate({//스크롤 위치 이동
			    scrollTop: scrollMove.top
			}, 0);
		 
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}

//행  CODEGRP Select 변환 함수
var appendSelect_CODEGRP = function(val, color) {
	
	var td = val; 
	var td_texter = td.innerHTML; //td text값
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.innerHTML = ""; //공백값 변환 
	
	//Select 객체 생성 
	var selectObj = document.createElement('SELECT');
	selectObj.setAttribute("type", "text");
	selectObj.setAttribute("value", td_texter); //객체 자식노드값 추가 
	selectObj.setAttribute("style",  "width:100%"); //객체 style 속성 추가
	
	var OPT = new Array();  	//select option 객체
	var cnt;
	
	for(var i = 0 ; i < Search_CODEGRP.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Search_CODEGRP[i].CODEGRP);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Search_CODEGRP[i].CODETYPE ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Search_CODEGRP[i].CODETYPE){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}


//체크박스 전체 선택 
$("#chkAll").on("click", function() {
	
	var size = document.getElementsByName("chk[]").length; //총 row 수를 구한다.
	var chkAll = $(this).is(":checked");
	
	if (chkAll){	
		$("tbody input:checkbox").prop("checked", true);		
		//$("tbody input:checkbox").parent().parent().css("background-color", "gold");
	
	}else{
		$("tbody input:checkbox").prop("checked", false);
		//$("tbody input:checkbox").parent().parent().css("background-color", "");
	}

	//1. 체크박스 전체 체크
	if (chkAll){

	 	//2.1 (검색)Filter 코드종류 
		if($('#filter_codeType').is(':checked')){ //Filter 코드종류 체크시, 
			
			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
				var td0 = td.nextElementSibling; //코드종류 
				var td1 = td0.nextElementSibling; //코드명*(Kor)
				var td2 = td1.nextElementSibling; //비고
				var td3 = td2.nextElementSibling; //사용여부 
				
				var mail_arr = 	[{  yesCheck: appendInput, column: td0}, //코드종류
								{  yesCheck: appendInput,  column: td1}, //코드명*(Kor)
								{  yesCheck: appendInput,  column: td2}, //비고
								{  yesCheck: appendSelect, column: td3}]; //사용여부
				
				//4. input 태그 여부 확인
				inputValue = td3.childNodes[0].value; 
				if(inputValue === undefined ) {
	
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							td.style.backgroundColor = "gold";
							mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
						}
						
					//5.2 기존 행 
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
		        		//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
						mail_arr.splice(0, 1); //(코드종류 삭제)
						
		        		for (var prop in mail_arr) {
		        			td.style.backgroundColor = "#3fc21f";
		        			mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
						}
					}
				}
				
			}//3. 모든 row for문 체크 끝 
			
			
		//2.1 (검색)Filter 코드
		}else if($('#filter_code').is(':checked')){	 
			
			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){										
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode; 
				var td0 = td.nextElementSibling; //코드종류 
				var td1 = td0.nextElementSibling; //코드
				var td2 = td1.nextElementSibling; //코드명*(Kor)
				var td3 = td2.nextElementSibling; //비고
				var td4 = td3.nextElementSibling; //사용여부 
				
				var mail_arr = 	[{  yesCheck: appendSelect_CODEGRP, column: td0}, //코드종류		 
								{  yesCheck: appendInput,  column: td1}, //코드
								{  yesCheck: appendInput,  column: td2}, //코드명*(Kor)
								{  yesCheck: appendInput,  column: td3}, //비고
								{  yesCheck: appendSelect, column: td4}]; //사용여부
				
				//4. input 태그 여부 확인
				inputValue = td4.childNodes[0].value;  
				if(inputValue === undefined ) {
	
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							td.style.backgroundColor = "gold";
							mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
						}
						
					//5.2 기존 행 
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
		        		//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
						mail_arr.splice(0, 1); //(코드종류 삭제							
						mail_arr.splice(0, 1); //(코드 삭제)
						
		        		for (var prop in mail_arr) {
		        			td.style.backgroundColor = "#3fc21f";
		        			mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
						}
					}
				
				}
				
			
			}//3. 모든 row for문 체크 끝
		}//(검색)Filter 코드종류 끝
	}else{ //1.2 전체체크 해제
	
		//2.1 (검색)Filter 코드종류 
		if($('#filter_codeType').is(':checked')){ //Filter 코드종류 체크시, 
			
			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
				var td0 = td.nextElementSibling; //코드종류 
				var td1 = td0.nextElementSibling; //코드명*(Kor)
				var td2 = td1.nextElementSibling; //비고
				var td3 = td2.nextElementSibling; //사용여부 
				
				var mail_arr = 	[{ noCheck: appendText, column: td0}, //코드종류 
								{  noCheck: appendText, column: td1}, //코드명*(Kor)
								{  noCheck: appendText, column: td2}, //비고
								{  noCheck: appendText, column: td3}];//사용여부 
				
				//4. input 태그 여부 확인
				inputValue = td1.childNodes[0].value; 
				if(inputValue !== undefined ) {
					td.style.backgroundColor = "";
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							mail_arr[prop].noCheck(mail_arr[prop].column);
						}
						
					//5.2 기존 행 	
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
		        		//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
						mail_arr.splice(0, 1); //(코드종류 삭제)
					
		        		for (var prop in mail_arr) {
							mail_arr[prop].noCheck(mail_arr[prop].column);
						}
					}
				}
			}//3. 모든 row for문 체크 끝 
			
		//2.1 (검색)Filter 코드
		}else if($('#filter_code').is(':checked')){	 
			
			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){										
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode; 
				var td0 = td.nextElementSibling; //코드종류 
				var td1 = td0.nextElementSibling; //코드
				var td2 = td1.nextElementSibling; //코드명*(Kor)
				var td3 = td2.nextElementSibling; //비고
				var td4 = td3.nextElementSibling; //사용여부 
				
				var mail_arr = 	[{  noCheck: appendSelectText, column: td0}, //코드종류		 
								{  noCheck: appendText,  column: td1}, //코드
								{  noCheck: appendText,  column: td2}, //코드명*(Kor)
								{  noCheck: appendText,  column: td3}, //비고
								{  noCheck: appendText, column: td4}]; //사용여부
				
				//4. input 태그 여부 확인
				inputValue = td4.childNodes[0].value; 
				if(inputValue !== undefined ) {
					td.style.backgroundColor = "";
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							mail_arr[prop].noCheck(mail_arr[prop].column);
						}
						
					//5.2 기존 행 
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
		        		//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
						mail_arr.splice(0, 1); //(코드종류 삭제							
						mail_arr.splice(0, 1); //(코드 삭제)
						
		        		for (var prop in mail_arr) {
							mail_arr[prop].noCheck(mail_arr[prop].column);
						}
					}
				}
				
			
			}//3. 모든 row for문 체크 끝
		}//(검색)Filter 코드종류 끝
	}
});	//체크박스 전체선택 끝
 	
 	
//체크박스 선택된 해당 열 선택    
function check(it) {
	
	//0. 공통작업- 체크박스 
	td = it.parentNode.parentNode;
	/*
	if (it.checked){
		td.style.backgroundColor = "gold";
	}else{
		td.style.backgroundColor = "";
	}
	*/
	//1.1 (검색)Filter 코드종류 
	if($('#filter_codeType').is(':checked')){ //Filter 코드종류 체크시, 
		
		td0 = td.nextElementSibling; //코드종류 
		td1 = td0.nextElementSibling; //코드명*(Kor)x
		td2 = td1.nextElementSibling; //비고
		td3 = td2.nextElementSibling; //사용여부 
		
		var mail_arr = 	[{  yesCheck: appendInput, noCheck: appendText, column: td0}, //코드종류 
						{  yesCheck: appendInput, noCheck: appendText, column: td1}, //코드명*(Kor)
						{  yesCheck: appendInput, noCheck: appendText, column: td2}, //비고
						{  yesCheck: appendSelect, noCheck: appendText, column: td3}]; //사용여부
	
		//2.1 추가된 행 
		if(td0.parentNode.attributes.name.value == "mytr"){
			
			//3.1 체크박스 체크
			if (it.checked){ 
				for (var prop in mail_arr) {
					td.style.backgroundColor = "gold";
					mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
				}

			//3.2 체크박스 해제	
			}else{
				for (var prop in mail_arr) {
					td.style.backgroundColor = "";
					mail_arr[prop].noCheck(mail_arr[prop].column);	
				}
			}	
			
		//2.2 기존 행
		}else if(td0.parentNode.attributes.name.value == "defaultTd"){
			
			//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
			mail_arr.splice(0, 1); //(코드종류 삭제)
			
			//3.1 체크박스 체크
			if (it.checked){ 
				for (var prop in mail_arr) {
					td.style.backgroundColor = "#3fc21f";
					mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
				}

			//3.2 체크박스 해제	
			}else{
				for (var prop in mail_arr) {
					td.style.backgroundColor = "";
					mail_arr[prop].noCheck(mail_arr[prop].column);	
				}
			}	
		}
	
	//1.2 (검색)Filter 코드  
	}if($('#filter_code').is(':checked')){ //Filter 코드종류 체크시,     
		
		td0 = td.nextElementSibling; //코드종류 							 
		td1 = td0.nextElementSibling; //코드
		td2 = td1.nextElementSibling; //코드명*(Kor)
		td3 = td2.nextElementSibling; //비고 
		td4 = td3.nextElementSibling; //사용여부
		
		var mail_arr = 	[{  yesCheck: appendSelect_CODEGRP, noCheck: appendSelectText, column: td0}, //코드종류   
						{  yesCheck: appendInput, noCheck: appendText, column: td1}, //코드
						{  yesCheck: appendInput, noCheck: appendText, column: td2}, //코드명*(Kor)
						{  yesCheck: appendInput, noCheck: appendText, column: td3}, //비고
						{  yesCheck: appendSelect, noCheck: appendText, column: td4}]; //사용여부
						
	
		//2.1 추가된 행 
		if(td0.parentNode.attributes.name.value == "mytr"){
			
			//3.1 체크박스 체크
			if (it.checked){ 
				for (var prop in mail_arr) {
					td.style.backgroundColor = "gold";
					mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
				}

			//3.2 체크박스 해제	
			}else{
				for (var prop in mail_arr) {
					td.style.backgroundColor = "";
					mail_arr[prop].noCheck(mail_arr[prop].column);	
				}
			}	
			
		//2.2 기존 행
		}else if(td0.parentNode.attributes.name.value == "defaultTd"){
			
			//배열 arr에 splice 메서드를 이용해 인덱스 0 부터 1개의 원소를 삭제
			mail_arr.splice(0, 1); //(코드종류 삭제)											
			mail_arr.splice(0, 1); //(코드명 삭제)
			
			//3.1 체크박스 체크
			if (it.checked){ 
				for (var prop in mail_arr) {
					td.style.backgroundColor = "#3fc21f";
					mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
				}

			//3.2 체크박스 해제	
			}else{
				for (var prop in mail_arr) {
					td.style.backgroundColor = "";
					mail_arr[prop].noCheck(mail_arr[prop].column);	
				}
			}	
		}
	}

}



//삭제하기
$("#deleteButton").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var insert_checked_length = $("tr[name='mytr'] td label input[name='chk[]']:checked").length //insert row 체크 수

	//삽입 행(insert) 체크 수 있을 떄.
 	if(0 < insert_checked_length ){ 
		alert("체크된 신규 행 이 있습니다. \n체크 해제 후 삭제 진행해 주세요.");
		save_chk = false;	
 		return;
 	}
 	
	//1.저장 진행여부 alert   
	if(confirm(  "삭제 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
		var filter = $("input:radio[name='filter']:checked").val(); 	//필터 체크여부
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];
		
		//1.1 (검색)filter 코드종류 일때,
		if(filter == "codeType"){
			
			var td0 = td.next();	//코드종류
			
			//3.각 행의 데이터 검증 for문 
			for(var i = 0; i<total_checked_length.size(); i++){
			
				if(save_chk == false){
					break;
				}
				
				//배열에 각 행의 데이터를 넣는다.
				insertArray.push({
					CODEGRP : trim(td0.eq(i).text()), 
					CODE 	: "$", 
			       	filter 	: filter
				});

			}//각 행의 데이터 검증 for문 끝
			
			//1. validation이  완전한 true 일 때, 저장 ajax 실행  
			if(save_chk == true){
				//ajax 시작 
				 $.ajax({
			 			url:"/WMS/Standard_infomation_1/code_01Delete_code.do",
			 			type:"post",
			 			data: {target:JSON.stringify(insertArray)},
			 			datatype:"json",
			 			//cache : false,
			 			timeout:1000,
			 			error:function(){
			 				alert("error");
			 			},
			 			success:function(json){
			 				//저장 후 메세지
			 				alert(json.message);
			 				
			 				//저장 성공했을 시 실행
			 				if(json.result == true){

			 				 	$('#orderby').val('DATE');
				 			  	$('#orderby').trigger('change');
				 				$('#searchButton').trigger('click');
				 				
				 				//스크롤 영역 
				 			    var scrollMove = {top:0, left:240}; //스크롤 맨 밑 위치 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				}
			 			}
			 	});//ajax 끝		   
			}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		//(검색)filter 코드종류 일때 끝	
		//1.2 (검색)filter 코드 일때,
		}else if(filter == "code"){
			
			var td0 = td.next();   //코드종류
			var td1 = td0.next();  //코드
			
			
			
			//3.각 행의 데이터 검증 for문 
			for(var i = 0; i<total_checked_length.size(); i++){
			
				if(save_chk == false){
					break;
				}
				
				//배열에 각 행의 데이터를 넣는다.
				insertArray.push({
					CODEGRP : trim(td0.eq(i).attr("value")), 
					CODE 	: trim(td1.eq(i).text()), 
			       	filter 	: filter
				});

			}//각 행의 데이터 검증 for문 끝
			
			//1. validation이  완전한 true 일 때, 저장 ajax 실행  
			if(save_chk == true){
				//ajax 시작 
				 $.ajax({
			 			url:"/WMS/Standard_infomation_1/code_01Delete_code.do",
			 			type:"post",
			 			data: {target:JSON.stringify(insertArray)},
			 			datatype:"json",
			 			//cache : false,
			 			timeout:1000,
			 			error:function(){
			 				alert("error");
			 			},
			 			success:function(json){
			 				//저장 후 메세지
			 				alert(json.message);
			 				
			 				//저장 성공했을 시 실행
			 				if(json.result == true){

			 				 	$('#orderby').val('DATE');
				 			  	$('#orderby').trigger('change');
				 				$('#searchButton').trigger('click');
				 				
				 				//스크롤 영역 
				 			    var scrollMove = {top:0, left:240}; //스크롤 맨 밑 위치 
				 			 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				}
			 			}
			 	});//ajax 끝		   
			}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 
			
		}//(검색)filter 코드 일때 끝	
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
})

	
//체크박스 행  추가하기(insert)  
$("#res").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var insert_checked_length = $("tr[name='mytr'] td label input[name='chk[]']:checked").length //insert row 체크 수
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	
	
	//수정 행(update) 체크 수 있을 떄.
 	if(0 < update_checked_length ){  
		alert("체크된 수정 행 이 있습니다. \n체크 해제 후 저장 진행해 주세요.");
		save_chk = false;	
 		return;
 	}
	
	//삽입 행(insert) 체크 수 없을 떄.
 	if(0 == insert_checked_length ){ 
		alert("체크한 행이 없습니다.");
		save_chk = false;	
 		return;
 	}
 	
	//1.저장 진행여부 alert   
	if(confirm(  "저장 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
		var filter = $("input:radio[name='filter']:checked").val(); 	//필터 체크여부
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];
		
		//1.1 (검색)filter 코드종류 일때,
		if(filter == "codeType"){
			
			var td0 = td.next(); //코드종류
			var td1 = td0.next();  //코드명 (Kor.)
			var td2 = td1.next();  //비고
			var td3 = td2.next();  //사용여부
			
			//3.각 행의 데이터 검증 for문 
			for(var i = 0; i<total_checked_length.size(); i++){
			
				if(save_chk == false){
					break;
				}
				
				//배열에 각 행의 데이터를 넣는다.
				insertArray.push({
					CODEGRP : trim(td0.eq(i).children().val()), 
					CODE 	: "$", 
					CODENAME: trim(td1.eq(i).children().val()),
			       	ETC 	: trim(td2.eq(i).children().val()), 
			       	USEFLAG : td3.eq(i).children().val(),
			       	UPDUSER : user,
			       	filter 	: filter
				});

				//공백 validation 체크 
				if(insertArray[i].CODEGRP == ""){
					alert("코드종류가 공백입니다.");
					save_chk = false;
					break;
				};
				
				if(insertArray[i].CODENAME == ""){
					alert("코드명이 공백입니다.");
					save_chk = false;
					break;
				};		
			}//각 행의 데이터 검증 for문 끝
			
			//1. validation이  완전한 true 일 때, 저장 ajax 실행  
			if(save_chk == true){
				//ajax 시작 
				 $.ajax({
			 			url:"/WMS/Standard_infomation_1/code_01Insert_codeType.do",
			 			type:"post",
			 			data: {target:JSON.stringify(insertArray)},
			 			datatype:"json",
			 			async: false,
			 			//cache : false,
			 			timeout:1000,
			 			error:function(){
			 				alert("error");
			 			},
			 			success:function(json){
			 				//저장 후 메세지
			 				alert(json.message);
			 				
			 				
			 				//저장 성공했을 시 실행
			 				if(json.result == true){

			 				 	$('#orderby').val('DATE');
				 			  	$('#orderby').trigger('change');
				 				
				 				$('#searchButton').trigger('click');
				 				
				 				//스크롤 영역 
				 			    var scrollMove = {top:0, left:240}; //스크롤 맨 밑 위치 
				 			 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				}
			 			}
			 	});//ajax 끝		   
			}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		//(검색)filter 코드종류 일때 끝	
		//1.2 (검색)filter 코드 일때,
		}else if(filter == "code"){
			
			var td0 = td.next();   //코드종류
			var td1 = td0.next();  //코드
			var td2 = td1.next();  //코드명 (Kor.)
			var td3 = td2.next();  //비고
			var td4 = td3.next();  //사용여부
			
			//3.각 행의 데이터 검증 for문 
			for(var i = 0; i<total_checked_length.size(); i++){
			
				if(save_chk == false){
					break;
				}
				
				//배열에 각 행의 데이터를 넣는다.
				insertArray.push({
					CODEGRP : trim(td0.eq(i).children().val()), 
					CODE 	: trim(td1.eq(i).children().val()), 
					CODENAME: trim(td2.eq(i).children().val()),
			       	ETC 	: trim(td3.eq(i).children().val()), 
			       	USEFLAG : td4.eq(i).children().val(),
			       	UPDUSER : user,
			       	filter 	: filter
				});

				//공백 validation 체크 
				if(insertArray[i].CODE == ""){
					alert("코드가 공백입니다.");
					save_chk = false;
					break;
				};
				
				if(insertArray[i].CODENAME == ""){
					alert("코드명이 공백입니다.");
					save_chk = false;
					break;
				};
			}//각 행의 데이터 검증 for문 끝
			
			//1. validation이  완전한 true 일 때, 저장 ajax 실행  
			if(save_chk == true){
				//ajax 시작 
				 $.ajax({
			 			url:"/WMS/Standard_infomation_1/code_01Insert_code.do",
			 			type:"post",
			 			data: {target:JSON.stringify(insertArray)},
			 			datatype:"json",
			 			//cache : false,
			 			timeout:1000,
			 			error:function(){
			 				alert("error");
			 			},
			 			success:function(json){
			 				//저장 후 메세지
			 				alert(json.message);
			 				
			 				//저장 성공했을 시 실행
			 				if(json.result == true){

			 				 	$('#orderby').val('DATE');
				 			  	$('#orderby').trigger('change');
				 				
				 				$('#searchButton').trigger('click');
				 				
				 				//스크롤 영역 
				 			    var scrollMove = {top:0, left:240}; //스크롤 맨 밑 위치 
				 			 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				}
			 			}
			 	});//ajax 끝		   
			}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 
			
		}//(검색)filter 코드 일때 끝
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝

}) ;

	
	
	
//체크박스 행 수정하기(update)  
$("#updateButton").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var insert_checked_length = $("tr[name='mytr'] td label input[name='chk[]']:checked").length //insert row 체크 수
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	
	
	//수정 행(update) 체크 수 있을 떄.
 	if(0 < insert_checked_length ){  
		alert("체크된 신규 행 이 있습니다. \n체크 해제 후 저장 진행해 주세요.");
		save_chk = false;	
 		return;
 	}
	
	//삽입 행(insert) 체크 수 없을 떄.
 	if(0 == update_checked_length ){ 
		alert("체크한 행이 없습니다.");
		save_chk = false;	
 		return;
 	}
 	
	//1.저장 진행여부 alert   
	if(confirm(  "수정 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
		var filter = $("input:radio[name='filter']:checked").val(); 	//필터 체크여부
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];
		
		//1.1 (검색)filter 코드종류 일때,
		if(filter == "codeType"){
			
			var td0 = td.next();	//코드종류
			var td1 = td0.next();  	//코드명(Kor.)
			var td2 = td1.next(); 	//비고
			var td3 = td2.next();  	//사용여부
			
			//3.각 행의 데이터 검증 for문 
			for(var i = 0; i<total_checked_length.size(); i++){
			
				if(save_chk == false){
					break;
				}
				
				//배열에 각 행의 데이터를 넣는다.
				insertArray.push({
					CODEGRP : trim(td0.eq(i).text()), 
					CODE 	: "$", 
					CODENAME: trim(td1.eq(i).children().val()),
			       	ETC 	: trim(td2.eq(i).children().val()), 
			       	USEFLAG : td3.eq(i).children().val(),
			       	UPDUSER : user,
			       	filter 	: filter
				});

				//공백 validation 체크 
				if(insertArray[i].CODENAME == ""){
					alert("코드명(Kor.)이 공백입니다.");
					save_chk = false;
					break;
				};
				
				
			}//각 행의 데이터 검증 for문 끝
			
			//1. validation이  완전한 true 일 때, 저장 ajax 실행  
			if(save_chk == true){
				//ajax 시작 
				 $.ajax({
			 			url:"/WMS/Standard_infomation_1/code_01Update_code.do",
			 			type:"post",
			 			data: {target:JSON.stringify(insertArray)},
			 			datatype:"json",
			 			//cache : false,
			 			timeout:1000,
			 			error:function(){
			 				alert("error");
			 			},
			 			success:function(json){
			 				//저장 후 메세지
			 				alert(json.message);
			 				
			 				//저장 성공했을 시 실행
			 				if(json.result == true){

			 				 	$('#orderby').val('DATE');
				 			  	$('#orderby').trigger('change');
				 				$('#searchButton').trigger('click');
				 				
				 				//스크롤 영역 
				 			    var scrollMove = {top:0, left:240}; //스크롤 맨 밑 위치 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				}
			 			}
			 	});//ajax 끝		   
			}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		//(검색)filter 코드종류 일때 끝	
		//1.2 (검색)filter 코드 일때,
		}else if(filter == "code"){
			
			var td0 = td.next();   //코드종류
			var td1 = td0.next();  //코드
			var td2 = td1.next();  //코드명 (Kor.)
			var td3 = td2.next();  //비고
			var td4 = td3.next();  //사용여부
			
			
			//3.각 행의 데이터 검증 for문 
			for(var i = 0; i<total_checked_length.size(); i++){
			
				if(save_chk == false){
					break;
				}
				
				//배열에 각 행의 데이터를 넣는다.
				insertArray.push({
					CODEGRP : trim(td0.eq(i).attr("value")), 
					CODE 	: trim(td1.eq(i).text()), 
					CODENAME: trim(td2.eq(i).children().val()),
			       	ETC 	: trim(td3.eq(i).children().val()), 
			       	USEFLAG : td4.eq(i).children().val(),
			       	UPDUSER : user,
			       	filter 	: filter
				});

				//공백 validation 체크 
				if(insertArray[i].CODENAME == ""){
					alert("코드명(Kor.)이 공백입니다.");
					save_chk = false;
					break;
				};
				
			}//각 행의 데이터 검증 for문 끝
			
			//1. validation이  완전한 true 일 때, 저장 ajax 실행  
			if(save_chk == true){
				//ajax 시작 
				 $.ajax({
			 			url:"/WMS/Standard_infomation_1/code_01Update_code.do",
			 			type:"post",
			 			data: {target:JSON.stringify(insertArray)},
			 			datatype:"json",
			 			//cache : false,
			 			timeout:1000,
			 			error:function(){
			 				alert("error");
			 			},
			 			success:function(json){
			 				//저장 후 메세지
			 				alert(json.message);
			 				
			 				//저장 성공했을 시 실행
			 				if(json.result == true){

			 				 	$('#orderby').val('DATE');
				 			  	$('#orderby').trigger('change');
				 				$('#searchButton').trigger('click');
				 				
				 				//스크롤 영역 
				 			    var scrollMove = {top:0, left:240}; //스크롤 맨 밑 위치 
				 			 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				}
			 			}
			 	});//ajax 끝		   
			}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 
			
		}//(검색)filter 코드 일때 끝
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
});

	
	
//글 추가 시 이벤트 발생
$('#adder').click(function() {
	var appendText = "";
	
	//코드종류 선택 시,
	if($('#filter_codeType').is(':checked')){
		appendText = "";
		appendText += '<td class="text-align-center" style="background-color: gold;">'+
					  	 '<input type="text" value="" style="width:100%; height:31px;">'+
					  '</td>'
	}
	
	//코드 선택 시,
	if($('#filter_code').is(':checked')){
		appendText = ""
		appendText +='<td class="text-align-left" style="background-color: gold;">'+
						'<select type="text" value="" >'+
							Search_CODEGRP_list+
			        	'</select>'+
					 '</td>'
		appendText += '<td class="text-align-center" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>';
	}

	$('#mytable > tbody:last').append(
		'<tr name="mytr">'+
			'<td class="text-align-center" style="background-color: gold;">'+
				'<label>'+
					'<input type="checkbox" name="chk[]" value="" onclick="check(this)"><span class="text"></span>'+
				'</label>'+
		    '</td>'+
			appendText+
			'<td class="text-align-center" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			'<td class="text-align-center" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;;"></td>'+
			'<td class="text-align-center" style="background-color: gold;">'+
				'<select type="text" value="Y" style="width:100%;">'+
					'<option value="Y" selected="selected">Y</option>'+
					'<option value="N">N</option>'+
				'</select>'+
			'</td>'+
			'<td class="text-align-center"></td>'+
			'<td class="text-align-left"></td>'+
		'</tr>'
	);

	
	//텍스트 컬럼 크기 적용 
	//$("tbody tr:last td:eq(1) input:text").prop('style', 'width:70px');
	//$("tbody tr:last td:eq(2) input:text").prop('style', 'width:120px');
	
	//체크박스 체크, 색 적용   
 	$("tbody input:checkbox:last").prop("checked", true);		
	$("tbody input:checkbox:last").parent().parent().css("background-color", "gold");
  
	
	//스크롤 영역 
	var totalScroll = $('#scroll').prop('scrollHeight'); //스크롤 전체 크기
    var scrollMove = {top:totalScroll, left:240}; //스크롤 맨 밑 위치 
 
  	$('html, #scroll').animate({//스크롤 위치 이동
	    scrollTop: scrollMove.top
	}, 10);

});

	
//글 삭제 시 이벤트 발생
 	$('#btn-delete-row').click(function() {
   	$('#mytable > tbody:last > tr:last').remove();
   	
   	var totalScroll = $('#scroll').prop('scrollHeight'); //스크롤 전체 크기
    var scrollMove = {top:totalScroll, left:240};
 
  	$('html, #scroll').animate({//Scroll된 Target 
	    scrollTop: scrollMove.top
	}, 10);
 	});
</script>



<script type="text/javascript">	

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	
	if(getParameterByName("MANDT") == ""){
		$('input:radio[name=filter]:input[value="code"]').attr("checked", true);
    }else{
    	get_query();
    }
	$('#searchButton').trigger('click');
	
});



//라디오 버튼 선택 시 이벤트 발생
$('[name="filter"]').change(function(){
	
	$("#chkAll").prop("checked", false); //전체체크 해제	
	$("#CODE").val("");
	$("#CODENAME").val("");
	
	var td_code = $("tbody input:checkbox").parent().parent().next().next(); //코드
	var thead_th_code = $("thead tr th").eq(2); //헤더
	var col_th_code = $("colgroup col").eq(2); //콜그룹
	var td0 = $("colgroup col").eq(1); //코드종류 열
	
	if($('#filter_codeType').is(':checked')){ //Filter 코드종류 체크시, 
		td0.prop('style', 'width:6%'); //열 사이즈 조정
		thead_th_code.hide(); 	//코드 헤더 숨기기
		td_code.hide(); 		//코드 열  숨기기 
		col_th_code.hide();		//콜그룹 숨기기 
		$('#mytable tbody').empty();  //데이터 없얘기 
		
		$('#CODE').parent().hide(); //(검색)코드 text 보이기
  		$('#CODENAME').parent().hide(); //(검색)코드명 text 보이기
		
	}else if ($('#filter_code').is(':checked')){ //Filter 코드 체크시,
		td0.prop('style', 'width:230px'); //열 사이즈 조정
		thead_th_code.show(); 	//코드 헤더 보이기 
		td_code.show(); 		//코드 열 보이기  
		col_th_code.show();		//콜그룹 보이기 
		$('#mytable tbody').empty();	//데이터 없얘기 
		
		$('#CODE').parent().show(); //(검색)코드 text 숨기기
		$('#CODENAME').parent().show();//(검색)코드명 text 숨기기
	}
	
});



// 엑셀 전체 다운로드 
function fn_excel_all_down() {
   
	var comSubmit = new ComSubmit("frmDownloadExcel");
	comSubmit.setUrl("<c:url value='/sys/excelDown_SysMember.do' />");
	$("#param").val("total");
	comSubmit.submit();
}

// 엑셀 현재 다운로드 
function fn_excel_now_down() {
    
	var comSubmit = new ComSubmit("frmDownloadExcel");
	comSubmit.setUrl("<c:url value='/sys/excelDown_SysMember.do' />");
	$("#param").val("");
	comSubmit.submit();
}

</script>


 
</html>