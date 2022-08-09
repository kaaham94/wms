<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 물류센터 처리수량  -->   
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
								<div class="col-sm-1">   
									<div>
										<label style="padding-right:20px;">
											<input name="SEARCHTYPE" id="SEARCHTYPE" type="radio" value="WEEK" >
											<span class="text">주별</span>
										</label>
									</div>
									<div>
										<label style="padding-right:20px;">
											<input name="SEARCHTYPE" id="SEARCHTYPE" type="radio" value="" >
											<span class="text">일일</span>
										</label>
									</div>
								</div>
								
								<div class="col-sm-3">   
                                    <div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">기간</span>
										</span>
										<div id="reportrange" class="input-sm btn_daterange2 form-control">
											<span class="txt_date"></span>
										</div>
										<input type="hidden" id="FDATE" name="FDATE" value="" />
										<input type="hidden" id="TDATE" name="TDATE" value="" />
									</div>
									
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">입고요청구분</span>
										</span>
										<select id="BSART" name="BSART" class="form-control" value="" style="">
											
										</select>
									</div>
									
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">요청번호</span>
										</span>
										<input type="text" id="BELN" name="BELN" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>		
								
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">법인</span>
										</span>
										<select id="WERKS" name="WERKS" class="form-control" value="" style="">
											
										</select>
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">배송방법</span>
										</span>
										<select id="SHGBN" name="SHGBN" class="form-control" value="" style="">
											
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
											<span class="form-control" style="width:100px;">입출고구분</span>
										</span>
										<select id="PODO" name="PODO" class="form-control" style="">
										
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
.tableFixHead { overflow-x: hidden; overflow-y: auto; height: 540px;   overflow:auto; width:100%; }
.tableFixHead thead th { position: sticky; top: 0; }

.fixedColum:first-child{z-index:2;}
.fixedColum:nth-child(2){z-index:2;}
.fixedColum:nth-child(3){z-index:2;}

.textFixing {
  display: inline-block;
  position: sticky;
  top: 130px;
  /*width: 80px; */
  /*height: 90px; */
  /*background: blue;*/
}

/*datetimepicker 추가시, .tableFixHead를 넣어줘야 디자인이 안깨짐*/ 
.tableFixHead td, .tableFixHeadth {
 /*  width: 300px;*/
  border: 1px solid #000;
  width: 100px;
}

.tableFixHead table {
  table-layout: fixed;
  /*border-collapse:separate;*/
  border-spacing: 0px;
}

</style>

					<div class="widget ">  
						<div class="widget-header">
							<div class="widget-buttons" style="display: block">
								<div class="pull-left">
									<!--a class="btn btn-primary" id="btn-delete-row"><i class="fa fa-plus"></i> 삭제 하기 </a -->
								
								</div>            
								<div class="pull-right">	
									<button type="button" class="btn btn-default" onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
									<button type="button" class="btn btn-default" onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
								</div>
							</div>
						</div>
						
						<div style="font-weight:bold; font-size:15px;"  class="text-align-center">품질 관리자</div>
						<div class="table-responsive" style="height:400px;">
							<div id="chart_container" class="hi_chart" style="height:410px;"></div>
						</div>
					
						<div id="scroll" class="table-responsive tableFixHead" style="height:270px;">
							<table id="listTable" class="table table-bordered table-striped table-condensed ">
								<colgroup>
									<col style="width: 20px;">
									<col style="width: 40px;">
									<col style="width: 45px;">
									<col style="width: 80px;">
									<col style="width: 38px;">
									<col style="width: 60px;">
									<col style="width: 70px;">   									
									<col style="width: 50px;">
									<col style="width: 80px;">
									<col style="width: 35px;">
									<col style="width: 35px;">
									<col style="width: 20px;">
									<col style="width: 60px;">
									<col style="width: 100px;">
								</colgroup>
								<thead>
									<tr>
										<th class="fixedColum">주차</th>
										<th class="fixedColum">일자</th>
										<th class="fixedColum">법인</th>
										<th>저장위치</th>
										<th>입출고구분</th>
										<th>거래처</th>
										<th>요청번호</th>
										<th>입고요청구분</th>
										<th>제조사</th>
										<th>PLT 수량</th>
										<th>BOX 수량</th>
										<th>긴급</th>
										<th>배송방법</th>
										<th>비고</th>
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
		
		var td = e.target.parentNode;		//법인
		var td0 = td.nextElementSibling;	//저장위치
		var color = ""
		
});	


function frmScanSubmit(){
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장

	// ajax({ 시작	
	$.ajax({
		url : '/WMS/Overall_status_4/processingVolumeOfDistributionCenter_13Select.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){
			
			//chart
			var chart = data['chart'];
			
			var A = new Array();
			for(var i=0; i<3; i++){ A[i] = new Array() };
			
			for(var i=0; i<chart.length; i++){

				A[0][i] = chart[i].SDAY;		//SDAY
				A[1][i] = chart[i].PLTQTY; 	//PLTQTY
				A[2][i] = chart[i].BOXQTY;	//BOXQTY
			}
			
			var chart_container = $('#chart_container').highcharts();				
				chart_container.xAxis[0].setCategories(A[0]);	 
				chart_container.series[0].setData(A[1]);	 
				
			
			//list
			$('#listTable tbody').html('');
			$('#WERKS').html('');
			$('#BSART').html('');
			$('#SHGBN').html('');
			$('#PODO').html('');
			
			var list ="";
			var TOTAL_COUNT = "";
			var totalPercent = "";
			
			//코드종류 Select
			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
			
			var Select_array_BSART =  new Array(); 		//입고요청구분 
			var Select_list_BSART = "";

			var Select_array_SHGBN =  new Array(); 		//배송방법 
			var Select_list_SHGBN = "";
			
			var Select_array_PODO =  new Array(); 		//입출고구분 
			var Select_list_PODO = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}

			totalPercent =  data['totalPercent'];
			
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			
			Select_array_BSART = data['Select_BSART'];
			Select_list_BSART = "<option value=''></option>";
			for(var j = 0 ; j < Select_array_BSART.length; j ++ ){
				Select_list_BSART += "<option value="+Select_array_BSART[j].BSART+">"+Select_array_BSART[j].BSARTNAME+"</option>";
			}
	
			Select_array_SHGBN = data['Select_SHGBN'];
			Select_list_SHGBN = "<option value=''></option>";
			for(var j = 0 ; j < Select_array_SHGBN.length; j ++ ){
				Select_list_SHGBN += "<option value="+Select_array_SHGBN[j].SHGBN+">"+Select_array_SHGBN[j].SHGBNNAME+"</option>";
			}
			
			Select_array_PODO = data['Select_PODO'];
			Select_list_PODO = "<option value=''></option>";
			for(var j = 0 ; j < Select_array_PODO.length; j ++ ){
				Select_list_PODO += "<option value="+Select_array_PODO[j].PODO+">"+Select_array_PODO[j].PODONAME+"</option>";
			}
	
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//주차
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top;' class='text-align-center rowspan1' style=' background-color: #f9f9f9; font-size:17px;' rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].WEEKDAY +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//일자
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top;' class='text-align-center rowspan2' style=' background-color: #f9f9f9; font-size:17px;' rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].INDATE +"</b></td>" 
				}else{
					rowspan2 = "";
				}
				
				//법인
				if(data['list'][i].rowspan3 !== undefined){
					rowspan3 = "<td style='vertical-align:top;' class='text-align-center rowspan3' style=' background-color: #f9f9f9; font-size:17px;' rowspan='"+data['list'][i].rowspan3+"'><b class='textFixing'>"+ data['list'][i].WERKS +"</b></td>" 
				}else{
					rowspan3 = "";
				}
				
				list += "<tr name='defaultTd'>"+
							rowspan +	//주차
							rowspan2 +  //일자
							rowspan3 +  //법인
							//"<td class='text-align-center'>"+( (data['list'][i].WERKS == undefined)? "" : data['list'][i].WERKS )+"</td>"+   	//법인
							"<td class='text-align-center'>"+ data['list'][i].LGORT +"</td>"+  		//저장위치
							"<td class='text-align-center'>"+ data['list'][i].PODO +"</td>"+		//입출고구분
							"<td class='text-align-center'>"+ data['list'][i].LIFNR +"</td>"+		//거래처
							"<td class='text-align-center'>"+ data['list'][i].BELN +"</td>"+ 	 	//요청번호
							"<td class='text-align-center'>"+ data['list'][i].BSART +"</td>"+ 		//입고요청구분 
							"<td class='text-align-center'>"+ data['list'][i].MAKTX +"</td>"+ 	  	//제조사
							"<td class='text-align-center'>"+ data['list'][i].PLTQTY +"</td>"+ 	  	//PLT수량
							"<td class='text-align-center'>"+ data['list'][i].BOXQTY +"</td>"+ 	  	//BOX수량
							"<td class='text-align-center'>"+ data['list'][i].URGENTFLAG +"</td>"+ 	//긴급
							"<td class='text-align-center'>"+ data['list'][i].SHGBN +"</td>"+ 	  	//배송방법
							"<td class='text-align-center'>"+ 	( (data['list'][i].REMARK == undefined)? "" : data['list'][i].REMARK ) +"</td>"+ 	  	//비고
						
						"</tr>";
			}
			
			$('#listTable tbody').append(list);
			
			$('#WERKS').append(Select_list_WERKS);
			$('#BSART').append(Select_list_BSART);
			$('#SHGBN').append(Select_list_SHGBN);
			$('#PODO').append(Select_list_PODO);
			
			$("#WERKS").val(data['map'].WERKS ); //법인
			$("#BSART").val(data['map'].BSART ); //입고요청구분 
			$("#SHGBN").val(data['map'].SHGBN ); //배송방법 
			$("#PODO").val(data['map'].PODO ); 	 //입출고구분 
			
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




//■■■ 3.월별  출고 현황 
$('#chart_container').highcharts({
	xAxis: {
		categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		labels: {
			style: {
				fontSize : '16px'
			}
		}
	},
  yAxis: {
  	tickInterval:5,
  	title: {
	         text: ''
	    }
  },
  credits: {
      enabled: false
 },
  series: [{
  	  name: '판매계획',
      data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
  	,dataLabels: {
	    	style: {
				fontSize : '20px'
			},
			enabled: true,
			format: '{y}'
    	} 
  }]    
});		
/*
var chart_03 = function(r_json, A){
	var JSONDate = "";
		JSONDate = r_json.chart;
		
	//Json공백 데이터를  0으로 변환하는 과정 
	//JSONDate = JSON.stringify(r_json.chart);
	//JSONDate2 =JSONDate.replace(/""/gi, "null");
	//JSONDate =  JSON.parse(JSONDate2);

	for(var i=0; i<JSONDate.length; i++){

		A[0][i] = JSONDate[i].SDAY;		//SDAY
		A[1][i] = JSONDate[i].PLTQTY; 	//PLTQTY
		A[2][i] = JSONDate[i].BOXQTY;	//BOXQTY
		
		//if(!A[3][i]){ A[3][i] = null;}
	}
	
	var chart = $('#chart_01').highcharts();				
		chart.xAxis[0].setCategories(A[0]);	 
		chart.series[0].setData(A[1]);	 
		//chart.series[1].setData(A[3]);	  	
}
*/
		
//var right_table_url =  '/WMS/Overall_status_4/processingVolumeOfDistributionCenter_13Select.do'
// (받아올 내용이 있는 URL, 받아온 내용을 처리할 부분 , 받아온 내용은 변수 개수)
//id_Ajax(right_table_url, chart_03, 2); 
	
	
	

//좌측 데이터 클릭 시, 우측 테이블 불러오기 
$(document).on('click','#left_table [name="defaultTd"]',function(e){
	 $('#left_table [name="defaultTd"]').children().css( 'backgroundColor', '' );
	
	right_table($(this).find("form").attr('id'))
	right_bottom_table($(this).find("form").attr('id'))
	
	 $(this).children().eq(0).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(1).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(2).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(3).css( 'backgroundColor', 'gold' );
});	



</script>



<script type="text/javascript">	

function getMonday(d) {
  d = new Date(d);
  var day = d.getDay(),
      diff = d.getDate() - day + (day == 0 ? -6:1); // adjust when day is sunday
  return new Date(d.setDate(diff));
}

function cb(start, end) {
	$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
	//getMonday(start); // Mon Nov 08 2010
	
	$('#reportrange').data('daterangepicker').setStartDate(start);		    	
    $('#reportrange').data('daterangepicker').setEndDate(end);	
    $('#FDATE').val(start.format('YYYYMMDD'));
    $('#TDATE').val(end.format('YYYYMMDD'));
}

// 출근지역 (=ACODE) 라디오버튼 선택시에 역할 라디오버튼 출력  
$('input:radio').change(function(){
	var radioValue = $(this).val();
	var startDate = $('#reportrange').data('daterangepicker').startDate;
	
	if(radioValue == "day"){ //일
		cb(moment(startDate), moment(startDate));
	
	}else if(radioValue == "week"){ //주	
		cb(moment(getMonday(startDate)), moment(getMonday(startDate)).add(6, 'days'));
	
	}else if(radioValue == "month"){ //월
		cb(moment(startDate).startOf('month'), moment(startDate).endOf('month'));
	}

});

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	$('input:radio[name=SEARCHTYPE]:input[value="WEEK"]').attr("checked", true);
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
    	cb( moment(getParameterByName("FDATE"), 'YYYY-MM-DD'), moment(getParameterByName("TDATE"), 'YYYY-MM-DD') );
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