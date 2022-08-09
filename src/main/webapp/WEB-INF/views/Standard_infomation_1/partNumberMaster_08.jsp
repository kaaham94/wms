<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 기준정보 - 품번마스터 관리  -->   
<%@ include file ="/WEB-INF/views/include/include_tap.jsp" %>
           
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	
						<div class="search_box">
							<div class="search_box_sub">  
							<form name='search' id='search'>
								<input type="hidden" id="pageNo" name="pageNo" value="" />
								<input type="hidden" id="pageSize" name="pageSize" value="" />
								<input type="hidden" id="MANDT" name="MANDT" value="100" />
								
								<div class="col-sm-3">                                   
								</div>					
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control " style="width:100px;">제조사</span>
										</span>
										<select id="CUSTCD" name="CUSTCD" class="form-control" style="">
											<option value="">전체</option>
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">WMS코드</span>
										</span>
										<input type="text" id="MATNR" name="MATNR" value="" onblur="removeSpace(this);" class="form-control">
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
											<span class="form-control" style="width:100px;">품번</span>
										</span>
										<input type="text" id="MAKTX" name="MAKTX" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:60px;">정렬</span>
										</span>
										<select id="orderby" name="orderby" class="form-control" style="">
											<option value="MATNR">거래처코드</option>
											<option value="MKDATE">등록일</option>
											<option value="MODATE">수정일</option>
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
.tableFixHead thead  tr:first-child th{ position: sticky; top: 0; }
.tableFixHead thead  tr:nth-child(2) th{ position: sticky; top: 28px; }
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
								
										<input type="number" min="1" max="20" id="adder_count" name="adder_count" value="" style=" width:90px; height:30px; position: relative; left: 5px;">
									    <a class="btn btn-default" id="adder"><i class="fa fa-plus"></i>신규  </a>
								
									    <!--a class="btn btn-primary" id="btn-delete-row"><i class="fa fa-plus"></i> 삭제 하기 </a -->
									    <a class="btn btn-warning" id="res"><i class="fa fa-floppy-o"></i> 신규저장 </a>
									    <a class="btn btn-primary" id="updateButton"><i class="fa fa-pencil " aria-hidden="true"></i> 수정 </a>
									
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
										<col style="width: 50px;"> 	<!--선택-->
										<col style="width: 100px;">	<!--WMS Code-->
										<col style="width: 110px;">	<!--품번-->
										<col style="width: 110px;">	<!--라벨품번-->
										<col style="width: 75px;">	<!--유라품번-->
										<col style="width: 160px;">	<!--품번유형-->   
										<col style="width: 160px;">	<!--제조사-->
										<col style="width: 90px;">	<!--구분-->
										<col style="width: 75px;">	<!--포장단위-->
										<col style="width: 50px;">	<!--PPQ--> 
										<col style="width: 50px;">	<!--MOQ-->
										<col style="width: 50px;">	<!--MPQ-->
										<col style="width: 50px;">	<!--BOX-->
										<col style="width: 75px;">
										<col style="width: 75px;">
										<col style="width: 50px;">	<!--ERP CODE-->
										<col style="width: 50px;">	
										<col style="width: 75px;">	<!--입고검사-->
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 70px;">
										<col style="width: 70px;">	
										<col style="width: 75px;">	<!--소자여부-->
										<col style="width: 75px;">	<!--사용유무-->
										<col style="width: 100px;">						<!-- 비고 -->
										<col style="width: 100px;">	<!-- 생성자 -->
										<col style="width: 90px;">	<!-- 생성일 -->
										<col style="width: 100px;">	<!-- 수정자 -->
										<col style="width: 90px;">	<!-- 수정일 -->
                                    </colgroup>
                                    <thead>
                                        <tr>
                                        	<th class ="fixedColum" rowspan="2">선택</th>
                                            <th rowspan="2">WMS Code</th>
                                            <th rowspan="2">품번</th>
                                            <th rowspan="2">라벨품번</th>
                                            <th rowspan="2">유라품번</th>
                                            <th rowspan="2">품번유형</th>
                                            <th rowspan="2">제조사</th>
                                            <th rowspan="2">구분</th>
                                            <th rowspan="2">포장단위</th>
                                            <th rowspan="2">PPQ</th>
											<th rowspan="2">MOQ</th>
											<th rowspan="2">MPQ</th>
											<th colspan="3">BOX</th>
											<th colspan="2">ERP CODE</th>
											<th colspan="5">입고검사</th>
											<th rowspan="2">소자여부</th>
											<th rowspan="2">사용유무</th>
											<th rowspan="2">비고</th>
											<th rowspan="2">생성자</th>
											<th rowspan="2">생성일</th>
											<th rowspan="2">수정자</th>
											<th rowspan="2">수정일</th>
										</tr>
										<tr>
											<th>SIZE</th>
											<th>VOLUME</th>
											<th>WIEIGHT</th>
											<th>HK</th>
											<th>SRT</th>
											<th>사용유무</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>기준횟수</th>
											<th>처리횟수</th>
										</tr>
                                    </thead>
                                    <tbody> 
								          
                                    </tbody>
                                </table>
                            </div>
                    		<div class="bottom_t">
                    			<div class='dataTables_paginate paging_full_numbers' id='DataTables_Table_0_paginate'>
	                    		</div>	
                    			<div class="dataTables_length">
									<label>전체 <span id="totalCount"></span>개 / 행 표시 : </label>
									<select id="plant" name="plant" class="form-control input-sm" style="display:inline-block">
										<option value="100">100</option>
										<option value="50">50</option>
										<option value="20">20</option>
										<option value="10">10</option>
									</select>
								</div>
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
//행 수가 변경될 때 이벤트 발생
$('#plant').change(function() {
	
	var selectedVal = $("#plant option:selected").val();
	
	$("#pageSize").val(selectedVal);
	setCookie( 'pageSize', selectedVal, 365);	//지정한 행값을 쿠키값으로 저장한다(공통함수).
	
	frmScanSubmit("1");
});

//페이지 이동 값 
function goPage(pageNo) {
	
	frmScanSubmit(pageNo);
}	
</script>

<script type="text/javascript">

//datetimepicker 변환시 이벤트 
$(document).on('change','.datetimepicker', function() {
	$('.datetimepicker').blur();
});

//코드종류 Select
var Select_array =  new Array();
var Select_list = "";

var Select_array_CUSTCD =  new Array(); 
var Select_list_CUSTCD = "";

var Select_array_CODE =  new Array(); 
var Select_list_CODE = "";

function frmScanSubmit(pageNo){	
	//Create an FormData object 
	$("#pageNo").val(pageNo);
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/partNumberMaster_08/partNumberMaster_08Select.do',
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
			$('#CUSTCD').html('<option value="">전체</option>');
			$("#TOTAL_COUNT").html('');
			$('#totalCount').html('');
			$('#DataTables_Table_0_paginate').html('');
			
			var list ="";
			var pagelist = "";
			var TOTAL_COUNT = "";
			Select_list_CUSTCD = "";
			Select_list_CODE = "";
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			
			
			//코드종류 Select
			Select_array_CUSTCD = data['Select_CUSTCD'];
			Select_array_CODE= data['Select_CODE'];
			
			for(var j = 0 ; j < Select_array_CUSTCD.length; j ++ ){
				Select_list_CUSTCD += "<option value="+Select_array_CUSTCD[j].CUSTCD+">"+Select_array_CUSTCD[j].CUSTNM+"</option>";
			}
			
			for(var j = 0 ; j < Select_array_CODE.length; j ++ ){
				Select_list_CODE += "<option value="+Select_array_CODE[j].CODE+">"+Select_array_CODE[j].CODENAME+"</option>";
			}
			
			var MATNR = "";
			
			for(var i = 0 ; i < data['list'].length ; i ++ ){
	
				MATNR = data['list'][i].MATNR;
				
						list += "<tr name='defaultTd'>"+
								"	<td class='text-align-center'>"+
								"		<label>"+
								"			<input type='checkbox' name='chk[]' id='"+MATNR+"' value='' onclick='check(this)'><span class='text'></span>"+
								"		</label>"+
								"    </td>"+
								"    <td value='"+ data['list'][i].MATNR +"' class='text-align-left'>"+ data['list'][i].MATNR +"</td>"+ //WMS코드			
								"    <td class='text-align-left'  style='word-break:break-all;' wrap='hard'>"+ data['list'][i].MAKTX +"</td>"+ //품번
								"    <td class='text-align-left'  style='word-break:break-all;' wrap='hard'>"+ data['list'][i].MAKTXLABEL +"</td>"+ //라벨품번
								"    <td class='text-align-center'>"+ data['list'][i].MAKTXYURA +"</td>"+ //유라품번
								"    <td class='text-align-left'>"+ data['list'][i].CODENAME +"</td>"+	//품번유형
								"    <td class='text-align-left'>"+ data['list'][i].CUSTNM +"</td>"+	//제조사
								"    <td class='text-align-left'>"+ data['list'][i].SPEC +"</td>"+			//구분
								"    <td class='text-align-right'>"+ data['list'][i].MEINS +"</td>"+		//포장단위
								"    <td class='text-align-right'>"+ data['list'][i].UMREZ +"</td>"+			//PPQ
								"    <td class='text-align-right'>"+ data['list'][i].MOQ +"</td>"+			//MOQ
								"    <td class='text-align-right'>"+ data['list'][i].MPQ +"</td>"+			//MPQ
								"    <td class='text-align-right'>"+ data['list'][i].BOXSIZE +"</td>"+		//BOX SIZE
								"    <td class='text-align-right'>"+ data['list'][i].BOXVOLUME +"</td>"+		//BOX VOLUME
								"    <td class='text-align-right'>"+ data['list'][i].BOXWEIGHT +"</td>"+		//BOX WEIGHT
								"    <td class='text-align-left'>"+ data['list'][i].ERPHKCODE +"</td>"+			//ERP CODE HK
								"    <td class='text-align-left'>"+ data['list'][i].ERPSRTCODE +"</td>"+		//ERP CODE SRT
								"    <td class='text-align-center'>"+ data['list'][i].INSPECTIONFLAG +"</td>"+	//입고검사 사용유무
								"    <td class='text-align-right'>"+ data['list'][i].INSPECTIONSDATE +"</td>"+	//입고검사 시작일
								"    <td class='text-align-right'>"+ data['list'][i].INSPECTIONEDATE +"</td>"+	//입고검사 종료일
								"    <td class='text-align-left'>"+ data['list'][i].INSPECTIONCOUNT +"</td>"+	//입고검사 기준횟수
								"    <td class='text-align-left'>"+ data['list'][i].INSPECTIONPROCCOUNT +"</td>"+	//입고검사 처리횟수 
								"    <td class='text-align-center'>"+ data['list'][i].ELEMENTFLAG +"</td>"+	//소자여부
								"    <td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+		//사용유무
								"    <td class='text-align-left'>"+ data['list'][i].REMARK +"</td>"+	//비고
								"    <td class='text-align-center'>"+ data['list'][i].MKUSER +"</td>"+	//생성자
								"    <td class='text-align-center'>"+ data['list'][i].MKDATE +"</td>"+	//생성일
								"    <td class='text-align-center'>"+ data['list'][i].MOUSER +"</td>"+	//수정자
								"    <td class='text-align-center'>"+ data['list'][i].MODATE +"</td>"+	//수정일
								"</tr>";
			}
			
			$('#mytable tbody').append(list);		
			$('#CUSTCD').append(Select_list_CUSTCD);
			$("#CUSTCD").val(data['map'].CUSTCD );

			$("#TOTAL_COUNT").append("전체 "+TOTAL_COUNT+"개");
			
			//스크롤 영역 
		    var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	$('html, #scroll').animate({//스크롤 위치 이동
			    scrollTop: scrollMove.top
			}, 0);
		
			
			//페이지 영역 
			var pageNo = data['paging'].pageNo;
			var firstPageNo = data['paging'].firstPageNo
			var prevPageNo = data['paging'].prevPageNo;
			var startPageNo = data['paging'].startPageNo;
			var endPageNo = data['paging'].endPageNo;
			var nextPageNo = data['paging'].nextPageNo;
			var finalPageNo = data['paging'].finalPageNo;
			var totalCount = data['paging'].totalCount;
			var pageSize = data['paging'].pageSize;
			
			 $("#pageNo").val(pageNo);
			 $('#plant').val(pageSize).prop("selected", true);	 
			 
				pagelist += "<ul class='pagination'>" 
				if( pageNo == firstPageNo){
					pagelist +="<li class='paginate_button first disabled'><a href='#' class='first'><i class='fa fa-angle-double-left'></i></a></li>"
					pagelist +="<li class='paginate_button previous disabled'><a href='#' class='prev'><i class='fa fa-angle-left'></i></a></li>"
				}else{
					pagelist +="<li class='paginate_button first'><a href='javascript:goPage("+firstPageNo+")' class='first'><i class='fa fa-angle-double-left'></i></a></li>"
					pagelist +="<li class='paginate_button previous'><a href='javascript:goPage("+prevPageNo+")' class='prev'><i class='fa fa-angle-left'></i></a></li>"
				}
			
				for(var i=startPageNo; i<endPageNo+1; i++){
					if( i == pageNo){
						pagelist +="<li class='paginate_button active'><a href='javascript:goPage("+i+")' class='selected'>"+i+"</a></li>"
					}else{
						pagelist +="<li class='paginate_button '><a href='javascript:goPage("+i+")'>"+i+"</a></li>"
					}
				}			

				if( pageNo == finalPageNo){
					pagelist +=	"<li class='paginate_button next disabled'><a href='#' class='next'><i class='fa fa-angle-right'></i></a></li>"
					pagelist +=	"<li class='paginate_button last disabled'><a href='#' class='last'><i class='fa fa-angle-double-right'></i></a></li>"
				}else{
					pagelist +="<li class='paginate_button next'><a href='javascript:goPage("+nextPageNo+")' class='next'><i class='fa fa-angle-right'></i></a></li>"
					pagelist +="<li class='paginate_button last'><a href='javascript:goPage("+finalPageNo+")' class='last'><i class='fa fa-angle-double-right'></i></a></li>"
				}				
			pagelist +="</ul>";
			$('#DataTables_Table_0_paginate').append(pagelist);
			$('#totalCount').append(totalCount);

		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}


//행 CUSTCD Select 변환 함수
var appendSelect_array_CUSTCD = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_CUSTCD.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_CUSTCD[i].CUSTCD);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_CUSTCD[i].CUSTNM ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_CUSTCD[i].CUSTNM){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}


//행 CODE Select 변환 함수
var appendSelect_array_CODE = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_CODE.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_CODE[i].CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_CODE[i].CODENAME ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_CODE[i].CODENAME){
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
		$("tbody input:checkbox").prop("checked", true);		
	}else{
		$("tbody input:checkbox").prop("checked", false);
	}

	//1. 체크박스 전체 체크
	if (chkAll){

			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				 td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
			
				 td0 = td.nextElementSibling; 	//WMS 
				 td1 = td0.nextElementSibling;	//품번
				 td2 = td1.nextElementSibling;	//라벨품번
				 td3 = td2.nextElementSibling;	//유라품번
				 td4 = td3.nextElementSibling;	//품번유형
				 td5 = td4.nextElementSibling;	//제조사
				 td6 = td5.nextElementSibling;	//구분
				 td7 = td6.nextElementSibling;	//포장단위
				 td8 = td7.nextElementSibling;	//PPQ
				 td9 = td8.nextElementSibling;	//MOQ
				 td10 = td9.nextElementSibling;	//MPQ
				 td11 = td10.nextElementSibling;	//BOX: SIZE
				 td12 = td11.nextElementSibling;	//BOX: VOLUME
				 td13 = td12.nextElementSibling;	//BOX: WIEGHT
				 td14 = td13.nextElementSibling;	//ERP CODE: HK
				 td15 = td14.nextElementSibling;	//ERP CODE: SRT
				 td16 = td15.nextElementSibling;	//입고검사: 사용유무
				 td17 = td16.nextElementSibling;	//입고검사: 시작일
				 td18 = td17.nextElementSibling;	//입고검사: 종료일
				 td19 = td18.nextElementSibling; //입고검사: 기준횟수
				 td20 = td19.nextElementSibling; //입고검사: 처리횟수	
				 td21 = td20.nextElementSibling; //소자여부
				 td22 = td21.nextElementSibling; //사용유무
				 td23 = td22.nextElementSibling; //비고
				
				var mail_arr = 	[
									//{ yesCheck: appendInput, 				column: td0}, 	//WMS 
									{  yesCheck: appendInput, 				column: td1}, 	//품번
									{  yesCheck: appendInput, 				column: td2},  	//라벨품번		
									{  yesCheck: appendInput, 				column: td3},  	//유라품번 		
									{  yesCheck: appendSelect_array_CODE, 	column: td4},  	//품번유형			(select)	 	
									{  yesCheck: appendSelect_array_CUSTCD, column: td5},  	//제조사  			(select)	
									{  yesCheck: appendInput, 				column: td6},  	//구분		
									{  yesCheck: appendInput, 				column: td7},  	//포장단위		
									{  yesCheck: appendInput, 				column: td8},  	//PPQ		
									{  yesCheck: appendInput, 				column: td9},  	//MOQ		
									{  yesCheck: appendInput, 				column: td10},  //MPQ		
									{  yesCheck: appendInput, 				column: td11},  //BOX: SIZE		
									{  yesCheck: appendInput, 				column: td12},  //BOX: VOLUME		
									{  yesCheck: appendInput,				column: td13},  //BOX: WIEGHT		
									{  yesCheck: appendInput,				column: td14},  //ERP CODE: HK		
									{  yesCheck: appendInput, 				column: td15},  //ERP CODE: SRT		
									{  yesCheck: appendSelect, 				column: td16},  //입고검사: 사용유무	(Y or N select)		
									{  yesCheck: appendDatetimepicker, 		column: td17},  //입고검사: 시작일	(달력)
									{  yesCheck: appendDatetimepicker,		column: td18},  //입고검사: 종료일	(달력) 	
									{  yesCheck: appendInput, 				column: td19},  //입고검사: 기준횟수		
									{  yesCheck: appendInput, 				column: td20},  //입고검사: 처리횟수			
									{  yesCheck: appendSelect, 				column: td21},  //소자여부			(Y or N select)			
									{  yesCheck: appendSelect, 				column: td22},  //사용유무			(Y or N select)		
									{  yesCheck: appendInput, 				column: td23}   //비고		
								];					


				//4. input 태그 여부 확인
				inputValue = td16.childNodes[0].value; 
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
		
			 td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
			 td0 = td.nextElementSibling; 	//WMS 
			 td1 = td0.nextElementSibling;	//품번
			 td2 = td1.nextElementSibling;	//라벨품번
			 td3 = td2.nextElementSibling;	//유라품번
			 td4 = td3.nextElementSibling;	//품번유형
			 td5 = td4.nextElementSibling;	//제조사
			 td6 = td5.nextElementSibling;	//구분
			 td7 = td6.nextElementSibling;	//포장단위
			 td8 = td7.nextElementSibling;	//PPQ
			 td9 = td8.nextElementSibling;	//MOQ
			 td10 = td9.nextElementSibling;	//MPQ
			 td11 = td10.nextElementSibling;	//BOX: SIZE
			 td12 = td11.nextElementSibling;	//BOX: VOLUME
			 td13 = td12.nextElementSibling;	//BOX: WIEGHT
			 td14 = td13.nextElementSibling;	//ERP CODE: HK
			 td15 = td14.nextElementSibling;	//ERP CODE: SRT
			 td16 = td15.nextElementSibling;	//입고검사: 사용유무
			 td17 = td16.nextElementSibling;	//입고검사: 시작일
			 td18 = td17.nextElementSibling;	//입고검사: 종료일
			 td19 = td18.nextElementSibling; //입고검사: 기준횟수
			 td20 = td19.nextElementSibling; //입고검사: 처리횟수	
			 td21 = td20.nextElementSibling; //소자여부
			 td22 = td21.nextElementSibling; //사용유무
			 td23 = td22.nextElementSibling; //비고
			
			var mail_arr = 	[
								//{noCheck: appendText,  		column: td0}, 	//WMS 
								{  noCheck: appendText,  		column: td1}, 	//품번
								{  noCheck: appendText,  		column: td2},  	//라벨품번		
								{  noCheck: appendText,  		column: td3},  	//유라품번 		
								{  noCheck: appendSelectText,  	column: td4},  	//품번유형			(select)	 	
								{  noCheck: appendSelectText,  	column: td5},  	//제조사  			(select)	
								{  noCheck: appendText,  		column: td6},  	//구분		
								{  noCheck: appendText,  		column: td7},  	//포장단위		
								{  noCheck: appendText,  		column: td8},  	//PPQ		
								{  noCheck: appendText,  		column: td9},  	//MOQ		
								{  noCheck: appendText,  		column: td10},  //MPQ		
								{  noCheck: appendText,  		column: td11},  //BOX: SIZE		
								{  noCheck: appendText,  		column: td12},  //BOX: VOLUME		
								{  noCheck: appendText,  		column: td13},  //BOX: WIEGHT		
								{  noCheck: appendText,  		column: td14},  //ERP CODE: HK		
								{  noCheck: appendText,  		column: td15},  //ERP CODE: SRT		
								{  noCheck: appendText,  		column: td16},  //입고검사: 사용유무	(Y or N select)		
								{  noCheck: appendText,  		column: td17},  //입고검사: 시작일	(달력)
								{  noCheck: appendText,  		column: td18},  //입고검사: 종료일	(달력) 	
								{  noCheck: appendText,  		column: td19},  //입고검사: 기준횟수		
								{  noCheck: appendText,  		column: td20},  //입고검사: 처리횟수			
								{  noCheck: appendText,  		column: td21},  //소자여부			(Y or N select)			
								{  noCheck: appendText,  		column: td22},  //사용유무			(Y or N select)		
								{  noCheck: appendText,  		column: td23}   //비고		
							];		

			
			//4. input 태그 여부 확인
			inputValue = td16.childNodes[0].value; 
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
	
	td0 = td.nextElementSibling; 	//WMS 
	td1 = td0.nextElementSibling;	//품번
	td2 = td1.nextElementSibling;	//라벨품번
	td3 = td2.nextElementSibling;	//유라품번
	td4 = td3.nextElementSibling;	//품번유형
	td5 = td4.nextElementSibling;	//제조사
	td6 = td5.nextElementSibling;	//구분
	td7 = td6.nextElementSibling;	//포장단위
	td8 = td7.nextElementSibling;	//PPQ
	td9 = td8.nextElementSibling;	//MOQ
	td10 = td9.nextElementSibling;	//MPQ
	td11 = td10.nextElementSibling;	//BOX: SIZE
	td12 = td11.nextElementSibling;	//BOX: VOLUME
	td13 = td12.nextElementSibling;	//BOX: WIEGHT
	td14 = td13.nextElementSibling;	//ERP CODE: HK
	td15 = td14.nextElementSibling;	//ERP CODE: SRT
	td16 = td15.nextElementSibling;	//입고검사: 사용유무
	td17 = td16.nextElementSibling;	//입고검사: 시작일
	td18 = td17.nextElementSibling;	//입고검사: 종료일
	td19 = td18.nextElementSibling; //입고검사: 기준횟수
	td20 = td19.nextElementSibling; //입고검사: 처리횟수	
	td21 = td20.nextElementSibling; //소자여부
	td22 = td21.nextElementSibling; //사용유무
	td23 = td22.nextElementSibling; //비고
	
	var mail_arr = 	[
						//{ yesCheck: appendInput, 					noCheck: appendText,  		column: td0}, 	//WMS 
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td1}, 	//품번
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td2},  	//라벨품번		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td3},  	//유라품번 		
						{  yesCheck: appendSelect_array_CODE, 		noCheck: appendSelectText,  column: td4},  	//품번유형			(select)	 	
						{  yesCheck: appendSelect_array_CUSTCD, 	noCheck: appendSelectText,  column: td5},  	//제조사  			(select)	
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td6},  	//구분		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td7},  	//포장단위		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td8},  	//PPQ		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td9},  	//MOQ		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td10},  //MPQ		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td11},  //BOX: SIZE		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td12},  //BOX: VOLUME		
						{  yesCheck: appendInput,					noCheck: appendText,  		column: td13},  //BOX: WIEGHT		
						{  yesCheck: appendInput,					noCheck: appendText,  		column: td14},  //ERP CODE: HK		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td15},  //ERP CODE: SRT		
						{  yesCheck: appendSelect, 					noCheck: appendText,  		column: td16},  //입고검사: 사용유무	(Y or N select)		
						{  yesCheck: appendDatetimepicker, 			noCheck: appendText,  		column: td17},  //입고검사: 시작일	(달력)
						{  yesCheck: appendDatetimepicker,			noCheck: appendText,  		column: td18},  //입고검사: 종료일	(달력) 	
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td19},  //입고검사: 기준횟수		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td20},  //입고검사: 처리횟수			
						{  yesCheck: appendSelect, 					noCheck: appendText,  		column: td21},  //소자여부			(Y or N select)			
						{  yesCheck: appendSelect, 					noCheck: appendText,  		column: td22},  //사용유무			(Y or N select)		
						{  yesCheck: appendInput, 					noCheck: appendText,  		column: td23}   //비고		
					];					

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
		mail_arr.splice(19, 1); //(처리횟수 삭제)
		
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

	var adder_count = $('#adder_count').val();
	
	for(var i=0; i<adder_count; i++){
		
		$('#mytable > tbody:last').append(
			'<tr name="mytr">'+
				//선택
				'<td class="text-align-center" style="background-color: gold;">'+
					'<label>'+
						'<input type="checkbox" name="chk[]" value="" onclick="check(this)"><span class="text"></span>'+
					'</label>'+
			    '</td>'+
			    
				//WMS Code
				'<td class="text-align-left"></td>'+
				
				//품번
				'<td class="text-align-left" style="background-color: gold; word-break:break-all;" wrap="hard"><input type="text" value="" style="width:100%; height:31px;"></td>'+
				
				//라벨품번 
				'<td class="text-align-left" style="background-color: gold; word-break:break-all;" wrap="hard"><input type="text" value="" style="width:100%; height:31px;"></td>'+
				
				//유라품번 
				'<td class="text-align-center" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
				
				//품번유형 	
				'<td class="text-align-left" style="background-color:gold;">'+
					'<select type="text" value="" style="width:100%;" >'+
						Select_list_CODE+
					'</select>'+
				'</td>'+
				
				//제조사 	
				'<td class="text-align-left" style="background-color:gold;">'+
					'<select type="text" value="" style="width:100%;" >'+
						Select_list_CUSTCD+
					'</select>'+
				'</td>'+
				
				//구분
				'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//포장단위 
				'<td class="text-align-right" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//PPQ
				'<td class="text-align-right" style="background-color: gold;"><input type="number" min="0" max="9999" value="0" style="width:100%; height:31px;"></td>'+

				//MOQ
				'<td class="text-align-right" style="background-color: gold;"><input type="number" min="0" max="9999" value="0" style="width:100%; height:31px;"></td>'+

				//MPQ
				'<td class="text-align-right" style="background-color: gold;"><input type="number" min="0" max="9999" value="0" style="width:100%; height:31px;"></td>'+

				//BOX: SIZE
				'<td class="text-align-right" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//BOX: VOLUME
				'<td class="text-align-right" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//BOX: WIEGHT
				'<td class="text-align-right" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//ERP CODE: HK
				'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//ERP CODE: SRT
				'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//입고검사: 사용유무 	
				'<td class="text-align-center" style="background-color: gold;">'+
					'<select type="text" value="Y" style="width:100%;">'+
						'<option value="Y">Y</option>'+
						'<option value="N" selected="selected">N</option>'+
					'</select>'+
				'</td>'+
				
				//입고검사: 시작일  	
				'<td class="text-align-right" style="background-color: gold;"><input value="" class="form-control datetimepicker" type="text" data-date-format="YYYYMMDD" style="width:100%; height:31px;"></td>'+

				//입고검사: 종료일 
				'<td class="text-align-right" style="background-color: gold;"><input value="" class="form-control datetimepicker" type="text" data-date-format="YYYYMMDD" style="width:100%; height:31px;"></td>'+

				//입고검사: 기준횟수  
				'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
				
				//입고검사: 처리횟수
				'<td class="text-align-center"></td>'+

				//소자여부 
				'<td class="text-align-center" style="background-color: gold;">'+
					'<select type="text" value="Y" style="width:100%;">'+
						'<option value="Y">Y</option>'+
						'<option value="N" selected="selected">N</option>'+
					'</select>'+
				'</td>'+
				
				//사용유무 
				'<td class="text-align-center" style="background-color: gold;">'+
					'<select type="text" value="Y" style="width:100%;">'+
						'<option value="Y" selected="selected">Y</option>'+
						'<option value="N">N</option>'+
					'</select>'+
				'</td>'+
				
				//비고
				'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

				//생성일시, 생성자, 수정일시, 수정자
				'<td class="text-align-center"></td>'+
				'<td class="text-align-center"></td>'+
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
	
	}
	

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

		var td0 = td.next(); 	//WMS 
		var td1 = td0.next();	//품번
		var td2 = td1.next();	//라벨품번		
		var td3 = td2.next();	//유라품번 		
		var td4 = td3.next();	//품번유형			(select)	 	
		var td5 = td4.next();	//제조사  			(select)	
		var td6 = td5.next();	//구분		
		var td7 = td6.next();	//포장단위		
		var td8 = td7.next();	//PPQ		
		var td9 = td8.next();	//MOQ		
		var td10 = td9.next();	//MPQ		
		var td11 = td10.next();	//BOX: SIZE		
		var td12 = td11.next();	//BOX: VOLUME		
		var td13 = td12.next();	//BOX: WIEGHT		
		var td14 = td13.next();	//ERP CODE: HK		
		var td15 = td14.next();	//ERP CODE: SRT		
		var td16 = td15.next();	//입고검사: 사용유무	(Y or N select)		
		var td17 = td16.next();	//입고검사: 시작일	(달력)
		var td18 = td17.next();	//입고검사: 종료일	(달력) 	
		var td19 = td18.next(); //입고검사: 기준횟수		
		var td20 = td19.next(); //입고검사: 처리횟수			
		var td21 = td20.next(); //소자여부			(Y or N select)		
		var td22 = td21.next(); //사용유무			(Y or N select)		
		var td23 = td22.next(); //비고		
	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT 			: "100",    //클라이언트
				MATNR 			:  "",  //WMS코드
				MAKTX 			:  trim(td1.eq(i).children().val()),  //품번
				MAKTXLABEL		:  trim(td2.eq(i).children().val()),  //라벨품번
				MAKTXYURA		:  trim(td3.eq(i).children().val()),  //유라품번
				MTART 			:  td4.eq(i).children().val(),  //품번유형(select)	 
				CUSTCD			:  td5.eq(i).children().val(),  //제조사	(select)	
				SPEC			:  trim(td6.eq(i).children().val()),  //구분
				MEINS			:  td7.eq(i).children().val(),  //포장단위
				UMREZ			:  td8.eq(i).children().val(),  //PPQ
				MOQ				:  td9.eq(i).children().val(),  //MOQ
				MPQ				:  td10.eq(i).children().val(),  //MPQ
				BOXSIZE			:  td11.eq(i).children().val(),  //BOX SIZE
				BOXVOLUME		:  td12.eq(i).children().val(),  //BOX VOLUME
				BOXWEIGHT		:  td13.eq(i).children().val(),  //BOX WEIGHT
				ERPHKCODE		:  td14.eq(i).children().val(),  //ERP CODE HK
				ERPSRTCODE		:  td15.eq(i).children().val(),  //ERP CODE SRT
				INSPECTIONFLAG	:  td16.eq(i).children().val(),  //입고검사 사용유무 (Y or N select)		
				INSPECTIONSDATE	:  td17.eq(i).children().val(),  //입고검사 시작일  (달력)
				INSPECTIONEDATE	:  td18.eq(i).children().val(),  //입고검사 종료일  (달력) 	
				INSPECTIONCOUNT	:  td19.eq(i).children().val(),  //입고검사 기준횟수
				ELEMENTFLAG		:  td21.eq(i).children().val(),  //소자여부		(Y or N select)		
				USEFLAG			:  td22.eq(i).children().val(),  //사용유무		(Y or N select)		
				REMARK			:  td23.eq(i).children().val(),  //비고
				USERID 			:  user,   						//사용자
				NEWFLAG 		:  "Y"    						//신규여부
			});

			//공백 validation 체크 
			if(insertArray[i].MAKTX == ""){
				alert("거래처품번이 공백입니다.");
				save_chk = false;
				break;
			};
	
			if(insertArray[i].MAKTXLABEL == ""){
				alert("라벨품번이 공백입니다.");
				save_chk = false;
				break;
			};
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/partNumberMaster_08InsertUpdate.do",
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

		 					$('#CUSTCD').val("");
		 					$('#MATNR').val("");
		 					$('#USEFLAG').val("Y");
		 					$('#MAKTX').val("");
		 					
		 				 	$('#orderby').val('MKDATE');
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

		var td0 = td.next(); 	//WMS 
		var td1 = td0.next();	//품번
		var td2 = td1.next();	//라벨품번		
		var td3 = td2.next();	//유라품번 		
		var td4 = td3.next();	//품번유형			(select)	 	
		var td5 = td4.next();	//제조사  			(select)	
		var td6 = td5.next();	//구분		
		var td7 = td6.next();	//포장단위		
		var td8 = td7.next();	//PPQ		
		var td9 = td8.next();	//MOQ		
		var td10 = td9.next();	//MPQ		
		var td11 = td10.next();	//BOX: SIZE		
		var td12 = td11.next();	//BOX: VOLUME		
		var td13 = td12.next();	//BOX: WIEGHT		
		var td14 = td13.next();	//ERP CODE: HK		
		var td15 = td14.next();	//ERP CODE: SRT		
		var td16 = td15.next();	//입고검사: 사용유무	(Y or N select)		
		var td17 = td16.next();	//입고검사: 시작일	(달력)
		var td18 = td17.next();	//입고검사: 종료일	(달력) 	
		var td19 = td18.next(); //입고검사: 기준횟수		
		var td20 = td19.next(); //입고검사: 처리횟수			
		var td21 = td20.next(); //소자여부			(Y or N select)		
		var td22 = td21.next(); //사용유무			(Y or N select)		
		var td23 = td22.next(); //비고		
	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT 			: "100",    //클라이언트
				MATNR 			:  td0.eq(i).text(),  //WMS코드
				MAKTX 			:  trim(td1.eq(i).children().val()),  //품번
				MAKTXLABEL		:  trim(td2.eq(i).children().val()),  //라벨품번
				MAKTXYURA		:  trim(td3.eq(i).children().val()),  //유라품번
				MTART 			:  td4.eq(i).children().val(),  //품번유형(select)	 
				CUSTCD			:  td5.eq(i).children().val(),  //제조사	(select)	
				SPEC			:  trim(td6.eq(i).children().val()),  //구분
				MEINS			:  td7.eq(i).children().val(),  //포장단위
				UMREZ			:  td8.eq(i).children().val(),  //PPQ
				MOQ				:  td9.eq(i).children().val(),  //MOQ
				MPQ				:  td10.eq(i).children().val(),  //MPQ
				BOXSIZE			:  td11.eq(i).children().val(),  //BOX SIZE
				BOXVOLUME		:  td12.eq(i).children().val(),  //BOX VOLUME
				BOXWEIGHT		:  td13.eq(i).children().val(),  //BOX WEIGHT
				ERPHKCODE		:  td14.eq(i).children().val(),  //ERP CODE HK
				ERPSRTCODE		:  td15.eq(i).children().val(),  //ERP CODE SRT
				INSPECTIONFLAG	:  td16.eq(i).children().val(),  //입고검사 사용유무 (Y or N select)		
				INSPECTIONSDATE	:  td17.eq(i).children().val(),  //입고검사 시작일  (달력)
				INSPECTIONEDATE	:  td18.eq(i).children().val(),  //입고검사 종료일  (달력) 	
				INSPECTIONCOUNT	:  td19.eq(i).children().val(),  //입고검사 기준횟수
				ELEMENTFLAG		:  td21.eq(i).children().val(),  //소자여부		(Y or N select)		
				USEFLAG			:  td22.eq(i).children().val(),  //사용유무		(Y or N select)		
				REMARK			:  td23.eq(i).children().val(),  //비고
				USERID 			:  user,   						//사용자
				NEWFLAG 		:  ""    						//신규여부
			});

			//공백 validation 체크 
			if(insertArray[i].MAKTX == ""){
				alert("거래처품번이 공백입니다.");
				save_chk = false;
				break;
			};
	
			if(insertArray[i].MAKTXLABEL == ""){
				alert("라벨품번이 공백입니다.");
				save_chk = false;
				break;
			};	
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
				url:"/WMS/Standard_infomation_1/partNumberMaster_08InsertUpdate.do",
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

		 					$('#CUSTCD').val("");
		 					$('#MATNR').val("");
		 					$('#USEFLAG').val("Y");
		 					$('#MAKTX').val("");
		 					
		 				 	$('#orderby').val('MODATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
							
			 				/*
							//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
				 					
									var keyValue = json.value[i].MATNR;
				 					$("#"+keyValue).trigger('click');
									
									var td = $("#"+keyValue);
									var td0 = td.parent().parent().next();	//WMS 
									var td1 = td0.next();	//품번
									var td2 = td1.next();	//라벨품번		
									var td3 = td2.next();	//유라품번 		
									var td4 = td3.next();	//품번유형			(select)	 	
									var td5 = td4.next();	//제조사  			(select)	
									var td6 = td5.next();	//구분		
									var td7 = td6.next();	//포장단위		
									var td8 = td7.next();	//PPQ		
									var td9 = td8.next();	//MOQ		
									var td10 = td9.next();	//MPQ		
									var td11 = td10.next();	//BOX: SIZE		
									var td12 = td11.next();	//BOX: VOLUME		
									var td13 = td12.next();	//BOX: WIEGHT		
									var td14 = td13.next();	//ERP CODE: HK		
									var td15 = td14.next();	//ERP CODE: SRT		
									var td16 = td15.next();	//입고검사: 사용유무	(Y or N select)	
									var td17 = td16.next();	//입고검사: 시작일	(달력)
									var td18 = td17.next();	//입고검사: 종료일	(달력) 	
									var td19 = td18.next(); //입고검사: 기준횟수		
									var td20 = td19.next(); //입고검사: 처리횟수			
									var td21 = td20.next(); //소자여부			(Y or N select)	
                                    var td22 = td21.next(); //사용유무			(Y or N select)	
                                    var td23 = td22.next(); //비고	

																						
									td1.children().val(json.value[i].MAKTX); 			//품번
									td2.children().val(json.value[i].MAKTXLABEL);		//라벨품번		
									td3.children().val(json.value[i].MAKTXYURA);		//유라품번 		
									td4.children().val(json.value[i].MTART); 			//품번유형			(select)	 	
									td5.children().val(json.value[i].CUSTCD);			//제조사  			(select)	
									td6.children().val(json.value[i].SPEC);			    //구분		
									td7.children().val(json.value[i].MEINS);			//포장단위		
									td8.children().val(json.value[i].UMREZ);			//PPQ		
									td9.children().val(json.value[i].MOQ);				//MOQ		
									td10.children().val(json.value[i].MPQ);				//MPQ		
									td11.children().val(json.value[i].BOXSIZE);		    //BOX: SIZE		
									td12.children().val(json.value[i].BOXVOLUME);		//BOX: VOLUME		
									td13.children().val(json.value[i].BOXWEIGHT);		//BOX: WIEGHT		
									td14.children().val(json.value[i].ERPHKCODE);		//ERP CODE: HK		
									td15.children().val(json.value[i].ERPSRTCODE);		//ERP CODE: SRT		
									td16.children().val(json.value[i].INSPECTIONFLAG);	//입고검사: 사용유무	(Y or N select)	
									td17.children().val(json.value[i].INSPECTIONSDATE);  //입고검사: 시작일	(달력)
									td18.children().val(json.value[i].INSPECTIONEDATE);  //입고검사: 종료일	(달력) 	
									td19.children().val(json.value[i].INSPECTIONCOUNT);  //입고검사: 기준횟수		
									td21.children().val(json.value[i].ELEMENTFLAG);	    //소자여부			(Y or N select)		
									td22.children().val(json.value[i].USEFLAG);		    //사용유무			(Y or N select)		
									td23.children().val(json.value[i].REMARK);		    //비고								
				 					
				 				}                                                       
				 				
				 				//스크롤 영역
				 				
				 				var specifiedSize  = $("#"+json.value[0].MATNR).offset().top - 400; //지정된 사이즈 
				 			    var scrollMove = {top:specifiedSize, left:240}; //스크롤 맨 밑 위치 
				 			   
				 			    $('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
				 				
			 				}//유효성 검사에 막힌 데이터 반환  끝
			 				*/
		 				}
		 			}	
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
});

</script>



<script type="text/javascript">	

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {

	if(getParameterByName("MANDT") != ""){
    	$('#searchButton').trigger('click');
    	get_query();
    }
	
	$('#searchButton').trigger('click');
	$('#adder_count').val('1');
	
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