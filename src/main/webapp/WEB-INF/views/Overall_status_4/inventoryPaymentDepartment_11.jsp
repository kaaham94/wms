<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 작업자 관리 - 재고수불부  -->   
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
								<input type="hidden" id="FDATE" name="FDATE" value="" />
								<input type="hidden" id="TDATE" name="TDATE" value="" />
										
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
											<span class="form-control" style="width:100px;">제조사</span>
										</span>
										<input type="text" id="VBELN" name="VBELN" value="" onblur="removeSpace(this);" class="form-control">
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
											<span class="form-control" style="width:100px;">거래처</span>
										</span>
										<select id="CUST" name="CUST" class="form-control" style="">
										
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
										<input type="text" id="VBELN" name="VBELN" value="" onblur="removeSpace(this);" class="form-control">
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
.tableFixHead          { overflow-x: hidden; overflow-y: auto; height: 540px; }
.tableFixHead thead th { position: sticky; top: 0; }

input[type=checkbox] { width: 1px; height: 1px; position: static;}
input[type=checkbox] + .text { position: static;}

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
								<div class="text-align-center">
								
									<a class="btn btn-primary" id="totalSearch" style="left:100px"><i class="fa fa-floppy-o"></i> 전체내역조회 </a>
									<span class="pull-left">
										<a class="btn btn-warning" id="singleSearch"><i class="fa fa-floppy-o"></i> 건별조회 </a>
									</span>
							
							
									<span class="pull-right">	
										<button type="button" class="btn btn-default" onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
										<button type="button" class="btn btn-default" onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
									</span>
							
								</div>
							</div>
	                        
							<div class="col-sm-6" style="padding:0px;">
								<div id="scroll" class="table-responsive tableFixHead">
									<table id="left_table" class="table table-bordered table-striped table-condensed ">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 100px;">
											<col style="width: 40px;">
											<col style="width: 150px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
										</colgroup>
										<thead>
											<tr>
												<th>법인</th>
												<th>저장위치</th>
												<th>선택</th>
												<th>품번</th>
												<th>입고</th>
												<th>출고</th>
												<th>재고</th>
											</tr>
										</thead>
										<tbody> 
										
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="col-sm-6" style="padding:0px;">
								<div id="scroll2" class="table-responsive tableFixHead" >
									
									<div id="ajaxLoading2" class="loading-container_ajax display-none">
							 		 	<div class="loader_ajax display-none">
							 		 	</div>
									</div>
									
									<table id="right_table" class="table table-bordered table-striped table-condensed ">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 80px;">
											<col style="width: 70px;">
											<col style="width: 100px;">
											<col style="width: 50px;">
											<col style="width: 50px;">   
											<col style="width: 50px;">
										</colgroup>
										<thead>
											<tr>
												<th>법인</th>
												<th>날짜</th>
												<th>거래처</th>
												<th>품번</th>
												<th>입고</th>
												<th>출고</th>
												<th>재고</th>
											</tr>
										</thead>
										<tbody> 
										  
										</tbody>
									</table>
								</div>
							</div>
							                    	
                    	</div>
                </div><!-- /row -->
            </div><!-- /Page Body -->
            
                <div class="bottom_t">
					<div class="dataTables_length">
					
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
		url : '/WMS/Overall_status_4/inventoryPaymentDepartment_11Select_LGORT.do',
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

function frmScanSubmit(){
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/inventoryPaymentDepartment_11Select_left.do',
		type: "post",
		dataType : 'json',
		data: params,
		async: false,
		processData: false,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		cache: false,
		timeout: 600000,
		success : function(data){ 

			$('#left_table tbody').html('');
			$("#WERKS").html(''); 	//법인
			$("#CUST").html('');	//거래처

			var Select_array_WERKS =  new Array(); 		//법인 
			var Select_list_WERKS = "";
			
			var Select_array_CUST =  new Array(); 	//상태 
			var Select_list_CUST = "";
		
			
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			
			Select_array_CUST = data['Select_CUST'];
			Select_list_CUST = "<option value=''></option>"
			for(var j = 0 ; j < Select_array_CUST.length; j ++ ){
				Select_list_CUST += "<option value="+Select_array_CUST[j].CUSTCD+">"+Select_array_CUST[j].CUSTNM+"</option>";
			}
			
			var list ="";
			var rowspan ="";
			var rowspan2 ="";
			
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				//법인
				if(data['list'][i].rowspan !== undefined){
					rowspan = "<td style='vertical-align:top;' class='text-align-center rowspan1' style=' background-color: #f9f9f9; font-size:17px;' val='"+data['list'][i].WERKS+"'  rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].WERKSNM +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//저장위치
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top;' class='text-align-center rowspan2' style=' background-color: #f9f9f9; font-size:17px;' val='"+data['list'][i].LGORT+"'  rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].LGORTNM +"</b></td>" 
				}else{
					rowspan2 = "";
				}
				
				list += "<tr name='defaultTd'>"+
						rowspan +	//법인
						rowspan2 +  //저장위치
						//	"<td class='text-align-center'>"+( (data['list'][i].SUDAT == undefined)? "" : data['list'][i].SUDAT )+"</td>"+   	//날짜
						//	"<td class='text-align-center'>"+ data['list'][i].CUST +"</td>"+  		//거래처
							"<input type='hidden' name='LGORT' value='"+data['list'][i].LGORT+"'>"+
							"<input type='hidden' name='WERKS' value='"+data['list'][i].WERKS+"'>"+
							"<td class='text-align-center'>"+
							"	<label>"+	
							"		<input type='checkbox' name='chk[]' value='' onclick='check(this)'>"+
							"		<span class='text'></span>"+
							"	</label>"+
							"</td>"+
							"<td class='text-align-center'>"+ data['list'][i].MATNR +"</td>"+		//품번
							"<td class='text-align-center'>"+ data['list'][i].INQTY +"</td>"+ 	 	//입고
							"<td class='text-align-center'>"+ data['list'][i].OUTQTY +"</td>"+ 		//출고
							"<td class='text-align-center'>"+ data['list'][i].QTY +"</td>"+ 	  	//재고
						"</tr>";
			}

			$('#WERKS').append(Select_list_WERKS);		//법인
			$('#CUST').append(Select_list_CUST);  		//거래처
			
			//select 선택값 return 
			$("#WERKS").val(data['map'].WERKS ); 		//법인
			$("#CUST").val(data['map'].CUST ); 			//거래처
			
			$('#left_table tbody').append(list);
			
			
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


//전체내역조회 함수
function right_table_total(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장
		
	// ajax({ 시작
	$.ajax({
		url : '/WMS/Overall_status_4/inventoryPaymentDepartment_11Select_right_total.do',
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
			
			for(var i = 0 ; i < data['list'].length-3 ; i ++ ){
				
				if(data['list'][i].rowspan != ""){
					rowspan = "<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan+"'><b>"+ data['list'][i].WERKS +"</b></td>" //메뉴명
				}else{
					rowspan = ""; //메뉴명
				}

				list += "<tr name='defaultTd'>"+
							rowspan +	//법인
							"<td class='text-align-center'>"+ data['list'][i].SUDAT +"</td>"+   	//날짜
							"<td class='text-align-center'>"+ data['list'][i].CUST +"</td>"+  		//거래처
							"<td class='text-align-center'>"+ data['list'][i].MATNR +"</td>"+		//품번
							"<td class='text-align-center'>"+ data['list'][i].INQTY +"</td>"+ 	 	//입고
							"<td class='text-align-center'>"+ data['list'][i].OUTQTY +"</td>"+ 		//출고
							"<td class='text-align-center'>"+ data['list'][i].QTY +"</td>"+ 	  	//재고
						"</tr>";			
			}
			$('#right_table tbody').append(list);
		
			//스크롤 영역 
		    var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
		 
		  	$('html, #scroll2').animate({//스크롤 위치 이동
			    scrollTop: scrollMove.top
			}, 0);
		    
		  
		}
		,error : function(error){
			alert('error');
		}
		,beforeSend:function(){

		    //(로딩 이미지 보여주기 처리)
		     $('#ajaxLoading2').removeClass('display-none');
		     $('#ajaxLoading2 div').removeClass('display-none');
		      
	    }
	    ,complete:function(){

	       // (로딩 이미지 감추기 처리)
	        $('#ajaxLoading2').addClass('display-none');
	        $('#ajaxLoading2 div').addClass('display-none');

	    }
	
	})// ajax({ 끝	
}	

	
//전체내역조회 버튼
$("#totalSearch").on("click", function() {
	right_table_total()
});

	

		
//건별조회 함수
function right_table_single(insertArray){			
	//ajax 시작 
	 $.ajax({
 			url:"/WMS/Overall_status_4/inventoryPaymentDepartment_11InsertUpdate.do",
 			type:"post",
 			data: {target:JSON.stringify(insertArray)},
 			datatype:"json",
 			async: false,
 			//cache : false,
 			timeout:1000,
 			error:function(){
 				alert("error");
 			},
 			success : function(data){

 				$('#right_table tbody').html('');
 			
 				var list ="";
 				
 				for(var i = 0 ; i < data['list'].length; i ++ ){
 		
 					list += "<tr name='defaultTd'>"+
 								"<td class='text-align-center'>"+ data['list'][i].WERKS +"</td>"+   	//법인
 								"<td class='text-align-center'>"+ data['list'][i].SUDAT +"</td>"+   	//날짜
 								"<td class='text-align-center'>"+ data['list'][i].CUST +"</td>"+  		//거래처
 								"<td class='text-align-center'>"+ data['list'][i].MATNR +"</td>"+		//품번
 								"<td class='text-align-center'>"+ data['list'][i].INQTY +"</td>"+ 	 	//입고
 								"<td class='text-align-center'>"+ data['list'][i].OUTQTY +"</td>"+ 		//출고
 								"<td class='text-align-center'>"+ data['list'][i].QTY +"</td>"+ 	  	//재고
 							"</tr>";			
 				}
 				$('#right_table tbody').append(list);
 			
 				//스크롤 영역 
 			    var scrollMove = {top:0 , left:240}; //스크롤 맨 위에 위치 
 			 
 			  	$('html, #scroll2').animate({//스크롤 위치 이동
 				    scrollTop: scrollMove.top
 				}, 0);
 			},
 			error : function(error){
 				alert('error');
 			}
 	});//ajax 끝		   
}	


//건별조회 버튼  
$("#singleSearch").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	var FDATE = $("#FDATE").val();
	var TDATE = $("#TDATE").val();

	//수정 행(insert) 체크 수 없을 떄.
	if(0 == update_checked_length ){ 
		alert("체크한 행이 없습니다.");
		save_chk = false;	
		return;
	}
	
	//1.저장 진행여부 alert   
	if(confirm(  "건별 조회 하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];

		var td0 = td.next();   		//품번

		var WERKS = $("input[name='WERKS']");	//법인
		var LGORT = $("input[name='LGORT']");	//저장위치
	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT	  : "100",  					//클라이언트
				FDATE 	  : FDATE,						//시작일자
				TDATE	  : TDATE,						//종료일자
				WERKS	  : WERKS.eq(i).attr("value"),	//법인
				LGORT	  : LGORT.eq(i).attr("value"),	//저장위치
				MATNR	  : td0.eq(i).text()			//자재코드
			});
			
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
		
			right_table_single(insertArray)	   
		
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
});

</script>



<script type="text/javascript">	


function cb(start, end) {
	$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
	//getMonday(start); // Mon Nov 08 2010
	
	$('#reportrange').data('daterangepicker').setStartDate(start);		    	
    $('#reportrange').data('daterangepicker').setEndDate(end);	
    $('#FDATE').val(start.format('YYYYMMDD'));
    $('#TDATE').val(end.format('YYYYMMDD'));
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