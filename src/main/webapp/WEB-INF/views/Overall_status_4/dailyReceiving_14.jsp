<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 일별 입고 현황(차트)  -->   
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
								<input type="hidden" id="YYMM" name="YYMM" value="" />
								<div class="col-sm-1">   
									<div>
										<label style="padding-right:20px;">
											<input name="STYPE" type="radio" value="QTY" >
											<span class="text">상품수량</span>
										</label>
									</div>
								</div>	
								<div class="col-sm-1">   
									<div>
										<label style="padding-right:20px;">
											<input name="STYPE" type="radio" value="BOX" >
											<span class="text">박스갯수</span>
										</label>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:90px;">입고월</span>
										</span>
										<input value="" id="DATE" name="DATE" type="text" data-date-format="YYYY-MM" class="form-control datetimepicker">		
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
								</div>	
								<div class="col-sm-3">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">품목코드</span>
										</span>
										<input type="text" id="MATNR" name="MATNR" value="" onblur="removeSpace(this);" class="form-control">
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
.tableFixHead { overflow-x: hidden; overflow-y: auto; height: 540px;   overflow:auto; width:100%; }
.tableFixHead thead th { position: sticky; top: 0; }



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
			
						<div class="table-responsive" style="height:450px;">
							<div id="chart_container" class="hi_chart" style="height:460px;"></div>
						</div>
					
						<div id="scroll" class="table-responsive tableFixHead" style="height:120px;">
							<table id="listTable" class="table table-bordered table-striped table-condensed ">
								<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>   									
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>   									
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>합계</th>
										<th>1</th>
										<th>2</th>
										<th>3</th>
										<th>4</th>
										<th>5</th>
										<th>6</th>
										<th>7</th>
										<th>8</th>
										<th>9</th>
										<th>10</th>
										<th>11</th>
										<th>12</th>
										<th>13</th>
										<th>14</th>
										<th>15</th>
										<th>16</th>
										<th>17</th>
										<th>18</th>
										<th>19</th>
										<th>20</th>
										<th>21</th>
										<th>22</th>
										<th>23</th>
										<th>24</th>
										<th>25</th>
										<th>26</th>
										<th>27</th>
										<th>28</th>
										<th>29</th>
										<th>30</th>
										<th>31</th>
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
//datetimepicker 동적추가
$(".datetimepicker").datetimepicker({
        format: 'YYYY-MM',
        pickTime: false,
        language: 'kr'
});

//datetimepicker 변환시 이벤트 
$(document).on('change','.datetimepicker', function() {
	$('.datetimepicker').blur();
});


function frmScanSubmit(){
	//Create an FormData object 
		
	var DATE = $("#DATE").val();
	DATE = DATE.replace(/-/gi, "");
	$("#YYMM").val(DATE);
	
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장

	// ajax({ 시작	
	$.ajax({
		url : '/WMS/Overall_status_4/dailyReceiving_14Select.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){
			
			var A = new Array();
			A[0] = new Array()
		
		
			
			//list
			$('#listTable tbody').html('');
			$('#WERKS').html('');
			
			var list ="";
			
			//코드종류 Select
			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
		
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			
			for(var i = 0 ; i < data['list'].length ; i ++ ){
				
				A[0][0]  = parseInt((data['list'][i].D01 == undefined)? 0 : data['list'][i].D01); 
				A[0][1]  = parseInt((data['list'][i].D02 == undefined)? 0 : data['list'][i].D02); 
				A[0][2]  = parseInt((data['list'][i].D03 == undefined)? 0 : data['list'][i].D03); 
				A[0][3]  = parseInt((data['list'][i].D04 == undefined)? 0 : data['list'][i].D04); 
				A[0][4]  = parseInt((data['list'][i].D05 == undefined)? 0 : data['list'][i].D05); 
				A[0][5]  = parseInt((data['list'][i].D06 == undefined)? 0 : data['list'][i].D06); 
				A[0][6]  = parseInt((data['list'][i].D07 == undefined)? 0 : data['list'][i].D07); 
				A[0][7]  = parseInt((data['list'][i].D08 == undefined)? 0 : data['list'][i].D08); 
				A[0][8]  = parseInt((data['list'][i].D09 == undefined)? 0 : data['list'][i].D09); 
				A[0][9]  = parseInt((data['list'][i].D10 == undefined)? 0 : data['list'][i].D10); 
				A[0][10] = parseInt((data['list'][i].D11 == undefined)? 0 : data['list'][i].D11); 
				A[0][11] = parseInt((data['list'][i].D12 == undefined)? 0 : data['list'][i].D12); 
				A[0][12] = parseInt((data['list'][i].D13 == undefined)? 0 : data['list'][i].D13); 
				A[0][13] = parseInt((data['list'][i].D14 == undefined)? 0 : data['list'][i].D14); 
				A[0][14] = parseInt((data['list'][i].D15 == undefined)? 0 : data['list'][i].D15); 
				A[0][15] = parseInt((data['list'][i].D16 == undefined)? 0 : data['list'][i].D16); 
				A[0][16] = parseInt((data['list'][i].D17 == undefined)? 0 : data['list'][i].D17); 
				A[0][17] = parseInt((data['list'][i].D18 == undefined)? 0 : data['list'][i].D18); 
				A[0][18] = parseInt((data['list'][i].D19 == undefined)? 0 : data['list'][i].D19); 
				A[0][19] = parseInt((data['list'][i].D20 == undefined)? 0 : data['list'][i].D20); 
				A[0][20] = parseInt((data['list'][i].D21 == undefined)? 0 : data['list'][i].D21); 
				A[0][21] = parseInt((data['list'][i].D22 == undefined)? 0 : data['list'][i].D22); 
				A[0][22] = parseInt((data['list'][i].D23 == undefined)? 0 : data['list'][i].D23); 
				A[0][23] = parseInt((data['list'][i].D24 == undefined)? 0 : data['list'][i].D24); 
				A[0][24] = parseInt((data['list'][i].D25 == undefined)? 0 : data['list'][i].D25); 
				A[0][25] = parseInt((data['list'][i].D26 == undefined)? 0 : data['list'][i].D26); 
				A[0][26] = parseInt((data['list'][i].D27 == undefined)? 0 : data['list'][i].D27); 
				A[0][27] = parseInt((data['list'][i].D28 == undefined)? 0 : data['list'][i].D28); 
				A[0][28] = parseInt((data['list'][i].D29 == undefined)? 0 : data['list'][i].D29); 
				A[0][29] = parseInt((data['list'][i].D30 == undefined)? 0 : data['list'][i].D30); 
				A[0][30] = parseInt((data['list'][i].D31 == undefined)? 0 : data['list'][i].D31); 
				
				list += "<tr name='defaultTd'>"+
							"<td style='word-break:break-all;' wrap='hard'  class='text-align-center'>"+( (data['list'][i].MSUM == undefined)? "" : numberWithCommas(data['list'][i].MSUM) )  +"</td>"+
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D01 == undefined)? "" : numberWithCommas(data['list'][i].D01) )	+"</td>"+ 									
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D02 == undefined)? "" : numberWithCommas(data['list'][i].D02) )	+"</td>"+ 									
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D03 == undefined)? "" : numberWithCommas(data['list'][i].D03) )	+"</td>"+ 									
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D04 == undefined)? "" : numberWithCommas(data['list'][i].D04) )	+"</td>"+ 									
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D05 == undefined)? "" : numberWithCommas(data['list'][i].D05) )	+"</td>"+ 									
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D06 == undefined)? "" : numberWithCommas(data['list'][i].D06) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D07 == undefined)? "" : numberWithCommas(data['list'][i].D07) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D08 == undefined)? "" : numberWithCommas(data['list'][i].D08) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D09 == undefined)? "" : numberWithCommas(data['list'][i].D09) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D10 == undefined)? "" : numberWithCommas(data['list'][i].D10) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D11 == undefined)? "" : numberWithCommas(data['list'][i].D11) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D12 == undefined)? "" : numberWithCommas(data['list'][i].D12) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D13 == undefined)? "" : numberWithCommas(data['list'][i].D13) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D14 == undefined)? "" : numberWithCommas(data['list'][i].D14) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D15 == undefined)? "" : numberWithCommas(data['list'][i].D15) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D16 == undefined)? "" : numberWithCommas(data['list'][i].D16) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D17 == undefined)? "" : numberWithCommas(data['list'][i].D17) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D18 == undefined)? "" : numberWithCommas(data['list'][i].D18) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D19 == undefined)? "" : numberWithCommas(data['list'][i].D19) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D20 == undefined)? "" : numberWithCommas(data['list'][i].D20) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D21 == undefined)? "" : numberWithCommas(data['list'][i].D21) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D22 == undefined)? "" : numberWithCommas(data['list'][i].D22) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D23 == undefined)? "" : numberWithCommas(data['list'][i].D23) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D24 == undefined)? "" : numberWithCommas(data['list'][i].D24) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D25 == undefined)? "" : numberWithCommas(data['list'][i].D25) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D26 == undefined)? "" : numberWithCommas(data['list'][i].D26) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D27 == undefined)? "" : numberWithCommas(data['list'][i].D27) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D28 == undefined)? "" : numberWithCommas(data['list'][i].D28) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D29 == undefined)? "" : numberWithCommas(data['list'][i].D29) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D30 == undefined)? "" : numberWithCommas(data['list'][i].D30) )   +"</td>"+ 
							"<td style='word-break:break-all;' wrap='hard' class='text-align-center'>"+( (data['list'][i].D31 == undefined)? "" : numberWithCommas(data['list'][i].D31) )   +"</td>"+ 
						"</tr>";
			}
			
			var chart_container = $('#chart_container').highcharts();				
				chart_container.series[0].setData(A[0]);	 
			$('#listTable tbody').append(list);
			$('#WERKS').append(Select_list_WERKS);
			$("#WERKS").val(data['map'].WERKS ); //법인
			
			//스크롤 영역 
		    //var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	//$('html, #scroll').animate({//스크롤 위치 이동
			//    scrollTop: scrollMove.top
			//}, 0);
		},
		error : function(error){
			alert('error');
		}
	
	})// ajax({ 끝	
}
$(function () {
	Highcharts.setOptions({

	    lang: {
	      decimalPoint: '.',
	      thousandsSep: ','
	    }
	})
});
//■■■ 1.고객 접수 건수
$('#chart_container').highcharts({
    
	
	chart: {
        type: 'column'
    },
	xAxis: {
		categories: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'],
		labels: {
				style: {
					fontSize : '16px'
				}
			}
	},
    yAxis: {
    	
        title: {
            text: ''
        }, 
        labels: {
            style: {
                color: '#4d90fd'
            }
        }
    },
    credits: {
        enabled: false
    },
    plotOptions: {
        enableMouseTracking: true,
    
		series: {
			dataLabels: {
				style: {
					fontSize : '16px'
				},
				enabled: true,
			},
			borderColor: '#000'
		}
    },
    tooltip: {
        shared: true
    },
	

	 series: [{
        name: '실적',
        color: '#4d90fd',
        data: []  
    }]
});
/*

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
*/
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
	
	

</script>



<script type="text/javascript">	

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	$('input:radio[name=STYPE]:input[value="QTY"]').attr("checked", true);
	$("#USERID").val(getCookie("sys_member_id")); //세션ID USERID에 넣기
	$("#DATE").val(moment().format('YYYY-MM')); //오늘 날짜 넣기
	
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