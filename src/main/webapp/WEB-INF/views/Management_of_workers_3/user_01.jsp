<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 작업자관리 - 사용자 관리  -->   
<%@ include file ="/WEB-INF/views/include/include_tap.jsp" %>
       
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					
					
						<div class="search_box">
							<div class="search_box_sub">  
							<form name='search' id='search'>
								<input type="hidden" id="MANDT" name="MANDT" value="100" />
								
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">법인</span>
										</span>
										<select id="WERKS" name="WERKS" class="form-control" style="">
											
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">사용자ID</span>
										</span>
										<input type="text" id="USERID" name="USERID" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">작업자구분</span>
										</span>
										<select id="WKCOD" name="WKCOD" class="form-control" style="">
										
										</select>
									</div>
								</div>					
								
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">부서</span>
										</span>
										<select id="DEPT" name="DEPT" class="form-control" style="">
											
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">사용자명</span>
										</span>
										<input type="text" id="USERNAME" name="USERNAME" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">직급</span>
										</span>
										<select id="JKCOD" name="JKCOD" class="form-control" style="">
											
										</select>
									</div>
								</div>	
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">상태</span>
										</span>
										<select id="STATUS" name="STATUS" class="form-control" style="">
										
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">근로구분</span>
										</span>
										<select id="STYPE" name="STYPE" class="form-control" style="">
										
										</select>
									</div>
								</div>
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:60px;">정렬</span>
										</span>
										<select id="orderby" name="orderby" class="form-control" style="">
											<option value="UPDATE">등록순</option>
										</select>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class=" table-responsive">
										<button type="button" id="searchButton" style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search"  onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
									</div>
								</div>
						
								
								
							</form>
							</div>
						</div>
<style>
.table.table-bordered th { top: -1px; }
.tableFixHead          { overflow-x: hidden; overflow-y: auto; height: 540px;    overflow:auto; width:100%; }
.tableFixHead thead  tr:first-child th{ position: sticky; top: 0; }
input[type=checkbox] { width: 5px; height: 1px; position: static;}
input[type=checkbox] + .text { position: static;}

/*datetimepicker 추가시, .tableFixHead를 넣어줘야 디자인이 안깨짐*/ 
.tableFixHead td, .tableFixHead th {
 /*  width: 300px;*/
  border: 1px solid #000;
  width: 100px;
}

.tableFixHead table {
  table-layout: fixed;
  /*border-collapse:separate;*/
  border-spacing: 0px;
}

.tableFixHead td:first-child, .fixedColum:first-child {
  position:sticky;
  left:0;
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum:first-child{z-index:2;}

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
										<a class="btn btn-blue" id="passwordReset"><i class="fa fa-unlock-alt"></i>암호초기화  </a>
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
										<col style="width: 150px;">
										<col style="width: 150px;">
										<col style="width: 140px;">
										<col style="width: 100px;">
										<col style="width: 100px;">   
										<col style="width: 100px;">
										<col style="width: 140px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 150px;">
										<col style="width: 150px;">
										<col style="width: 150px;">
										<col style="width: 150px;">
										<col style="width: 80px;">
										<col style="width: 80px;">
										<col style="width: 100px;">
										<col style="width: 160px;">
										<col style="width: 70px;">
									</colgroup>
                                    <thead>
                                        <tr>
                                        	<th class ="fixedColum">선택</th>
                                            <th>구분</th>
                                            <th>부서</th>
                                            <th>직급</th>
                                            <th>이름</th>
                                            <th>영문명</th>
                                            <th>사번</th>
                                            <th>근로구분</th>
                                            <th>입사일</th>
                                            <th>퇴사일</th>
											<th>상태</th>
											<th>권한</th>
											<th>법인</th>
											<th>저장위치</th>
											<th>외주여부</th>
											<th>실사권한</th>
											<th>EMAIL</th>
											<th>최종로그인</th>
											<th>암호실패</th>
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
var Select_array_WERKS =  new Array(); 		//법인 
var Select_list_WERKS = "";

var Select_array_DEPT =  new Array(); 		//부서
var Select_list_DEPT = "";

var Select_array_STAT2 =  new Array(); 		//상태
var Select_list_STAT2 = "";

var Select_array_WKCOD =  new Array(); 		//작업자구분
var Select_list_WKCOD = "";

var Select_array_JKCOD =  new Array(); 		//직급
var Select_list_JKCOD = "";

var Select_array_STYPE =  new Array(); 		//근로구분
var Select_list_STYPE = "";

var Select_array_AUTH = new Array();		//권한
var Select_list_AUTH = "";

var Select_array_LGORT = new Array();		//저장위치
var Select_list_LGORT = "";



function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/user_01/user_01Select.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){ 

			$("#chkAll").prop("checked", false); //전체체크 해제	
			$('#mytable tbody').html('');
			$("#TOTAL_COUNT").html('');
			$('#WERKS').html('<option value="">전체</option>');
			$('#DEPT').html('<option value="">전체</option>');
			$('#STATUS').html('<option value="">전체</option>');
			$('#STYPE').html('<option value="">전체</option>');
			$('#WKCOD').html('<option value="">전체</option>');
			$('#JKCOD').html('<option value="">전체</option>');
			
			var list ="";
			var TOTAL_COUNT = "";
			Select_list_WERKS = "";
			Select_list_DEPT = "";
			Select_list_STAT2 = "";
			Select_list_WKCOD = "";
			Select_list_JKCOD = "";
			Select_list_STYPE = "";
			Select_list_AUTH = "";
			Select_list_LGORT = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			
			//코드종류 Select
			Select_array_WERKS = data['Select_WERKS'];
			Select_array_DEPT = data['Select_DEPT'];
			Select_array_STAT2 = data['Select_STAT2'];
			Select_array_WKCOD = data['Select_WKCOD'];
			Select_array_JKCOD = data['Select_JKCOD'];
			Select_array_STYPE = data['Select_STYPE'];
			Select_array_AUTH = data['Select_AUTH'];
			Select_array_LGORT = data['Select_LGORT'];
			
			
			for(var j = 1 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			for(var j = 0 ; j < Select_array_DEPT.length; j ++ ){
				Select_list_DEPT += "<option value="+Select_array_DEPT[j].DEPT_CODE+" data-name="+Select_array_DEPT[j].CODENAME+">"+Select_array_DEPT[j].DEPT+"</option>";
			}
			for(var j = 0 ; j < Select_array_STAT2.length; j ++ ){
				Select_list_STAT2 += "<option value="+Select_array_STAT2[j].STAT2_CODE+">"+Select_array_STAT2[j].STAT2+"</option>";
			}
			for(var j = 0 ; j < Select_array_WKCOD.length; j ++ ){
				Select_list_WKCOD += "<option value="+Select_array_WKCOD[j].WKCOD_CODE+">"+Select_array_WKCOD[j].WKCOD+"</option>";
			}
			for(var j = 0 ; j < Select_array_JKCOD.length; j ++ ){
				Select_list_JKCOD += "<option value="+Select_array_JKCOD[j].JKCOD_CODE+">"+Select_array_JKCOD[j].JKCOD+"</option>";
			}
			for(var j = 0 ; j < Select_array_STYPE.length; j ++ ){
				Select_list_STYPE += "<option value="+Select_array_STYPE[j].STYPE_CODE+">"+Select_array_STYPE[j].STYPE+"</option>";
			}
			for(var j = 0 ; j < Select_array_AUTH.length; j ++ ){
				Select_list_AUTH += "<option value="+Select_array_AUTH[j].AUTH_CODE+">"+Select_array_AUTH[j].AUTH+"</option>";
			}
			for(var j = 0 ; j < Select_array_LGORT.length; j ++ ){
				Select_list_LGORT += "<option value="+Select_array_LGORT[j].LGORT_CODE+">"+Select_array_LGORT[j].LGORT+"</option>";
			}
			
			var USERID = "";
			for(var i = 0 ; i < data['list'].length ; i ++ ){

				USERID = data['list'][i].USERID;
		
						list += "<tr name='defaultTd'>"+
								//선택
								"	<td class='text-align-center'>"+
								"		<label>"+
								"			<input type='checkbox' name='chk[]' id='"+USERID+"' value='' onclick='check(this)'><span class='text'></span>"+
								"		</label>"+
								"    </td>"+
								"    <td class='text-align-left'>"+ data['list'][i].WKCOD 		+"</td>"+	//구분
								"    <td class='text-align-left'>"+ data['list'][i].DEPT 		+"</td>"+	//부서
								"    <td class='text-align-left'>"+ data['list'][i].JKCOD 		+"</td>"+	//직급
								"	 <td class='text-align-center'>"+ data['list'][i].USERNAME 	+"</td>"+	//이름
								"    <td class='text-align-left'>"+ data['list'][i].ENGNAME		+"</td>"+	//영문명
					 			"    <td class='text-align-left'>"+ data['list'][i].USERID 		+"</td>"+	//사번		
								"    <td class='text-align-left'>"+ data['list'][i].STYPE 		+"</td>"+	//근로구분 
								"    <td class='text-align-left'>"+ data['list'][i].DATEFROM  	+"</td>"+	//입사일   
								"    <td class='text-align-left'>"+ data['list'][i].DATETO   	+"</td>"+	//퇴사일   
								"    <td class='text-align-left'>"+ data['list'][i].STAT2 		+"</td>"+	//상태    
								"    <td class='text-align-left'>"+ data['list'][i].AUTH 		+"</td>"+	//권한    
								"    <td class='text-align-left' name='LGORT[]' value='"+data['list'][i].WERKS_CODE+"'>"+ data['list'][i].WERKS 		+"</td>"+	//법인    
								"    <td class='text-align-left'>"+ data['list'][i].LGORT 		+"</td>"+	//저장위치 
								"    <td class='text-align-center'>"+ data['list'][i].OUTSCFLAG +"</td>"+	//외주여부 
								"    <td class='text-align-center'>"+ data['list'][i].STCAUTH 	+"</td>"+	//실사권한 
								"    <td class='text-align-left'>"+ data['list'][i].EMAIL  		+"</td>"+	//EMAIL  
								"    <td class='text-align-left'>"+ data['list'][i].LASTLOGIN  	+"</td>"+	//최종로그인
								"    <td class='text-align-left'>"+ data['list'][i].FAILPWD  	+"</td>"+	//암호실패 	
							"</tr>";
			}
			
			$('#mytable tbody').append(list);		
			$('#WERKS').append(Select_list_WERKS);
			$('#DEPT').append(Select_list_DEPT);
			$('#STATUS').append(Select_list_STAT2);
			$('#WKCOD').append(Select_list_WKCOD);
			$('#JKCOD').append(Select_list_JKCOD);
			$('#STYPE').append(Select_list_STYPE);
		
			$("#WERKS").val(data['map'].WERKS );
			$("#DEPT").val(data['map'].DEPT );
			$("#STATUS").val(data['map'].STATUS );
			$("#STYPE").val(data['map'].STYPE );
			$("#WKCOD").val(data['map'].WKCOD );
			$("#JKCOD").val(data['map'].JKCOD );
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

//행 WERKS Select 변환 함수
var appendSelect_array_WERKS = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_WERKS.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_WERKS[i].WERKS);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_WERKS[i].PLANTNAME ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_WERKS[i].PLANTNAME){
			
			OPT[i].setAttribute('selected', 'selected');
			
			//저장위치 select 생성 
			//var MANDT = $('#MANDT').val();
			//LGORT(MANDT, Select_array_WERKS[i].WERKS)
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 DEPT Select 변환 함수
var appendSelect_array_DEPT = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_DEPT.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_DEPT[i].DEPT_CODE);
		OPT[i].setAttribute('data-name', Select_array_DEPT[i].CODENAME);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_DEPT[i].DEPT ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_DEPT[i].DEPT){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 STAT2 Select 변환 함수
var appendSelect_array_STAT2 = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_STAT2.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_STAT2[i].STAT2_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_STAT2[i].STAT2 ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_STAT2[i].STAT2){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 WKCOD Select 변환 함수
var appendSelect_array_WKCOD = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_WKCOD.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_WKCOD[i].WKCOD_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_WKCOD[i].WKCOD ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_WKCOD[i].WKCOD){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 JKCOD Select 변환 함수
var appendSelect_array_JKCOD = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_JKCOD.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_JKCOD[i].JKCOD_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_JKCOD[i].JKCOD ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_JKCOD[i].JKCOD){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 STYPE Select 변환 함수
var appendSelect_array_STYPE = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_STYPE.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_STYPE[i].STYPE_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_STYPE[i].STYPE ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_STYPE[i].STYPE){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 AUTH Select 변환 함수
var appendSelect_array_AUTH = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_AUTH.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_AUTH[i].AUTH_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_AUTH[i].AUTH ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_AUTH[i].AUTH){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 LGORT Select 변환 함수
var appendSelect_array_LGORT = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_LGORT.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_LGORT[i].LGORT_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_LGORT[i].LGORT ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_LGORT[i].LGORT){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

/*
//저장위치 Select 
var Select_array_LGORT = new Array();		
var Select_list_LGORT = "";

function LGORT(MANDT, WERKS){	
	//Create an FormData object 
	var params =  "MANDT=" + MANDT + "&WERKS=" + WERKS;
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/user_01/user_01Select_LGORT.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			Select_list_LGORT = "";
			//코드종류 Select
			Select_array_LGORT = data['Select_LGORT'];
			
			for(var j = 0 ; j < Select_array_LGORT.length; j ++ ){
				Select_list_LGORT += "<option value="+Select_array_LGORT[j].LGORT+">"+Select_array_LGORT[j].SLNAME+"</option>";
			}
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}	

//법인 콤보박스에 따른 저장위치(LGORT) 콤보박스 불러오기
$(document).on('change','[name="LGORT[]"]',function(e){
		
		var MANDT = $('#MANDT').val();
		LGORT(MANDT, e.target.value)
		
		var td = e.target.parentNode;		//법인
		var td0 = td.nextElementSibling;	//저장위치
		var color = ""
		
 		if(td0.parentNode.attributes.name.value == "mytr"){
 			color="gold";
 		}else if(td0.parentNode.attributes.name.value == "defaultTd"){
 			color="#3fc21f";
 		}
 		appendSelect_array_LGORT(td0,color);
			
});	

//행 LGORT Select 변환 함수
var appendSelect_array_LGORT = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_LGORT.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_LGORT[i].LGORT);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_LGORT[i].SLNAME ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_LGORT[i].SLNAME){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}
*/

/*
//체크박스 전체 선택 
$("#chkAll").on("click", function() {
	
	var size = document.getElementsByName("chk[]").length; //총 row 수를 구한다.
	var chkAll = $(this).is(":checked");
	
	if (chkAll){	
		$("tbody input:checkbox").prop("checked", true);		
	}else{
		$("tbody input:checkbox").prop("checked", false);
	}

	//1. 체크박스 전체 체크
	if (chkAll){

			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
				var td0 = td.nextElementSibling;  //법인 
				var td1 = td0.nextElementSibling; //저장위치
				var td2 = td1.nextElementSibling; //저장위치명
				var td3 = td2.nextElementSibling; //외주여부
				var td4 = td3.nextElementSibling; //사용유무
				var td5 = td4.nextElementSibling; //비고
				
				var mail_arr = 	[{ yesCheck: appendSelect_array_CUSTCD, 	column: td0},  //법인
								{  yesCheck: appendInput,  			column: td1},  //저장위치
								{  yesCheck: appendInput, 			column: td2},  //저장위치명
								{  yesCheck: appendSelect, 			column: td3},  //외주여부
								{  yesCheck: appendSelect, 			column: td4},  //사용유무
								{  yesCheck: appendInput, 			column: td5}]; //비고
				
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
						mail_arr.splice(0, 1); //(법인 삭제)
						mail_arr.splice(0, 1); //(저장위치 삭제)
						
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
			var td0 = td.nextElementSibling;  //법인 
			var td1 = td0.nextElementSibling; //저장위치
			var td2 = td1.nextElementSibling; //저장위치명
			var td3 = td2.nextElementSibling; //외주여부
			var td4 = td3.nextElementSibling; //사용유무
			var td5 = td4.nextElementSibling; //비고
			
			var mail_arr = 	[{ noCheck: appendSelectText, 	column: td0}, //법인 
							{  noCheck: appendText,			column: td1}, //저장위치
							{  noCheck: appendText, 		column: td2}, //저장위치명
							{  noCheck: appendText, 		column: td3}, //외주여부
							{  noCheck: appendText, 		column: td4}, //사용유무
							{  noCheck: appendText, 		column: td5}];//비고 
			
			//4. input 태그 여부 확인
			inputValue = td3.childNodes[0].value; 
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
					mail_arr.splice(0, 1); //(법인 삭제)
					mail_arr.splice(0, 1); //(저장위치 삭제)
				
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
	
	td = it.parentNode.parentNode;//0. 공통작업- 체크박스 
	
	td0 = td.nextElementSibling;  	  //구분		  WKCOD		(select - WKCOD)
	td1 = td0.nextElementSibling;     //부서		  DEPT		(select - DEPT)
	td2 = td1.nextElementSibling;     //직급		  JKCOD		(select - JKCOD)
	td3 = td2.nextElementSibling;     //이름		  USERNAME
	td4 = td3.nextElementSibling;     //영문명	  ENGNAME
	td5 = td4.nextElementSibling;     //사번		  USERID
	td6 = td5.nextElementSibling;     //근로구분	  STYPE		(select - STYPE)
	td7 = td6.nextElementSibling;     //입사일	  DATEFROM	(date)
	td8 = td7.nextElementSibling;     //퇴사일	  DATETO	(date)
	td9 = td8.nextElementSibling;     //상태		  STAT2		(select - STAT2)
	td10 = td9.nextElementSibling;    //권한		  AUTH		(select - AUTH)
	td11 = td10.nextElementSibling;   //법인		  WERKS		(select - WERKS)
	td12 = td11.nextElementSibling;   //저장위치	  LGORT		(select - ?)
	td13 = td12.nextElementSibling;   //외주여부	  OUTSCFLAG	(Y or N select)
	td14 = td13.nextElementSibling;   //실사권한	  STCAUTH	(Y or N select)
	td15 = td14.nextElementSibling;   //EMAIL	  EMAIL
	td16 = td15.nextElementSibling;   //최종로그인  LASTLOGIN	(X)
	td17 = td16.nextElementSibling;   //암호실패	  FAILPWD	(X)
	
	
	var mail_arr = 	[{ yesCheck: appendSelect_array_WKCOD, 	noCheck: appendSelectText,  column: td0  },  //구분		  WKCOD		(select - WKCOD)
					{  yesCheck: appendSelect_array_DEPT, 	noCheck: appendSelectText,  column: td1  },  //부서		  DEPT		(select - DEPT)
					{  yesCheck: appendSelect_array_JKCOD, 	noCheck: appendSelectText,  column: td2  },  //직급		  JKCOD		(select - JKCOD)
					{  yesCheck: appendInput, 				noCheck: appendText,  		column: td3  },  //이름		  USERNAME 
					{  yesCheck: appendInput, 				noCheck: appendText,  		column: td4  },  //영문명	  ENGNAME 
					{  yesCheck: appendInput, 				noCheck: appendText,  		column: td5  },  //사번		  USERID 
					{  yesCheck: appendSelect_array_STYPE, 	noCheck: appendSelectText,  column: td6  },  //근로구분	  STYPE		(select - STYPE) 
					{  yesCheck: appendDatetimepicker,		noCheck: appendText,  		column: td7  },  //입사일	  DATEFROM	(date) 
					{  yesCheck: appendDatetimepicker,		noCheck: appendText,  		column: td8  },  //퇴사일	  DATETO	(date) 
					{  yesCheck: appendSelect_array_STAT2, 	noCheck: appendSelectText,  column: td9  },  //상태		  STAT2		(select - STAT2) 
					{  yesCheck: appendSelect_array_AUTH, 	noCheck: appendSelectText,  column: td10 },  //권한		  AUTH		(select - AUTH) 
					{  yesCheck: appendSelect_array_WERKS, 	noCheck: appendSelectText,  column: td11 },  //법인		  WERKS		(select - WERKS) 
					{  yesCheck: appendSelect_array_LGORT, 	noCheck: appendSelectText,  column: td12 },  //저장위치	  LGORT		(select - LGORT) 
					{  yesCheck: appendSelect, 				noCheck: appendText,  		column: td13 },  //외주여부	  OUTSCFLAG	(Y or N select) 
					{  yesCheck: appendSelect, 				noCheck: appendText,  		column: td14 },  //실사권한	  STCAUTH	(Y or N select) 
					{  yesCheck: appendInput, 				noCheck: appendText,  		column: td15 }]; //EMAIL	  EMAIL 
									

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
		mail_arr.splice(5, 1); //(사번(=USERID) 삭제)
		
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
	var MANDT = $('#MANDT').val();
	
	$('#mytable > tbody:last').append(
		'<tr name="mytr">'+
			'<td class="text-align-center" style="background-color: gold;">'+
				'<label>'+
					'<input type="checkbox" name="chk[]" value="" onclick="check(this)"><span class="text"></span>'+
				'</label>'+
		    '</td>'+
			
			
			//구분		 (select - WKCOD)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_WKCOD+
				'</select>'+
			'</td>'+
			
			//부서		 (select - DEPT)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_DEPT+
				'</select>'+
			'</td>'+
			
			//직급		 (select - JKCOD)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_JKCOD+
				'</select>'+
			'</td>'+
			
			//이름		 
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//영문명	 
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//사번		 
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//근로구분	 (select - STYPE)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_STYPE+
				'</select>'+
			'</td>'+
			
			//입사일	 	 (date)
			'<td class="text-align-right" style="background-color: gold;"><input value="" class="form-control datetimepicker" type="text" data-date-format="YYYYMMDD" style="width:100%; height:31px;"></td>'+

			//퇴사일	 	 (date)
			'<td class="text-align-right" style="background-color: gold;"><input value="" class="form-control datetimepicker" type="text" data-date-format="YYYYMMDD" style="width:100%; height:31px;"></td>'+

			//상태		 (select - STAT2)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_STAT2+
				'</select>'+
			'</td>'+
			
			//권한		 (select - AUTH)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_AUTH+
				'</select>'+
			'</td>'+
			
			//법인		 (select - WERKS)
			'<td class="text-align-left" name="LGORT[]" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					'<option value=""></option>'+
					Select_list_WERKS+
				'</select>'+
			'</td>'+
			
			//저장위치	 (select - LGORT)
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_LGORT+
				'</select>'+
			'</td>'+
			
			//외주여부	 (Y or N select)
			'<td class="text-align-center" style="background-color: gold;">'+
				'<select type="text" value="Y" style="width:100%;">'+
					'<option value="Y">Y</option>'+
					'<option value="N" selected="selected">N</option>'+
				'</select>'+
			'</td>'+
			
			//실사권한	 (Y or N select)
			'<td class="text-align-center" style="background-color: gold;">'+
				'<select type="text" value="Y" style="width:100%;">'+
					'<option value="Y">Y</option>'+
					'<option value="N" selected="selected">N</option>'+
				'</select>'+
			'</td>'+
			
			//EMAIL	 
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//최종로그인 (X)
			//암호실패	 (X)
			'<td class="text-align-center"></td>'+
			'<td class="text-align-center"></td>'+		
		'</tr>'
	
	);
	//datetimepicker 동적추가
	$(".datetimepicker").datetimepicker({
            format: 'YYYYMMDD',
            pickTime: false,
            language: 'kr'
    });
	
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
		 
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];
		
		var td0 = td.next();  	  //구분		  WKCOD		(select - WKCOD)
		var td1 = td0.next();     //부서		  DEPT		(select - DEPT)
		var td2 = td1.next();     //직급		  JKCOD		(select - JKCOD)
		var td3 = td2.next();     //이름		  USERNAME
		var td4 = td3.next();     //영문명	  ENGNAME
		var td5 = td4.next();     //사번		  USERID
		var td6 = td5.next();     //근로구분	  STYPE		(select - STYPE)
		var td7 = td6.next();     //입사일	  DATEFROM	(date)
		var td8 = td7.next();     //퇴사일	  DATETO	(date)
		var td9 = td8.next();     //상태		  STAT2		(select - STAT2)
		var td10 = td9.next();    //권한		  AUTH		(select - AUTH)
		var td11 = td10.next();   //법인		  WERKS		(select - WERKS)
		var td12 = td11.next();   //저장위치	  LGORT		(select - LGORT)
		var td13 = td12.next();   //외주여부	  OUTSCFLAG	(Y or N select)
		var td14 = td13.next();   //실사권한	  STCAUTH	(Y or N select)
		var td15 = td14.next();   //EMAIL	  EMAIL

	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
		
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				WKCOD	 	: td0.eq(i).children().val(),    //구분		(select - WKCOD)			
				DEPT		: td1.eq(i).children().val(),    //부서		(select - DEPT)             
				JKCOD		: td2.eq(i).children().val(),    //직급		(select - JKCOD)            
				USERNAME    : trim(td3.eq(i).children().val()),    //이름		                            
				ENGNAME     : trim(td4.eq(i).children().val()),    //영문명	                                
				USERID      : trim(td5.eq(i).children().val()),    //사번		                            
				STYPE		: td6.eq(i).children().val(),    //근로구분	(select - STYPE)            
				DATEFROM	: td7.eq(i).children().val(),    //입사일	(date)                      
				DATETO		: td8.eq(i).children().val(),    //퇴사일	(date)                      
				STAT2		: td9.eq(i).children().val(),    //상태		(select - STAT2)            
				AUTH		: td10.eq(i).children().val(),   //권한		(select - AUTH)             
				PLANTCD		: td11.eq(i).children().val(),   //법인		(select - WERKS) == PLANTCD)
				LGORT		: td12.eq(i).children().val(),   //저장위치	(select - LGORT)                
				OUTSCFLAG	: td13.eq(i).children().val(),   //외주여부	(Y or N select)             
				STCAUTH	    : td14.eq(i).children().val(),   //실사권한	(Y or N select) 
				EMAIL       : td15.eq(i).children().val(),   //EMAIL	
				
				MANDT    :  "100",  //클라이언트
				NEWFLAG  :  "Y",  	//신규여부
				DEPTNM   :  td1.eq(i).children().find("option:selected").data("name"),	//부서명(=부서값 명칭)
				UPDUSER  :  user, 	//작업자				
				DIRECT   :  ""		//직간접구분 (X)		
			});

			//공백 validation 체크 
			if(insertArray[i].USERID == ""){
				alert("사번이 공백입니다.");
				save_chk = false;
				break;
			};	

		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Management_of_workers_3/user_01InsertUpdate.do",
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

		 					$('#WERKS').val("");
		 					$('#DEPT').val("");
		 					$('#STATUS').val("");
		 					$('#USERID').val("");
		 					$('#USERNAME').val("");
							$('#STYPE').val("");
		 					$('#WKCOD').val("");
							$('#JKCOD').val("");
							
								
		 				 	$('#orderby').val('UPDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
		 				}
		 			}
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		
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
	
	
	//신규 행(update) 체크 수 있을 떄.
	if(0 < insert_checked_length ){  
		alert("체크된 신규 행 이 있습니다. \n체크 해제 후 저장 진행해 주세요.");
		save_chk = false;	
		return;
	}
	
	//수정 행(insert) 체크 수 없을 떄.
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

		var td0 = td.next();  	  //구분		  WKCOD		(select - WKCOD)
		var td1 = td0.next();     //부서		  DEPT		(select - DEPT)
		var td2 = td1.next();     //직급		  JKCOD		(select - JKCOD)
		var td3 = td2.next();     //이름		  USERNAME
		var td4 = td3.next();     //영문명	  ENGNAME
		var td5 = td4.next();     //사번		  USERID
		var td6 = td5.next();     //근로구분	  STYPE		(select - STYPE)
		var td7 = td6.next();     //입사일	  DATEFROM	(date)
		var td8 = td7.next();     //퇴사일	  DATETO	(date)
		var td9 = td8.next();     //상태		  STAT2		(select - STAT2)
		var td10 = td9.next();    //권한		  AUTH		(select - AUTH)
		var td11 = td10.next();   //법인		  WERKS		(select - WERKS)
		var td12 = td11.next();   //저장위치	  LGORT		(select - LGORT)
		var td13 = td12.next();   //외주여부	  OUTSCFLAG	(Y or N select)
		var td14 = td13.next();   //실사권한	  STCAUTH	(Y or N select)
		var td15 = td14.next();   //EMAIL	  EMAIL

	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				WKCOD	 	: td0.eq(i).children().val(),    //구분		(select - WKCOD)			
				DEPT		: td1.eq(i).children().val(),    //부서		(select - DEPT)             
				JKCOD		: td2.eq(i).children().val(),    //직급		(select - JKCOD)            
				USERNAME    : td3.eq(i).children().val(),    //이름		                            
				ENGNAME     : td4.eq(i).children().val(),    //영문명	                                
				USERID      : td5.eq(i).text(),    //사번		                            
				STYPE		: td6.eq(i).children().val(),    //근로구분	(select - STYPE)            
				DATEFROM	: td7.eq(i).children().val(),    //입사일	(date)                      
				DATETO		: td8.eq(i).children().val(),    //퇴사일	(date)                      
				STAT2		: td9.eq(i).children().val(),    //상태		(select - STAT2)            
				AUTH		: td10.eq(i).children().val(),   //권한		(select - AUTH)             
				PLANTCD		: td11.eq(i).children().val(),   //법인		(select - WERKS) == PLANTCD)
				LGORT		: td12.eq(i).children().val(),   //저장위치	(select - LGORT)                
				OUTSCFLAG	: td13.eq(i).children().val(),   //외주여부	(Y or N select)             
				STCAUTH	    : td14.eq(i).children().val(),   //실사권한	(Y or N select) 
				EMAIL       : td15.eq(i).children().val(),   //EMAIL	
				
				MANDT    :  "100",  //클라이언트
				NEWFLAG  :  "",  	//신규여부
				DEPTNM   :  td1.eq(i).children().find("option:selected").data("name"),	//부서명(=부서값 명칭)
				UPDUSER  :  user, 	//작업자				
				DIRECT   :  ""		//직간접구분 (X)		
			});

			
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Management_of_workers_3/user_01InsertUpdate.do",
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
		 				
		 				var CUSTCD = "";
		 				var CMATNR = "";
		 				
		 				//저장 성공했을 시 실행
		 				if(json.result == true){
							
							$('#WERKS').val("");
		 					$('#DEPT').val("");
		 					$('#STATUS').val("");
		 					$('#USERID').val("");
		 					$('#USERNAME').val("");
							$('#STYPE').val("");
		 					$('#WKCOD').val("");
							$('#JKCOD').val("");
							
		 				 	$('#orderby').val('UPDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
			 			
		 				}
		 			}
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
});	

	
	
//삭제하기
$("#deleteButton").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	var insert_checked_length = $("tr[name='mytr'] td label input[name='chk[]']:checked").length //insert row 체크 수

	//삽입 행(insert) 체크 수 있을 떄.
 	if(0 < insert_checked_length ){ 
		alert("체크된 신규 행 이 있습니다. \n체크 해제 후 삭제 진행해 주세요.");
		save_chk = false;	
 		return;
 	}
	
	//삭제 행(delete) 체크 수 없을 떄.
	if(0 == update_checked_length ){ 
		alert("체크한 행이 없습니다.");
		save_chk = false;	
		return;
	}
 	
	//1.저장 진행여부 alert   
	if(confirm(  "삭제 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
	
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];
		
	
		var td0 = td.next();  	  //구분		  WKCOD		(select - WKCOD)
		var td1 = td0.next();     //부서		  DEPT		(select - DEPT)
		var td2 = td1.next();     //직급		  JKCOD		(select - JKCOD)
		var td3 = td2.next();     //이름		  USERNAME
		var td4 = td3.next();     //영문명	  ENGNAME
		var td5 = td4.next();     //사번		  USERID
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
			
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				USERID      : td5.eq(i).text(),    //사번	
				MANDT    :  "100",  //클라이언트
			});

		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
					url:"/WMS/Management_of_workers_3/user_01Delete.do",
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
							$('#WERKS').val("");
		 					$('#DEPT').val("");
		 					$('#STATUS').val("");
		 					$('#USERID').val("");
		 					$('#USERNAME').val("");
							$('#STYPE').val("");
		 					$('#WKCOD').val("");
							$('#JKCOD').val("");
							
		 				 	$('#orderby').val('UPDATE');
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
	
	
//암호 초기화
$("#passwordReset").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	var insert_checked_length = $("tr[name='mytr'] td label input[name='chk[]']:checked").length //insert row 체크 수

	//삽입 행(insert) 체크 수 있을 떄.
 	if(0 < insert_checked_length ){ 
		alert("체크된 신규 행 이 있습니다. \n체크 해제 후 암호초기화 진행해 주세요.");
		save_chk = false;	
 		return;
 	}
	
	//삭제 행(delete) 체크 수 없을 떄.
	if(0 == update_checked_length ){ 
		alert("체크한 행이 없습니다.");
		save_chk = false;	
		return;
	}
 	
	//1.저장 진행여부 alert   
	if(confirm(  "암호 초기화 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
	
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];
		
	
		var td0 = td.next();  	  //구분		  WKCOD		(select - WKCOD)
		var td1 = td0.next();     //부서		  DEPT		(select - DEPT)
		var td2 = td1.next();     //직급		  JKCOD		(select - JKCOD)
		var td3 = td2.next();     //이름		  USERNAME
		var td4 = td3.next();     //영문명	  ENGNAME
		var td5 = td4.next();     //사번		  USERID
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
			
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				USERID      : td5.eq(i).text(),    //사번	
				MANDT    :  "100",  //클라이언트
			});

		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
					url:"/WMS/Management_of_workers_3/user_01PasswordReset.do",
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
							$('#WERKS').val("");
		 					$('#DEPT').val("");
		 					$('#STATUS').val("");
		 					$('#USERID').val("");
		 					$('#USERNAME').val("");
							$('#STYPE').val("");
		 					$('#WKCOD').val("");
							$('#JKCOD').val("");
							
		 				 	$('#orderby').val('UPDATE');
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