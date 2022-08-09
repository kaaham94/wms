<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 종합현황 - 현재고 상세  -->   
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
									
								<div class="col-sm-2">
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
											<span class="form-control" style="width:100px;">품번</span>
										</span>
										<input type="text" id="MAKTX" name="MAKTX" value="" onblur="removeSpace(this);" class="form-control">
									</div>
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">바코드</span>
										</span>
										<input type="text" id="BARNO" name="BARNO" value="" onblur="removeSpace(this);" class="form-control">
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
											<span class="form-control" style="width:100px;">로케이션</span>
										</span>
										<select id="LOC" name="LOC" class="form-control" style="">
										
										</select>
									</div>
								</div>
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:70px;">상태</span>
										</span>
										<select id="STATUS" name="STATUS" class="form-control" style="">
											
										</select>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class=" table-responsive">
										<button type="button" id="searchButton" style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search"  onclick="javascript:frmScanSubmit(1);"><i class="fa fa-search"></i> Search</button>
									</div>
								</div>
						
								<div class="col-sm-5"> 
									<div class="input-group" style="width:85%;">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">프린트</span>
										</span>
										<select id="PRTDEMON" name="PRTDEMON" class="form-control">
										
										</select>
										
										<span class="input-group-btn">                          
											 <button type="button" class="btn btn-default shiny" onclick="javascript:REPRINT();">라벨 재발행</button>
										</span>
										
										<span class="input-group-btn" style="left:40px;">
											<label>
												<input type="checkbox" name="multSelect" id="multSelect" onclick="multCheck(this)" value="Y">
												<span class="text">다중선택모드</span>
											</label>
										</span>
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



.textFixing {
  display: inline-block;
  position: sticky;
  top: 270px;
  /*width: 80px; */
  /*height: 90px; */
  /*background: blue;*/
}

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

.rowspan1, .fixedColum:first-child {
  position:sticky;
  left:0;
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum:first-child{z-index:2;}

.rowspan2, .fixedColum:nth-child(2) {
  position:sticky;
  left:90px; 
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum:nth-child(2){z-index:2;}

.rowspan3, .fixedColum:nth-child(3) {
  position:sticky;
  left:190px; 
  z-index:1;
  background-color:#f9f9f9; 
}
.fixedColum:nth-child(3){z-index:2;}
.rowspan3:after,
.rowspan3:before {
  content: '';
  position: absolute;
  left: 0;
  width: 100%;
}

.rowspan3:before {
  right: -1px;
  border-right: 1px solid red;
}

.rowspan3:after {
  right: -1px;
  border-right: 1px solid red;
}


.highlight  {
	background-color:#ccffcc !important;
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
										<col style="width: 90px;">
										<col style="width: 100px;">
										<col style="width: 90px;">
										<col style="width: 90px;">
										<col style="width: 150px;">
										<col style="width: 100px;">   
										<col style="width: 100px;">   
										<col style="width: 55px;">   
										<col style="width: 300px;">
										<col style="width: 80px;">
										<col style="width: 80px;">
										<col style="width: 80px;">
										<col style="width: 80px;">   
									</colgroup>
                                    <thead>
                                        <tr>
											<th class="fixedColum">법인</th>
											<th class="fixedColum">저장위치</th>
											<th class="fixedColum">상태</th>
											<th>제조사</th>
											<th>품번</th>
											<th>로케이션</th>
											<th>PLTNO</th>
											<th><label><input type="checkbox" id="chkAll"><span class="text"></span></label></th>
                                            <th>BARNO</th>
                                            <th>수량</th>
                                            <th>입고일</th>
                                            <th>생산자</th>
                                            <th>주차</th>
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
//다중선택모드
var tr_td = false;
function multCheck(it) {
	$(".highlight").removeClass("highlight"); // clear previous selection
	if (it.checked){
		tr_td = true;
	}else {
		tr_td = false;
	}
}	


//드래그 또는 클릭 시, 색 변환 기능 
var active = false;
$(document).on('mousedown', "[name='defaultTd'] > td ", function(ev){
	active = true;
	
	if(window.event.shiftKey) {
		
		if(tr_td){
			$(this).addClass("highlight");
			$(this).nextAll().addClass("highlight");
		}	
    }else{
    	
    	
		if(tr_td){
			$(".highlight").removeClass("highlight"); // clear previous selection
	    	ev.preventDefault(); // this prevents text selection from happening
			$(this).addClass("highlight");
			$(this).nextAll().addClass("highlight");
		}		
    }
});

$(document).on('mousemove', "[name='defaultTd'] > td ", function(ev){
	if (active) {
		
		if(tr_td){
			$(this).addClass("highlight");
			$(this).nextAll().addClass("highlight");
		}	
	}	
});

$(document).on('mouseup',function(ev){
	active = false;
});



//라벨 재발행 
function REPRINT(){
	
	
	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	var PRTDEMON = $("#PRTDEMON").val(); //프린트 값 
	
	//선택 항목 체크 수 없을 떄.
	if(0 == update_checked_length ){  
		alert("선택한 항목이 없습니다.");
		save_chk = false;	
		return;
	}
	
	//프린트값 없을 때. 
	if(0 == PRTDEMON ){  
		alert("출력 프린트를 선택하시기 바랍니다.");
		save_chk = false;	
		return;
	}
	
	//1.저장 진행여부 alert   
	if(confirm(  "현재 선택된 바코드들에 대해서 선택된 프린트로 재발행 등록 처리하시겠습니까?" )){  //1.1 진행여부 : Yes
		 
		var total_checked_length = $("input[name='chk[]']:checked"); 	//체크된 row 개수
		var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
		var insertArray = [];

		var td0 = td.next(); 	//BARNO 
	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT 			: "100",    //클라이언트
				PRTDEMON 		:  PRTDEMON,  	//프린트
				BARNO 			:  td0.eq(i).text(),  	//바코드
				USERID 			:  user  	//사용자
			});
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Overall_status_4/detailStockStatus_07InsertUpdate_REPRINT.do",
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
		 							 				
			 				$('#searchButton').trigger('click');
		 					
		 				}
		 			}
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
	
}


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
				
				var	td0 = td.nextElementSibling;  	//BARNO 
				var	td1 = td0.nextElementSibling; 	//수량
				var	td2 = td1.nextElementSibling; 	//입고일
				var	td3 = td2.nextElementSibling; 	//생산자
				var	td4 = td3.nextElementSibling; 	//주차
			
				
				var mail_arr = 	[{ yesCheck: appendImage, 		column: td0},  //BARNO 
								{  yesCheck: appendImage, 		column: td1},  //수량
								{  yesCheck: appendImage, 		column: td2},  //입고일 
								{  yesCheck: appendImage, 		column: td3},  //생산자
								{  yesCheck: appendImage, 		column: td4}]; //주차 
				
				for (var prop in mail_arr) {
					td.style.backgroundColor = "gold";
					mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
				}
				
			}//3. 모든 row for문 체크 끝 
		
	}else{ //1.2 전체체크 해제
	
		//3. 모든 row for문 체크  
		for(var i = 0; i < size; i++){
		
			var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
			
			var	td0 = td.nextElementSibling;  	//BARNO 
			var	td1 = td0.nextElementSibling; 	//수량
			var	td2 = td1.nextElementSibling; 	//입고일
			var	td3 = td2.nextElementSibling; 	//생산자
			var	td4 = td3.nextElementSibling; 	//주차
			
			var mail_arr = 	[{ 	noCheck: appendNoImage,  		column: td0},  //코드
							{  	noCheck: appendNoImage,  		column: td1},  //거래처명  
							{  	noCheck: appendNoImage,  		column: td2},  //거래처FULL명칭 
							{  	noCheck: appendNoImage,  		column: td3},  //메모
							{  	noCheck: appendNoImage,  		column: td4}]; //사용여부 
			
			for (var prop in mail_arr) {
				td.style.backgroundColor = "";
				mail_arr[prop].noCheck(mail_arr[prop].column);	
			}
		}
	}//3. 모든 row for문 체크 끝 
});	


//체크박스 선택된 해당 열 선택    
function check(it) {
	
	td = it.parentNode.parentNode;//0. 공통작업- 체크박스 
	
	td0 = td.nextElementSibling;  	//BARNO 
	td1 = td0.nextElementSibling; 	//수량
	td2 = td1.nextElementSibling; 	//입고일
	td3 = td2.nextElementSibling; 	//생산자
	td4 = td3.nextElementSibling; 	//주차

	var mail_arr = 	[{ yesCheck: appendImage, 			noCheck: appendNoImage,  		column: td0},  //BARNO 
					{  yesCheck: appendImage, 			noCheck: appendNoImage,  		column: td1},  //수량
					{  yesCheck: appendImage, 			noCheck: appendNoImage,  		column: td2},  //입고일
					{  yesCheck: appendImage, 			noCheck: appendNoImage, 		column: td3},  //생산자
					{  yesCheck: appendImage, 			noCheck: appendNoImage, 	 	column: td4}]; //주차

	//2.1 추가된 행 
	//if(td0.parentNode.attributes.name.value == "mytr"){
		
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

	//}
}




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
		url : '/WMS/Overall_status_4/detailStockStatus_07Select_LGORT.do',
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
		url : '/WMS/Overall_status_4/detailStockStatus_07Select.do',
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
			$("#WERKS").html(''); 	//법인
			$("#STATUS").html('');  //상태
			$("#LOC").html('');		//로케이션
			$("#PRTDEMON").html('');//프린트
			
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
			
			var Select_array_STATUS =  new Array(); 	//상태 
			var Select_list_STATUS = "";
			
			var Select_array_LOC =  new Array(); 		//로케이션 
			var Select_list_LOC = "";
			
			var Select_array_PRTDEMON =  new Array(); 	//프린트 
			var Select_list_PRTDEMON = "";
			
			
			Select_array_WERKS = data['Select_WERKS'];
			for(var j = 0 ; j < Select_array_WERKS.length; j ++ ){
				Select_list_WERKS += "<option value="+Select_array_WERKS[j].WERKS+">"+Select_array_WERKS[j].PLANTNAME+"</option>";
			}
			
			Select_array_STATUS = data['Select_STATUS'];
			for(var j = 0 ; j < Select_array_STATUS.length; j ++ ){
				Select_list_STATUS += "<option value="+Select_array_STATUS[j].STOCK+">"+Select_array_STATUS[j].STOCKNAME+"</option>";
			}
			
			Select_array_LOC = data['Select_LOC'];
			Select_list_LOC = "<option value=''></option>";
			for(var j = 0 ; j < Select_array_LOC.length; j ++ ){
				Select_list_LOC += "<option value="+Select_array_LOC[j].LOCID+">"+"["+Select_array_LOC[j].LOCID+"] "+Select_array_LOC[j].LOCNAME+"</option>";
			}
			
			Select_array_PRTDEMON = data['Select_PRTDEMON'];
			Select_list_PRTDEMON = "<option value=''></option>";
			for(var j = 0 ; j < Select_array_PRTDEMON.length; j ++ ){
				Select_list_PRTDEMON += "<option value="+Select_array_PRTDEMON[j].PRTDEMON+">"+Select_array_PRTDEMON[j].PRTDEMONNAME+"</option>";
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
					rowspan = "<td style='vertical-align:top;' class='text-align-center rowspan1' style=' background-color: #f9f9f9; font-size:17px;' rowspan='"+data['list'][i].rowspan+"'><b class='textFixing'>"+ data['list'][i].WERKS +"</b></td>" 
				}else{
					rowspan = "";
				}
				
				//저장위치
				if(data['list'][i].rowspan2 !== undefined){
					rowspan2 = "<td style='vertical-align:top;' class='text-align-center rowspan2' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan2+"'><b class='textFixing'>"+ data['list'][i].LGORT +"</b></td>" 

				}else{
					rowspan2 ="";
				}
				
				//상태
				if(data['list'][i].rowspan3 !== undefined){
					rowspan3 = "<td style='vertical-align:top;' class='text-align-center rowspan3' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan3+"'><b class='textFixing'>"+ data['list'][i].STATUS +"</b></td>" 

				}else{
					rowspan3 ="";
				}
				
				//제조사
				if(data['list'][i].rowspan4 !== undefined){
					rowspan4 = "<td style='vertical-align:top;' class='text-align-center rowspan4' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan4+"'><b class='textFixing'>"+ data['list'][i].CUST +"</b></td>" 

				}else{
					rowspan4 ="";
				}
				
				list = "<tr name='defaultTd'>"+
						rowspan +	//법인
						rowspan2 +	//저장위치
						rowspan3 +	//상태
						"<td class='text-align-center'>"+ data['list'][i].CUST +"</td>"+ 	  	//제조사
						"<td class='text-align-center' style='word-break:break-all;' wrap='hard'>"+ data['list'][i].MAKTX +"</td>"+ 	  	//품번
						"<td class='text-align-center'>"+ data['list'][i].LOCNAME +"</td>"+ 	//로케이션
						"<td class='text-align-center'>"+( (data['list'][i].PLTNO == undefined)? "" : data['list'][i].PLTNO )+"</td>"+     	//PLTNO 
					  	"<td class='text-align-center' >"+ //선택(=체크박스)
				        "	<label>"+
				        "		<input type='checkbox' name='chk[]' id='"+data['list'][i].CUSTCD+"' value='' onclick='check(this)'><span class='text'></span>"+
				        "	</label>"+
				        "</td>"+
				        "<td class='text-align-center' style='word-break:break-all;' wrap='hard'>"+ data['list'][i].BARNO +"</td>"+ 	//바코드
				        "<td class='text-align-center'>"+ data['list'][i].QTY+"</td>"+ 		//수량
				        "<td class='text-align-center'>"+ data['list'][i].INDATE +"</td>"+ 	//입고일
				        "<td class='text-align-center'>"+ data['list'][i].BLDAT +"</td>"+ 	//생산일
				        "<td class='text-align-center'>"+ data['list'][i].YYWW +"</td>"+ 	//주차
				        
					"</tr>";
			
				$('#mytable tbody').append(list);
			
			}
			
		
			$('#WERKS').append(Select_list_WERKS);		//법인
			$('#STATUS').append(Select_list_STATUS);  	//상테
			$('#LOC').append(Select_list_LOC);			//로케이션
			$('#PRTDEMON').append(Select_list_PRTDEMON);//프린터
			
			//select 선택값 return 
			$("#WERKS").val(data['map'].WERKS ); 		//법인
			$("#STATUS").val(data['map'].STATUS ); 		//상테
			$("#LOC").val(data['map'].LOC );  			//로케이션
			$("#PRTDEMON").val(data['map'].PRTDEMON );	//프린터
			
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


//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	$("#USERID").val(getCookie("sys_member_id")); //세션ID USERID에 넣기
	
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