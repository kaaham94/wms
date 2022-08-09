<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 입고현황 -->   
<%@ include file ="/WEB-INF/views/include/include_tap.jsp" %>
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					
					
						<div class="search_box">
							<div class="search_box_sub">  
							<form name='search' id='search'>
								<input type="hidden" id="MANDT" name="MANDT" value="100" />
								<input type="hidden" id="USERID" name="USERID" value="" />
								<input type="hidden" id="pageNo" name="pageNo" value="" />
								<input type="hidden" id="pageSize" name="pageSize" value="" />
								<input type="hidden" id="SDATE" name="SDATE" value="" />
								<input type="hidden" id="EDATE" name="EDATE" value="" />
										
								<div class="col-sm-3">   
                                    <div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">입고일</span>
										</span>
										<div id="reportrange" class="input-sm btn_daterange2 form-control">
											<span class="txt_date"></span>
										</div>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">품번</span>
										</span>
										<input type="text" id="MAKTX" name="MAKTX" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">공급처</span>
										</span>
										<select id="LIFNR" name="LIFNR" class="form-control" style="">
											
										</select>
									</div>
								</div>		
								
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
											<span class="form-control" style="width:100px;">요청번호</span>
										</span>
										<input type="text" id="EBELN" name="EBELN" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">제조사</span>
										</span>
										<select id="KUNNR" name="KUNNR" class="form-control" style="">
											
										</select>
									</div>
								</div>
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">저장위치</span>
										</span>
										<select id="LGORT" name="LGORT" class="form-control" style="">
										
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">입고유형</span>
										</span>
										<select id="BSART" name="BSART" class="form-control" style="">
										
										</select>
									</div>
								</div>
								
								<div class="col-sm-1">
									
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
.tableFixHead thead th { position: sticky; top: 0; }

input[type=checkbox] { width: 5px; height: 1px; position: static;}
input[type=checkbox] + .text { position: static;}

.tableFixHead td,.tableFixHead th {
 /*  width: 300px;*/
  border: 1px solid #000;
  width: 100px;
}

.tableFixHead table {
  table-layout: fixed;
  /*border-collapse:separate;*/
  border-spacing: 0px;
}

.textFixing {
  display: inline-block;
  position: sticky;
  top: 270px;
  /*width: 80px; */
  /*height: 90px; */
  /*background: blue;*/
}

</style>
						
                        
						<div class="widget ">  
							<div class="widget-header">
								<div class="widget-buttons" style="display: block">
									<div class="pull-left">
									
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
                                        <col style="width: 110px;">
										<col style="width: 130px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">   
										<col style="width: 130px;">   
										<col style="width: 90px;">   
										<col style="width: 90px;">   
										<col style="width: 90px;">   
										<col style="width: 120px;">   
										<col style="width: 120px;">   
										<col style="width: 120px;">   
										<col style="width: 110px;"> 
										<col style="width: 110px;">   
										<col style="width: 110px;">    
                                    </colgroup>
                                    <thead>
                                        <tr>
	                                    	<th>법인</th>
	                                        <th>저장위치</th>
	                                        <th>입고일자</th>
	                                        <th>입고유형</th>
	                                        <th>입고구분</th>
	                                        <th>제조사</th>
	                                        <th>품번</th>
	                                        <th>박스당 수량</th>
	                                        <th>박스수</th>
	                                        <th>총수량</th>
	                                        <th>공급처</th>
	                                        <th>출고예정처</th>
	                                        <th>입고 요청번호</th>
	                                        <th>입고 요청순번</th>
	                                        <th>출고 요청번호</th>
	                                        <th>출고 요청순번</th>
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
										<option value="500">500</option>
										<option value="300">300</option>
										<option value="100">100</option>
									
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

//저장위치 Select 
var Select_array_LGORT = new Array();		
var Select_list_LGORT = "";

function LGORT(MANDT, WERKS){
	//Create an FormData object 
	var params =  "MANDT=" + MANDT + "&WERKS=" + WERKS;
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_LGORT.do',
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
			$('#LGORT').html('');
			
			for(var j = 0 ; j < Select_array_LGORT.length; j ++ ){
				Select_list_LGORT += "<option value="+Select_array_LGORT[j].LGORT+">"+Select_array_LGORT[j].SLNAME+"</option>";
			}
			$('#LGORT').append(Select_list_LGORT);		
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}	


//법인 콤보박스에 따른 저장위치(LGORT) 콤보박스 불러오기
$(document).on('click','[id="WERKS"]',function(e){
	
		var MANDT = $('#MANDT').val();
		LGORT(MANDT, e.target.value)
	
});	


function frmScanSubmit(pageNo){	
	//Create an FormData object 
	$("#pageNo").val(pageNo);
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatus_02Select.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			$('#mytable tbody').html('');
			$("#TOTAL_COUNT").append(TOTAL_COUNT);
			$("#WERKS").html(''); //법인
			$("#BSART").html(''); //입고유형
			$("#LIFNR").html(''); //공급처(=공급업체)
			$("#KUNNR").html(''); //제조사
			
			$('#totalCount').html('');
			$('#DataTables_Table_0_paginate').html('');
			var TOTAL_COUNT = "";
	
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			
			var list ="";
			var pagelist = "";
			var rowspan = "";
			
			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
			
			var Select_array_LIFNR =  new Array(); 		//공급처 
			var Select_list_LIFNR = "";
			
			var Select_array_BSART =  new Array(); 		//입고유형 
			var Select_list_BSART = "";
			
			var Select_array_KUNNR =  new Array(); 		//제조사 
			var Select_list_KUNNR = "";
			
			
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			
			Select_array_LIFNR = data['Select_LIFNR'];
			for(var j = 0 ; j < Select_array_LIFNR.length; j ++ ){
				Select_list_LIFNR += "<option value="+Select_array_LIFNR[j].CUSTCD+">"+Select_array_LIFNR[j].CUSTNM+"</option>";
			}
			
			Select_array_BSART = data['Select_BSART'];
			Select_list_BSART = "<option value=''></option>"
			for(var j = 0 ; j < Select_array_BSART.length; j ++ ){
				Select_list_BSART += "<option value="+Select_array_BSART[j].CODE+">"+Select_array_BSART[j].CODENAME+"</option>";
			}
			
			Select_array_KUNNR = data['Select_KUNNR'];
			for(var j = 0 ; j < Select_array_KUNNR.length; j ++ ){
				Select_list_KUNNR += "<option value="+Select_array_KUNNR[j].CUSTCD+">"+Select_array_KUNNR[j].CUSTNM+"</option>";
			}
			
			var rowspan ="";
			var rowspan2 ="";
			var rowspan3 ="";
			var rowspan4 ="";
			var rowspan5 ="";
			var rowspan6 ="";
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//법인
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top;' class='text-align-center' style=' background-color: #f9f9f9; font-size:17px;' rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].WERKSNM +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//저장위치
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top;' class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].LGORTNM +"</b></td>" 

				}else{
					rowspan2 ="";
				}
				
				//저장위치
				if(data['list'][i].rowspan3 !== undefined){
					rowspan3 = "<td style='vertical-align:top;' class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan3+"'><b class='textFixing'>"+ data['list'][i].SUDAT +"</b></td>" 

				}else{
					rowspan3 ="";
				}
				
			
				list = "<tr name='defaultTd'>"+
							rowspan +	//법인
							rowspan2 +	//저장위치
							rowspan3 +	//입고일자
							"<td class='text-align-center'>"+ data['list'][i].BSARTNM +"</td>"+ //입고유형
							"<td class='text-align-center'>"+ data['list'][i].BWARTNM +"</td>"+ //입고구분
							"<td class='text-align-center'>"+ data['list'][i].CUSTNM +"</td>"+ //제조사
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+ data['list'][i].MAKTX +"</td>"+ //품번
							"<td class='text-align-center'>"+ data['list'][i].BCQTY +"</td>"+ //박스당 수량 
							"<td class='text-align-center'>"+ data['list'][i].BOXCNT +"</td>"+ //박스 수
							"<td class='text-align-center'>"+ data['list'][i].TOTALQTY +"</td>"+ //총수량
							"<td class='text-align-center'>"+ data['list'][i].LIFNRNM +"</td>"+ //공급처 
							"<td class='text-align-center'>"+ data['list'][i].KUNNRNM +"</td>"+ //출고예정처 
							"<td class='text-align-center'>"+ data['list'][i].EBELN +"</td>"+ //입고 요청번호 
							"<td class='text-align-center'>"+ data['list'][i].EBELP +"</td>"+ //입고 요청순번 
							"<td class='text-align-center'>"+ data['list'][i].VBELN +"</td>"+ //출고 요청번호 
							"<td class='text-align-center'>"+ data['list'][i].POSNR +"</td>"+ //출고 요청순번
						
						"</tr>";
			
				$('#mytable tbody').append(list);
			
			}
			
			
			$('#WERKS').append(Select_list_WERKS); //법인
			$('#BSART').append(Select_list_BSART); //입고유형 
			$('#LIFNR').append(Select_list_LIFNR); //공급처
			$('#KUNNR').append(Select_list_KUNNR); //제조사
			
			//select 선택값 return 
			$("#WERKS").val(data['map'].WERKS ); //법인
			$("#LGORT").val(data['map'].LGORT ); //저장위치
			$("#BSART").val(data['map'].BSART ); //입고유형
			$("#LIFNR").val(data['map'].LIFNR ); //공급처(=공급업체)
			$("#KUNNR").val(data['map'].KUNNR ); //제조사
			
			
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



</script>



<script type="text/javascript">	

function cb(start, end) {
	$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
	//getMonday(start); // Mon Nov 08 2010
	
	$('#reportrange').data('daterangepicker').setStartDate(start);		    	
    $('#reportrange').data('daterangepicker').setEndDate(end);	
    $('#SDATE').val(start.format('YYYYMMDD'));
    $('#EDATE').val(end.format('YYYYMMDD'));
}

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	$("#USERID").val(getCookie("sys_member_id")); //세션ID USERID에 넣기
	
    $('#reportrange').daterangepicker({
			alwaysShowCalendars:true,
			startDate: moment().startOf('year'),
			endDate: moment(),
			//maxDate: moment(),
			opens: "left",
			ranges: {
				'오늘': [moment(), moment()],
				'어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'최근 7일': [moment().subtract(6, 'days'), moment()],
				'지난 30일': [moment().subtract(29, 'days'), moment()],
				'이번 달': [moment().startOf('month'), moment().endOf('month')],
				'이번 년도': [moment().startOf('year'), moment().endOf('year')],
				'오늘 이전': [moment().startOf('year'), moment()],
				'지난 달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			}
		}, cb);
    
    if(getParameterByName("MANDT") == ""){
    	cb(moment().startOf('year'), moment().endOf('year'));
    }else{
    	$('#searchButton').trigger('click');
    	cb( moment(getParameterByName("SDATE"), 'YYYY-MM-DD'), moment(getParameterByName("EDATE"), 'YYYY-MM-DD') );
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