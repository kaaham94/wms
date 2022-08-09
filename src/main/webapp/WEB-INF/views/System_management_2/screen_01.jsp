<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 시스템 관리 - 화면 관리  -->   
<%@ include file ="/WEB-INF/views/include/include_tap.jsp" %>
        
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					
					
						<div class="search_box">
                            <div class="search_box_sub">  
                            <form name='search' id='search'>
                            	<input type="hidden" id="MANDT" name="MANDT" value="100" />
                            	<input type="hidden" id="language" name="language" value="KOREAN" />
								<div class="col-sm-3">                                   
								</div>					
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control " style="width:100px;">상위메뉴</span>
										</span>
										<select id="MENUID" name="MENUID" class="form-control" style="">
											<option value="">전체</option>
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">화면ID</span>
										</span>
										<input type="text" id="PROGID" name="PROGID" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>

								<div class="col-sm-2">   
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
											<span class="form-control" style="width:100px;">화면명</span>
										</span>
										<input type="text" id="PROGNAME" name="PROGNAME" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:60px;">정렬</span>
										</span>
										<select id="orderby" name="orderby" class="form-control" style="">
											<option value="SORTKEY">정렬순서</option>
											<option value="UPDATE">등록순</option>
										</select>
									</div>
									
								</div>
								
								<div class="col-sm-2">
									<div class=" table-responsive">
										<button type="button" id="searchButton" style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search"  onclick="javascript:frmScanSubmit('1');"><i class="fa fa-search"></i> Search</button>
									</div>
								</div>
								
                            </form>
                            </div>
                        </div>
<style>
.table.table-bordered th { top: -1px; }
.tableFixHead          { overflow-x: hidden; overflow-y: auto; height: 540px;    overflow:auto; width:100%; }
.tableFixHead thead  th{ position: sticky; top: 0; }

input[type=checkbox] { width: 5px; height: 1px; position: static;}
input[type=checkbox] + .text { position: static;}

td,th {
 
 /*  width: 300px;*/
  border: 1px solid #000;
  width: 100px;
}

table {
  table-layout: fixed;
  border-collapse:separate;
  border-spacing: 0px;
}

td:first-child, th:first-child {
  position:sticky;
  left:0;
  z-index:1;
  background-color:#f9f9f9;
}
th:first-child{z-index:2;}

td:nth-child(2), th:nth-child(2) {
  position:sticky;
  left:50px; /* 좌측 고정할 컬럼 width합 값  */
  z-index:1;
  background-color:#f9f9f9;
}
th:nth-child(2){z-index:2;}

td:nth-child(3), th:nth-child(3) {
  position:sticky;
  left:220px; /* 좌측 고정할 컬럼 width합 값  */
  z-index:1;
  background-color:#f9f9f9;
}
th:nth-child(3){z-index:2;}

td:nth-child(4), th:nth-child(4) {
  position:sticky;
  left:290px; /* 좌측 고정할 컬럼 width합 값  */
  z-index:1;
  background-color:#f9f9f9;
}
th:nth-child(4){z-index:2;}

input[type=checkbox]:disabled + .text:before { color: #606578; }

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
										<col style="width: 50px;"><!-- 선택 -->
										<col style="width: 170px;"><!-- 메뉴 -->
										<col style="width: 70px;"><!-- 순서 -->
										<col style="width: 80px;"><!-- 프로그램ID -->
										<col style="width: 150px;"><!-- 한국어명 -->
										<col style="width: 150px;"><!-- 영어명-->
										<col style="width: 150px;"><!-- 중국어명-->
										<col style="width: 90px;"><!-- 기타 -->
										<col style="width: 90px;"><!-- 형태 -->
										<col style="width: 50px;"><!-- 조회 -->
										<col style="width: 50px;"><!-- 신규 -->
										<col style="width: 50px;"><!-- 저장 -->
										<col style="width: 50px;"><!-- 삭제 -->
										<col style="width: 50px;"><!-- 엑셀 -->
										<col style="width: 70px;"><!-- 사용여부 -->
										<col style="width: 90px;"><!-- 개발자 -->
										<col style="width: 90px;"><!-- 개발일자 -->
										<col style="width: 90px;"><!-- 상태 -->
										<col style="width: 85px;"><!-- 수정자 -->
										<col style="width: 85px;"><!-- 수정일자 -->
									</colgroup>
                             		<thead>
										<tr>
											<th>선택</th>
											<th>메뉴</th>
											<th>순서</th>
											<th>프로그램ID</th>
											<th>한국어명</th>
											<th>영어명</th>
											<th>중국어명</th>
											<th>기타</th>
											<th>형태</th>
											<th>조회</th>
											<th>신규</th>
											<th>저장</th>
											<th>삭제</th>
											<th>엑셀</th>
											<th>사용여부</th>
											<th>개발자</th>
											<th>개발일자</th>
											<th>상태</th>
											<th>수정자</th>
											<th>수정일자</th>
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

<!-- ajax form 전송 라이브러리 -->
<script src="<c:url value='/js/jquery.form.js'/>" charset="utf-8"></script>

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
var Select_array_MENUNAME =  new Array(); 
var Select_list_MENUNAME = "";

var Select_array_FORM =  new Array(); 
var Select_list_FORM = "";


function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1); 
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/screen_01/screen_01Select.do',
		type: "post",
		dataType : 'json',
		async: false,
		data: params,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){ 

			$("#chkAll").prop("checked", false); //전체체크 해제	
			$('#mytable tbody').html('');
			$("#TOTAL_COUNT").html('');
			$('#MENUID').html('<option value="">전체</option>');
			
			var list ="";
			var TOTAL_COUNT = "";
			Select_list_MENUNAME = "";		
			Select_list_FORM = "";	
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			
			//코드종류 Select
			Select_array_MENUNAME = data['Select_MENUNAME'];
			Select_array_FORM = data['Select_FORM'];
	
			for(var j = 0 ; j < Select_array_MENUNAME.length; j ++ ){
				Select_list_MENUNAME += "<option value="+Select_array_MENUNAME[j].MENUID+">"+Select_array_MENUNAME[j].MENUNAME+"</option>";
			}
		
			for(var k = 0 ; k < Select_array_FORM.length; k ++ ){
				Select_list_FORM += "<option value="+Select_array_FORM[k].FORM+">"+Select_array_FORM[k].FORM+"</option>";
			}
			
			for(var i = 0 ; i < data['list'].length ; i ++ ){
			
				list += "<tr name='defaultTd'>"+
							"<td class='text-align-center' >"+
							"	<label>"+
							"		<input type='checkbox' name='chk[]' id='"+data['list'][i].PROGID+"' value='' onclick='check(this)'><span class='text'></span>"+
							"	</label>"+
							"</td>"+
							"<td class='text-align-left' value='"+data['list'][i].MENUID+"'>"+ data['list'][i].MENUNAME +"</td>"+ 	//메뉴
							"<td class='text-align-left'>"+ data['list'][i].SORTKEY +"</td>"+		//순서
							"<td class='text-align-left'>"+ data['list'][i].PROGID +"</td>"+	//프로그램ID
							"<td class='text-align-left'>"+ data['list'][i].KORPROGNAME +"</td>"+	//한국어명
							"<td class='text-align-left'>"+ data['list'][i].ENGPROGNAME +"</td>"+	//영어명
							"<td class='text-align-left'>"+ data['list'][i].CHIPROGNAME +"</td>"+	//중국어명
							"<td class='text-align-left'>"+ data['list'][i].ETC +"</td>"+	//기타
							"<td class='text-align-left'>"+ data['list'][i].PROGTYPE +"</td>"+	//형태
							
							
							//<!-- 조회 -->
							"<td class='text-align-center'>"+						
								"<label>"+	
									"<input disabled='true' type='checkbox' name='FINDFLAG' id='FINDFLAG' value='-1' >"+ //조회
									"<span class='text'></span>"+
								"</label>"+
							"</td>"+
							
							//<!-- 신규 -->
							"<td class='text-align-center'>"+						
								"<label>"+	
									"<input disabled='true' type='checkbox' name='NEWFLAG' id='NEWFLAG' value='-1' >"+ //신규
									"<span class='text'></span>"+
								"</label>"+
							"</td>"+
							
							//<!-- 저장 -->
							"<td class='text-align-center'>"+						
								"<label>"+	
									"<input disabled='true' type='checkbox' name='SAVEFLAG' id='SAVEFLAG' value='-1' >"+ //저장
									"<span class='text'></span>"+
								"</label>"+
							"</td>"+
							
							//<!-- 삭제 -->
							"<td class='text-align-center'>"+						
								"<label>"+	
									"<input disabled='true' type='checkbox' name='DELFLAG' id='DELFLAG' value='-1' >"+ //삭제
									"<span class='text'></span>"+
								"</label>"+
							"</td>"+
							
							//<!-- 엑셀 -->
							"<td class='text-align-center'>"+						
								"<label>"+	
									"<input disabled='true' type='checkbox' name='EXPFLAG' id='EXPFLAG' value='-1' >"+ //엑셀
									"<span class='text'></span>"+
								"</label>"+
							"</td>"+
							
							"<td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+			//사용여부
							"<td class='text-align-center'>"+ data['list'][i].PROGRAMMER_NAME +"</td>"+	//개발자
							"<td class='text-align-center'>"+ data['list'][i].PROGCREATEDATE +"</td>"+	//개발일자
							"<td class='text-align-center'>"+ data['list'][i].PROGSTATUSID +"</td>"+	//상태
							"<td class='text-align-center'>"+ data['list'][i].UPDUSER +"</td>"+			//수정자
							"<td class='text-align-center'>"+ data['list'][i].UPDDATE1 +"</td>"+		//수정일자
						"</tr>";
			}
			
			$('#mytable tbody').append(list);		
			$('#MENUID').append(Select_list_MENUNAME);
			
			for(var k = 0 ; k < data['list'].length; k++ ){
				
				if(data['list'][k].FINDFLAG == '-1'){ //조회 
					$("tr input:checkbox[id='FINDFLAG']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].NEWFLAG == '-1'){ //신규
					$("tr input:checkbox[id='NEWFLAG']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].SAVEFLAG == '-1'){ //저장
					$("tr input:checkbox[id='SAVEFLAG']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].DELFLAG == '-1'){ //삭제
					$("tr input:checkbox[id='DELFLAG']").eq(k).prop("checked", true);
				}

				if(data['list'][k].EXPFLAG == '-1'){ //엑셀
					$("tr input:checkbox[id='EXPFLAG']").eq(k).prop("checked", true);
				}
			}
			$("#MENUID").val(data['map'].MENUID );
			$("#TOTAL_COUNT").append("전체 "+TOTAL_COUNT+"개");
			
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

//행  Select 변환 함수
var appendSelect_array_MENUNAME = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_MENUNAME.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
	
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_MENUNAME[i].MENUID);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_MENUNAME[i].MENUNAME ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_MENUNAME[i].MENUNAME){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}
	
var appendSelect_array_FORM = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_FORM.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_FORM[i].FORM);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_FORM[i].FORM ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_FORM[i].FORM){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}
		

	
	
/*
//체크박스 전체 선택 
$("#chkAll").on("click", function() {
	
	var size = document.getElementsByName("chk[]").length; //총 row 수를 구한다.
	var chkAll = $(this).is(":checked");
	
	if (chkAll){	
		$("input[name='chk[]']").prop("checked", true);		
	}else{
		$("input[name='chk[]']").prop("checked", false);
	}

	//1. 체크박스 전체 체크
	if (chkAll){

			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
				
				var	td0 = td.nextElementSibling;  	//코드 
				var	td1 = td0.nextElementSibling; 	//거래처명
				var	td2 = td1.nextElementSibling; 	//거래처FULL명칭
				var	td3 = td2.nextElementSibling; 	//공급처
				var	td4 = td3.nextElementSibling; 	//납품처
				var	td5 = td4.nextElementSibling; 	//제조사
				var	td6 = td5.nextElementSibling; 	//품번 채번코드
				var	td7 = td6.nextElementSibling;	//바코드 채번코드
				var	td8 = td7.nextElementSibling;	//거래처 이니셜
				var	td9 = td8.nextElementSibling; 	//사업자번호
				var	td10 = td9.nextElementSibling; 	//담당자
				var	td11 = td10.nextElementSibling; //EMAIL
				var	td12 = td11.nextElementSibling; //전화1
				var	td13 = td12.nextElementSibling; //전화2
				var	td14 = td13.nextElementSibling; //팩스
				var	td15 = td14.nextElementSibling; //주소
				var	td16 = td15.nextElementSibling; //메모
				var	td17 = td16.nextElementSibling; //사용여부
				
				var mail_arr = 	[{ yesCheck: appendInput, 		column: td0},  //코드
								{  yesCheck: appendInput, 		column: td1},  //거래처명  
								{  yesCheck: appendInput, 		column: td2},  //거래처FULL명칭 
								{  yesCheck: appendCheckbox, 	column: td3},  //공급처 
								{  yesCheck: appendCheckbox, 	column: td4},  //납품처 
								{  yesCheck: appendCheckbox, 	column: td5},  //제조사 
								{  yesCheck: appendInput, 		column: td6},  //품번 채번코드  
								{  yesCheck: appendInput, 		column: td7},  //바코드 채번코드 
								{  yesCheck: appendInput, 		column: td8},  //거래처 이니셜 
								{  yesCheck: appendInput, 		column: td9},  //사업자번호 
								{  yesCheck: appendInput, 		column: td10},  //담당자 
								{  yesCheck: appendInput, 		column: td11},  //EMAIL 
								{  yesCheck: appendInput, 		column: td12},  //전화1 
								{  yesCheck: appendInput, 		column: td13},  //전화2 
								{  yesCheck: appendInput, 		column: td14},  //팩스
								{  yesCheck: appendInput, 		column: td15},  //주소
								{  yesCheck: appendInput, 		column: td16},  //메모
								{  yesCheck: appendSelect, 		column: td17}]; //사용여부 

				
				//4. input 태그 여부 확인
				inputValue = td17.childNodes[0].value; 
				if(inputValue === undefined ) {
	
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							td.style.backgroundColor = "gold";
							mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
						}
						
					//5.2 기존 행 
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
		        		//배열 azrr에 splice 메서드를 이용해 인덱스 1 부터 1개의 원소를 삭제
						mail_arr.splice(0, 1); //(코드 삭제)
						
		        		for (var prop in mail_arr) {
		        			td.style.backgroundColor = "#3fc21f";
		        			mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
						}
					}
				}
				
			}//3. 모든 row for문 체크 끝 
		
	}else{ //1.2 전체체크 해제
	
		//3. 모든 row for문 체크  
		for(var i = 0; i < size; i++){
		
			var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
			
			var	td0 = td.nextElementSibling;  	//코드 
			var	td1 = td0.nextElementSibling; 	//거래처명
			var	td2 = td1.nextElementSibling; 	//거래처FULL명칭
			var	td3 = td2.nextElementSibling; 	//공급처
			var	td4 = td3.nextElementSibling; 	//납품처
			var	td5 = td4.nextElementSibling; 	//제조사
			var	td6 = td5.nextElementSibling; 	//품번 채번코드
			var	td7 = td6.nextElementSibling;	//바코드 채번코드
			var	td8 = td7.nextElementSibling;	//거래처 이니셜
			var	td9 = td8.nextElementSibling; 	//사업자번호
			var	td10 = td9.nextElementSibling; 	//담당자
			var	td11 = td10.nextElementSibling; //EMAIL
			var	td12 = td11.nextElementSibling; //전화1
			var	td13 = td12.nextElementSibling; //전화2
			var	td14 = td13.nextElementSibling; //팩스
			var	td15 = td14.nextElementSibling; //주소
			var	td16 = td15.nextElementSibling; //메모
			var	td17 = td16.nextElementSibling; //사용여부
			
			var mail_arr = 	[{ 	noCheck: appendText,  		column: td0},  //코드
							{  	noCheck: appendText,  		column: td1},  //거래처명  
							{  	noCheck: appendText,  		column: td2},  //거래처FULL명칭 
							{  	noCheck: appendNoCheckbox,  column: td3},  //공급처 
							{  	noCheck: appendNoCheckbox,  column: td4},  //납품처 
							{  	noCheck: appendNoCheckbox,  column: td5},  //제조사 
							{  	noCheck: appendText,  		column: td6},  //품번 채번코드  
							{  	noCheck: appendText,  		column: td7},  //바코드 채번코드 
							{  	noCheck: appendText,  		column: td8},  //거래처 이니셜 
							{  	noCheck: appendText,  		column: td9},  //사업자번호 
							{  	noCheck: appendText,  		column: td10},  //담당자 
							{  	noCheck: appendText,  		column: td11},  //EMAIL 
							{  	noCheck: appendText,  		column: td12},  //전화1 
							{  	noCheck: appendText,  		column: td13},  //전화2 
							{  	noCheck: appendText,  		column: td14},  //팩스
							{  	noCheck: appendText,  		column: td15},  //주소
							{  	noCheck: appendText,  		column: td16},  //메모
							{  	noCheck: appendText,  		column: td17}]; //사용여부 
								
			//4. input 태그 여부 확인
			inputValue = td17.childNodes[0].value; 
			if(inputValue !== undefined ) {
				td.style.backgroundColor = "";
				//5.1 추가된 행
				if(td0.parentNode.attributes.name.value == "mytr"){

					for (var prop in mail_arr) {
						mail_arr[prop].noCheck(mail_arr[prop].column);
					}
					
				//5.2 기존 행 	
	        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
	        		
	        		//배열 arr에 splice 메서드를 이용해 인덱스 1 부터 1개의 원소를 삭제
					mail_arr.splice(0, 1); //(코드 삭제)
				
	        		for (var prop in mail_arr) {
						mail_arr[prop].noCheck(mail_arr[prop].column);
					}
				}
			}
		}//3. 모든 row for문 체크 끝 
	}
});	//체크박스 전체선택 끝
*/ 	



//체크박스 선택된 해당 열 선택    
function check(it) {
	
	td = it.parentNode.parentNode;	//선택
	
	td0 = td.nextElementSibling;  	//메뉴  		 --select 
	td1 = td0.nextElementSibling; 	//순서 			
	td2 = td1.nextElementSibling; 	//프로그램ID 
	td3 = td2.nextElementSibling; 	//한국어명 	 
	td4 = td3.nextElementSibling; 	//영어명
	td5 = td4.nextElementSibling; 	//중국어명
	td6 = td5.nextElementSibling; 	//기타 
	td7 = td6.nextElementSibling;	//형태		--select 
	td8 = td7.nextElementSibling;	//조회 		--checkbox
	td9 = td8.nextElementSibling; 	//신규 		--checkbox
	td10 = td9.nextElementSibling; 	//저장 		--checkbox
	td11 = td10.nextElementSibling; //삭제 		--checkbox
	td12 = td11.nextElementSibling; //엑셀 		--checkbox
	td13 = td12.nextElementSibling; //사용여부 	--Y or N select 
	td14 = td13.nextElementSibling; //개발자 
	td15 = td14.nextElementSibling; //개발일자 
	td16 = td15.nextElementSibling; //상태 
	td17 = td16.nextElementSibling; //수정자 
	td18 = td17.nextElementSibling; //수정일자 


	var mail_arr = 	[{ yesCheck: appendSelect_array_MENUNAME, 	noCheck: appendSelectText, 					column: td0}, //메뉴  	(select)
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td1}, //순서 			
					{  yesCheck: appendInput, 					noCheck: appendText , 						column: td2}, //프로그램ID 
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td3}, //한국어명 	 
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td4}, //영어명
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td5}, //중국어명
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td6}, //기타 
					{  yesCheck: appendSelect_array_FORM, 		noCheck: appendSelectText,  				column: td7}, //형태		(select) 
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  				column: td8}, //조회 	(checkbox)
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  				column: td9}, //신규 	(checkbox)
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  				column: td10},//저장 	(checkbox)
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  				column: td11},//삭제 	(checkbox)
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  				column: td12},//엑셀 	(checkbox)
					{  yesCheck: appendSelect, 					noCheck: appendText, 						column:	td13},//사용여부 	(Y or N select) 
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td14},//개발자 
					{  yesCheck: appendInput, 					noCheck: appendText,  						column: td15},//개발일자 
					{  yesCheck: appendInput, 					noCheck: appendText,					    column: td16}]//상태 
				 
				

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
		mail_arr.splice(0, 1); //(메뉴 삭제)
		mail_arr.splice(0, 1); //(순서 삭제)
		mail_arr.splice(0, 1); //(프로그램 삭제)
		
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





//글 추가 시 이벤트 발생
$('#adder').click(function() {

	$('#mytable > tbody:last').append(
	
		'<tr name="mytr">'+
			'<td class="text-align-center" style="background-color: gold;">'+
				'<label>'+
					'<input type="checkbox" name="chk[]" value="" onclick="check(this)"><span class="text"></span>'+
				'</label>'+
		    '</td>'+

			//메뉴   
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_MENUNAME+
				'</select>'+
			'</td>'+
				
			//순서
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//프로그램ID
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//한국어명
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//영어명
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//중국어명
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//기타
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//형태
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_FORM+
				'</select>'+
			'</td>'+
					
			//조회		
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+
						
			//신규		
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+

			//저장		
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+

			//삭제		
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+

			//엑셀		
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+


			//사용여부
			'<td class="text-align-center" style="background-color: gold;">'+
				'<select type="text" value="Y" style="width:100%;">'+
					'<option value="Y" selected="selected">Y</option>'+
					'<option value="N">N</option>'+
				'</select>'+
			'</td>'+
				
			//개발자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//개발일자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//상태
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//수정자		
			'<td class="text-align-center"></td>'+

			//수정일자	
			'<td class="text-align-center"></td>'+
		'</tr>'
	);
	
	//체크박스 체크, 색 적용   
 	$("tbody tr:last input:checkbox:eq(0)").prop("checked", true);		
	$("tbody tr:last input:checkbox:eq(0)").parent().parent().css("background-color", "gold");

	//스크롤 영역 
	var totalScroll = $('#scroll').prop('scrollHeight'); //스크롤 전체 크기
    var scrollMove = {top:totalScroll, left:240}; //스크롤 맨 밑 위치 
 
  	$('html, #scroll').animate({//스크롤 위치 이동
	    scrollTop: scrollMove.top
	}, 10);
});



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
	if(confirm("저장 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];

		var	td0 = td.next(); 		//메뉴  		 --select 
		var	td1 = td0.next();		//순서 			
		var	td2 = td1.next();		//프로그램ID 
		var	td3 = td2.next();		//한국어명 	 
		var	td4 = td3.next();		//영어명
		var	td5 = td4.next();		//중국어명
		var	td6 = td5.next();		//기타 
		var	td7 = td6.next();		//형태		--select 
		var	td8 = td7.next();		//조회 		--checkbox
		var	td9 = td8.next();		//신규 		--checkbox
		var	td10 = td9.next(); 		//저장 		--checkbox
		var	td11 = td10.next();		//삭제 		--checkbox
		var	td12 = td11.next();		//엑셀 		--checkbox
		var	td13 = td12.next();		//사용여부 	--Y or N select 
		var	td14 = td13.next();		//개발자 
		var	td15 = td14.next();		//개발일자 
		var	td16 = td15.next();		//상태 
		var	td17 = td16.next();		//수정자 
		var	td18 = td17.next();		//수정일자 					
	
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}

			var checkbox_arr = [{ checkbox: td8.eq(i).children().children(":checked").val()}, 	//조회
							  { checkbox: td9.eq(i).children().children(":checked").val() },  	//신규
							  { checkbox: td10.eq(i).children().children(":checked").val() },  	//저장
							  { checkbox: td11.eq(i).children().children(":checked").val() },  	//삭제
							  { checkbox: td12.eq(i).children().children(":checked").val() }];  //엑셀
						
	
			//체크박스 체크
			for (var prop in checkbox_arr) {
				if( checkbox_arr[prop].checkbox != -1){			
					checkbox_arr[prop].checkbox = "";
				}
			}

			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MENUID			:  td0.eq(i).children().val(), 		//메뉴 (select) 		
				SORTKEY			:  td1.eq(i).children().val(),   	//순서 			
				PROGID   		:  td2.eq(i).children().val(),    	//프로그램ID 
				KORPROGNAME  	:  td3.eq(i).children().val(),     	//한국어명 	 
				ENGPROGNAME     :  td4.eq(i).children().val(),     	//영어명
				CHIPROGNAME     :  td5.eq(i).children().val(),     	//중국어명
				ETC    			:  td6.eq(i).children().val(),     	//기타 
				PROGTYPE 		:  td7.eq(i).children().val(),     	//형태 (select)
				FINDFLAG    	:  checkbox_arr[0].checkbox,		//조회 (checkbox)
				NEWFLAG    		:  checkbox_arr[1].checkbox, 		//신규 (checkbox)
				SAVEFLAG  		:  checkbox_arr[2].checkbox, 		//저장 (checkbox)
				DELFLAG   		:  checkbox_arr[3].checkbox,		//삭제 (checkbox)
				EXPFLAG    		:  checkbox_arr[4].checkbox, 		//엑셀 (checkbox)
				USEFLAG    		:  td13.eq(i).children().val(),     //사용여부 (Y or N select) 
				PROGRAMMER_NAME :  td14.eq(i).children().val(),     //개발자 
				PROGCREATEDATE  :  td15.eq(i).children().val(),    	//개발일자 
				PROGSTATUSID   	:  td16.eq(i).children().val(),  	//상태 
				UPDUSER  		:  user   //수정자 
			});

			//공백 validation 체크 
			if(insertArray[i].MENUID == ""){
				alert("메뉴가 공백입니다.");
				save_chk = false;
				break;
			};
			
			if(insertArray[i].PROGID == ""){
				alert("프로그램 ID가 공백입니다.");
				save_chk = false;
				break;
			};
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({          
		 			url:"/WMS/System_management_2/screen_01Insert.do",
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

		 					$('#MENUID').val(""); 	//상위메뉴
		 					$('#PROGID').val("");	//화면ID
		 					$('#USEFLAG').val("Y"); //사용유무
		 					$('#PROGNAME').val(""); //화면명
		 					
		 				 	$('#orderby').val('UPDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
	
		 				}//저장 성공했을 시 실행 끝
		 			}//ajax Success 끝
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
			
	}else {//1.2 진행여부 : No
		return;
	}
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
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];

		var	td0 = td.next(); 		//메뉴  		 --select 
		var	td1 = td0.next();		//순서 			
		var	td2 = td1.next();		//프로그램ID 
		var	td3 = td2.next();		//한국어명 	 
		var	td4 = td3.next();		//영어명
		var	td5 = td4.next();		//중국어명
		var	td6 = td5.next();		//기타 
		var	td7 = td6.next();		//형태		--select 
		var	td8 = td7.next();		//조회 		--checkbox
		var	td9 = td8.next();		//신규 		--checkbox
		var	td10 = td9.next(); 		//저장 		--checkbox
		var	td11 = td10.next();		//삭제 		--checkbox
		var	td12 = td11.next();		//엑셀 		--checkbox
		var	td13 = td12.next();		//사용여부 	--Y or N select 
		var	td14 = td13.next();		//개발자 
		var	td15 = td14.next();		//개발일자 
		var	td16 = td15.next();		//상태 
		var	td17 = td16.next();		//수정자 
		var	td18 = td17.next();		//수정일자 			
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}

			var checkbox_arr = [{ checkbox: td8.eq(i).children().children(":checked").val()}, 	//조회
							  { checkbox: td9.eq(i).children().children(":checked").val() },  	//신규
							  { checkbox: td10.eq(i).children().children(":checked").val() },  	//저장
							  { checkbox: td11.eq(i).children().children(":checked").val() },  	//삭제
							  { checkbox: td12.eq(i).children().children(":checked").val() }];  //엑셀
						
	
			//체크박스 체크
			for (var prop in checkbox_arr) {
				if( checkbox_arr[prop].checkbox != -1){			
					checkbox_arr[prop].checkbox = "";
				}
			}
			
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MENUID			:  td0.eq(i).attr("value"), 		//메뉴 		(text) 		
				SORTKEY			:  td1.eq(i).text(),   				//순서 		(text)		
				PROGID   		:  td2.eq(i).text(),    			//프로그램ID 	(text)
				KORPROGNAME  	:  td3.eq(i).children().val(),     	//한국어명 	 
				ENGPROGNAME     :  td4.eq(i).children().val(),     	//영어명
				CHIPROGNAME     :  td5.eq(i).children().val(),     	//중국어명
				ETC    			:  td6.eq(i).children().val(),     	//기타 
				PROGTYPE 		:  td7.eq(i).children().val(),     	//형태 (select)
				FINDFLAG    	:  checkbox_arr[0].checkbox,		//조회 (checkbox)
				NEWFLAG    		:  checkbox_arr[1].checkbox, 		//신규 (checkbox)
				SAVEFLAG  		:  checkbox_arr[2].checkbox, 		//저장 (checkbox)
				DELFLAG   		:  checkbox_arr[3].checkbox,		//삭제 (checkbox)
				EXPFLAG    		:  checkbox_arr[4].checkbox, 		//엑셀 (checkbox)
				USEFLAG    		:  td13.eq(i).children().val(),     //사용여부 (Y or N select) 
				PROGRAMMER_NAME :  td14.eq(i).children().val(),     //개발자 
				PROGCREATEDATE  :  td15.eq(i).children().val(),    	//개발일자 
				PROGSTATUSID   	:  td16.eq(i).children().val(),  	//상태 
				UPDUSER  		:  user   //수정자 
			});

		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/System_management_2/screen_01Update.do",
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
		 					
		 					$('#MENUID').val(""); 	//상위메뉴
		 					$('#PROGID').val("");	//화면ID
		 					$('#USEFLAG').val("Y"); //사용유무
		 					$('#PROGNAME').val(""); //화면명
		 					
		 				 	$('#orderby').val('UPDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');

			 				//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
				 					
				 					var td = $("#"+json.value[i].PROGID); //체크박스 
				 					$(td).trigger('click');

				 					//var td0 = td.parent().parent(); //체크박스 
				 					var	td0 = td.parent().parent().next();	//메뉴  		 --select 
				 					var	td1 = td0.next();					//순서 			
				 					var	td2 = td1.next();					//프로그램ID 
				 					var	td3 = td2.next();					//한국어명 	 
				 					var	td4 = td3.next();					//영어명
				 					var	td5 = td4.next();					//중국어명
				 					var	td6 = td5.next();					//기타 
				 					var	td7 = td6.next();					//형태		--select 
				 					var	td8 = td7.next();					//조회 		--checkbox
				 					var	td9 = td8.next();					//신규 		--checkbox
				 					var	td10 = td9.next(); 					//저장 		--checkbox
				 					var	td11 = td10.next();					//삭제 		--checkbox
				 					var	td12 = td11.next();					//엑셀 		--checkbox
				 					var	td13 = td12.next();					//사용여부 	--Y or N select 
				 					var	td14 = td13.next();					//개발자 
				 					var	td15 = td14.next();					//개발일자 
				 					var	td16 = td15.next();					//상태 
				 					var	td17 = td16.next();					//수정자 
				 					var	td18 = td17.next();					//수정일자 		

				 					td3.children().val(json.value[i].KORPROGNAME); 		//한국어명 	 
									td4.children().val(json.value[i].ENGPROGNAME); 		//영어명
									td5.children().val(json.value[i].CHIPROGNAME); 		//중국어명
									td6.children().val(json.value[i].ETC);   			//기타 
									td7.children().val(json.value[i].PROGTYPE); 	 	//형태			--select                                   
									td13.children().val(json.value[i].USEFLAG);    		//사용여부 	--Y or N select 
									td14.children().val(json.value[i].PROGRAMMER_NAME);	//개발자 
									td15.children().val(json.value[i].PROGCREATEDATE);	//개발일자 
									td16.children().val(json.value[i].PROGSTATUSID);   	//상태 

									//checkbox
									if(json.value[i].FINDFLAG == '-1'){
										td8.children().children().prop("checked", true);	//조회
									}
									if(json.value[i].NEWFLAG == '-1'){
										td9.children().children().prop("checked", true);	//신규
									}
									if(json.value[i].SAVEFLAG == '-1'){
										td10.children().children().prop("checked", true);	//저장
									}
									if(json.value[i].DELFLAG == '-1'){
										td11.children().children().prop("checked", true);	//삭제
									}
									if(json.value[i].EXPFLAG == '-1'){
										td12.children().children().prop("checked", true);	//엑셀
									}
				 					
				 				}
				 				
				 				//스크롤 영역
				 				var specifiedSize  = $("#"+json.value[0].PROGID).offset().top - 400; //지정된 사이즈 
				 			    var scrollMove = {top:specifiedSize, left:240}; //스크롤 맨 밑 위치 
				 			   
				 			    $('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				
			 				}//유효성 검사에 막힌 데이터 반환  끝
		 				}//저장 성공했을 시 실행 끝
		 			}//ajax Success 끝
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
			
	}else {//1.2 진행여부 : No
		return;
	}
});



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
		
	
		
		var	td0 = td.next(); 		//메뉴  		 --select 
		var	td1 = td0.next();		//순서 			
		var	td2 = td1.next();		//프로그램ID 
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
			
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				PROGID : trim(td2.eq(i).text()), 
			});

		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
					url:"/WMS/System_management_2/screen_01Delete.do",
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
							$('#MENUID').val(""); 	//상위메뉴
							$('#PROGID').val("");	//화면ID
							$('#USEFLAG').val("Y"); //사용유무
							$('#PROGNAME').val(""); //화면명

							$('#orderby').val('SORTKEY');
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
	
	}
})

</script>



<script type="text/javascript">	

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	if(getParameterByName("MANDT") != ""){
    	$('#searchButton').trigger('click');
    	get_query();
    }
	$('#searchButton').trigger('click');

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