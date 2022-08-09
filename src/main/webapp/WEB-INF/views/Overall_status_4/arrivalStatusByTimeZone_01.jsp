<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 시간대별 입고 현황  -->   
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
								
								<div class="col-sm-4">   
                                    <div class="input-group">
										<span class="input-group-btn">
											<span class="form-control" style="width:70px;">입고일</span>
										</span>
										<div id="reportrange" class="input-sm btn_daterange2 form-control">
											<label style="padding-right:10px;">
												<input name="radio" type="radio" value="day">
												<span class="text">일</span>
											</label>
											<label style="padding-right:10px;">
												<input name="radio" type="radio" value="week">
												<span class="text">주</span>
											</label>
											<label style="padding-right:15px;">
												<input name="radio" type="radio" value="month">
												<span class="text">월</span>
											</label>
											<span class="txt_date"></span>
										</div>
										<input type="hidden" id="SDATE" name="SDATE" value="" />
										<input type="hidden" id="EDATE" name="EDATE" value="" />
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
											<span class="form-control" style="width:100px;">공급업체</span>
										</span>
										<select id="LIFNR" name="LIFNR" class="form-control" value="" style="">
											
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
											<span class="form-control" style="width:100px;">품번</span>
										</span>
										<input type="text" id="MAKTX" name="MAKTX" value="" onblur="removeSpace(this);" class="form-control">
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
.tableFixHead { overflow-x: hidden; overflow-y: auto; height: 540px; }
.tableFixHead thead th { position: sticky; top: 0; }

.fixedColum:first-child{z-index:2;}
.fixedColum:nth-child(2){z-index:2;}

.textFixing {
  display: inline-block;
  position: sticky;
  top: 130px;
  /*width: 80px; */
  /*height: 90px; */
  /*background: blue;*/
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
						
						<div class="search_box col-sm-3" style="padding:0px; border:0px;">
							<div id="scroll_left_table" class="table-responsive tableFixHead left_table">
								<table id="left_table" class="table table-bordered table-striped table-condensed ">
									<colgroup>
										<col style="width: 70px;">
										<col style="width: 130px;">
										<col style="width: 80px;">
										<col style="width: 140px;">
									</colgroup>
									<thead>
										<tr>
											<th>시간</th>
											<th>수량</th>
											<th>박스</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									
									</tbody>
								</table>
							</div>
						</div>

						<div id="scroll_right_table" class="table-responsive tableFixHead " style="height:270px;">
							<table id="right_table" class="table table-bordered table-striped table-condensed ">
								<colgroup>
									<col style="width: 100px;">
									<col style="width: 80px;">
									<col style="width: 180px;">
									<col style="width: 50px;">
									<col style="width: 50px;">
									<col style="width: 50px;">   
								</colgroup>
								<thead>
									<tr>
										<th class="fixedColum">제조사</th>
										<th class="fixedColum">품번</th>
										<th>공급처</th>
										<th>수량</th>
										<th>단위</th>
										<th>박스</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>
						
						<div id="scroll_right_bottom_table" class="table-responsive tableFixHead" style="height:270px;">
							<table id="right_bottom_table" class="table table-bordered table-striped table-condensed ">
								<colgroup>
									<col style="width: 80px;">
									<col style="width: 80px;">
									<col style="width: 90px;">
									<col style="width: 50px;">
									<col style="width: 70px;">
									<col style="width: 120px;">   
									<col style="width: 50px;">
									
								</colgroup>
								<thead>
									<tr>
										<th class="fixedColum">제조사</th>
										<th class="fixedColum">품번</th>
										<th>오더번호</th>
										<th>바코드</th>
										<th>수량</th>
										<th>입고일시</th>
										<th>공급처</th>
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
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_left.do',
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
			$('#left_table tbody').html('');
			$('#right_table tbody').html('');
			$("#right_title").html('');
			$('#WERKS').html('');
			$('#LIFNR').html('');
			
			var list ="";
			var TOTAL_COUNT = "";
			var totalPercent = "";
			//코드종류 Select
			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
			
			var Select_array_LIFNR =  new Array(); 		//공급처 
			var Select_list_LIFNR = "";
			
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
			
			Select_array_LIFNR = data['Select_CUSTCD'];
			for(var j = 0 ; j < Select_array_LIFNR.length; j ++ ){
				Select_list_LIFNR += "<option value="+Select_array_LIFNR[j].CUSTCD+">"+Select_array_LIFNR[j].CUSTNM+"</option>";
			}
	
			//법인- WERKS
			//저장위치- LGORT
			//작업장- ARBPL
			//입고유형- BWART
			//SEQINDX - SEQINS
			//시간 - T_HR
			//수량 - BCQTY
			//박스 - BOXCNT
			//수불일자_S - SUDAT_S
			//수불일자_E - SUDAT_E
			//실적일자_S - CRDTC_S
			//실적일자_E - CRDTC_E
			//품목코드 - MATNR
			//공급처 - LIFNR

			var MANDT = $("#MANDT").val();
			var user = getCookie("sys_member_id");
						
			for(var i = 0 ; i < data['list'].length ; i ++ ){
				var result = (data['list'][i].BCQTY/parseInt(totalPercent))*100;
				result = Math.floor(parseFloat(result));
			
				list += "<tr name='defaultTd'>"+
						"    <td class='text-align-center'>"+ data['list'][i].T_HR +"</td>"+ 					//시간
						"    <td class='text-align-left'>"+ numberWithCommas(data['list'][i].BCQTY) +"</td>"+ 	//수량	
						"    <td class='text-align-left'>"+ data['list'][i].BOXCNT +"</td>"+					//박스
						
							"<td class='progress progress-lg progress-bordered' style='width:300px; '>"+
							//"("+totalPercent +"/"+ data['list'][i].BCQTY +") *100 = " + result
								"<div class='progress-bar progress-bar-darkorange' style='width:"+result+"%' role='progressbar' aria-valuenow='40%' aria-valuemin='30%' aria-valuemax='100'>"+
									//"<span id='percent'>"+ data['list'][i].BCQTY+"</span>"+   
								"</div>"+
								"<form id='tr_"+i+"'>"+	
									"<input type='hidden'	name='MANDT' 	 id='MANDT' 		value='"+MANDT+"'>"		+
									"<input type='hidden'	name='WERKS' 	 id='WERKS' 		value='"+data['list'][i].WERKS+"'>"		+	//법인
									"<input type='hidden'	name='LGORT' 	 id='LGORT' 		value='"+data['list'][i].LGORT+"'>"		+	//저장위치
									"<input type='hidden'	name='SEQ' 		 id='SEQ' 		value='"+data['list'][i].SEQINX+"'>"	+	//SEQINDX
									"<input type='hidden'	name='HH' 		 id='HH' 			value='"+data['list'][i].T_HR+"'>"		+	//시간
									"<input type='hidden'	name='SUDAT_S' 	 id='SUDAT_S'		value='"+data['list'][i].SUDAT_S+"'>"	+	//수불일자_S
									"<input type='hidden'	name='SUDAT_E' 	 id='SUDAT_E'		value='"+data['list'][i].SUDAT_E+"'>"	+   //수불일자_E
									"<input type='hidden'	name='CRDTC_S' 	 id='CRDTC_S'		value='"+data['list'][i].CRDTC_S+"'>"	+   //실적일자_S
									"<input type='hidden'	name='CRDTC_E' 	 id='CRDTC_E'		value='"+data['list'][i].CRDTC_E+"'>"	+   //실적일자_E
									"<input type='hidden'	name='MATNR' 	 id='MATNR' 		value='"+data['list'][i].MATNR+"'>"		+   //품목코드
									"<input type='hidden'	name='LIFNR' 	 id='LIFNR' 		value='"+data['list'][i].LIFNR+"'>"		+   //공급처
									"<input type='hidden'	name='BWART_1' 	 id='BWART_1'		value='N'>"				+   //현창입고
									"<input type='hidden'	name='BWART_2' 	 id='BWART_2'		value='Y'>"             +   //구매입고
									"<input type='hidden'	name='BWART_3' 	 id='BWART_3'		value='N'>"             +   //이전입고
									"<input type='hidden'	name='BWART_4' 	 id='BWART_4'		value='N'>"             +   //기타입고
									"<input type='hidden'	name='USERID' 	 id='USERID' 		value='"+user+"'>"      +   //사용자
								"</form>"+
							"</td>"+
						"</tr>";
			}
			
			$('#left_table tbody').append(list);
			
			$('#WERKS').append(Select_list_WERKS);
			$('#LIFNR').append(Select_list_LIFNR);
			
			$("#WERKS").val(data['map'].WERKS ); //법인
			$("#LGORT").val(data['map'].LGORT ); //저장위치
			$("#LIFNR").val(data['map'].LIFNR ); //공급업체
			$("#MAKTX").val(data['map'].MAKTX ); //품번
			
			
			//$("#WERKS").val("0100");
		    //$("#WERKS > option[value=0100]").attr("selected", "true");
		 	
		    
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


	
function right_table(id){
	//Create an FormData object 
	var params = jQuery("#"+id).serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_right.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: true,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			$('#right_table tbody').html('');
			
			var list ="";
			var rowspan = "";
			/*
			$("#TOTAL_COUNT").html('');
			var TOTAL_COUNT = "";
	
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			*/
			
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//제조사
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top;' class='text-align-center' style=' background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].CUST +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//품번
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan2+"'><b>"+ data['list'][i].MAKTX +"</b></td>"

				}else{
					rowspan2 ="";
				}
				
				list = "<tr name='defaultTd'>"+
							rowspan +	//제조사
							rowspan2 +	//품번
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].LIFNR +"</b></td>"+ //공급처 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].BCQTY +"</b></td>"+ //수량
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].MEINS +"</b></td>"+ //단위 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].BOXCNT +"</b></td>"+ //박스 
						"</tr>";
			
				$('#right_table tbody').append(list);
			
			}
		
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

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}
	
function right_bottom_table(id){
	//Create an FormData object 
	var params = jQuery("#"+id).serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/arrivalStatusByTimeZone_01Select_right_bottom.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: true,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){

			$('#right_bottom_table tbody').html('');
			
			var list ="";
			var rowspan = "";
		
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//제조사
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top; background-color: #f9f9f9; font-size:16px;' class='text-align-center'  rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].CUST +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//품번
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top; background-color: #f9f9f9; font-size:16px;' class='text-align-center'  rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].MAKTX +"</b></td>" 

				}else{
					rowspan2 ="";
				}
		
				list = "<tr name='defaultTd'>"+
							rowspan +	//제조사
							rowspan2 +	//품번
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].ORDNO +"</b></td>"+ //오더번호 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].CBARNO +"</b></td>"+//바코드 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].QTY +"</b></td>"+ 	 //수량 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ formatDate(data['list'][i].CRDTD) +"</b></td>"+ //입고일시 
							"<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' ><b>"+ data['list'][i].LIFNRNM +"</b></td>"+ //공급처 
						"</tr>";
			
				$('#right_bottom_table tbody').append(list);
			
			}
		
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

	
	

//좌측 데이터 클릭 시, 우측 테이블 불러오기 
$(document).on('click','#left_table [name="defaultTd"]',function(e){
	$('#left_table [name="defaultTd"]').children().css( 'backgroundColor', '' );
	 
	 $(this).children().eq(0).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(1).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(2).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(3).css( 'backgroundColor', 'gold' );
	 
	right_table($(this).find("form").attr('id'))
	right_bottom_table($(this).find("form").attr('id'))
	
	
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
    $('#SDATE').val(start.format('YYYYMMDD'));
    $('#EDATE').val(end.format('YYYYMMDD'));
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