<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>

        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Home</a>
                    </li>
                    <li>시스템 관리</li>
                    <li class="active">회원 관리</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                   	메뉴관리
                    </h1>
                </div>

            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					
					
						<div class="search_box">
							<div class="search_box_sub">  
							<form name='search' id='search'>
								<input type="hidden" id="MANDT" name="MANDT" value="100" />
								
								<div class="col-sm-3">                                   
									
								</div>					
								
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control " style="width:100px;">상위메뉴</span>
										</span>
										<select id="BEFMENUID" name="BEFMENUID" class="form-control" style="">
											<option value="">전체</option>
										</select>
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
								</div>
								
								<div class="col-sm-2">   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:60px;">정렬</span>
										</span>
										<select id="orderby" name="orderby" class="form-control" style="">
											<option value="SORTKEY">정렬순서</option>
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
									</div>            
									<div class="pull-right">	
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
									</div>
								</div>
	                        </div>
	                        
							<div class="search_box col-sm-4" style="padding:0px; border:0px;">
								<div id="scroll" class="table-responsive tableFixHead">
									<table id="mytable" class="table table-bordered table-striped table-condensed ">
										<colgroup>
											<col style="width: 50px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
										</colgroup>
										<thead>
											<tr>
												<th>선택</th>
												<th>순서</th>
												<th>순서</th>
											</tr>
										</thead>
										<tbody> 
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="widget-body-sub col-sm-8">
							<div style="font-weight:bold; font-size:14px;">일괄 예약</div>
								<div id="scroll" class="table-responsive tableFixHead">
									<table id="mytable" class="table table-bordered table-striped table-condensed ">
										<colgroup>
											<col style="width: 50px;">
											<col style="width: 80px;">
											<col style="width: 80px;">
											<col style="width: 70px;">
											<col style="width: 150px;">
											<col style="width: 150px;">   
											<col style="width: 90px;">
											<col style="width: 80px;">
											<col style="width: 90px;">
											<col style="width: 70px;">
											<col style="width: 80px;">
											<col style="width: 100px;">
										</colgroup>
										<thead>
											<tr>
												<th>그룹명</th>
												<th>내역33</th>
												<th>메뉴ID</th>
												<th>수준</th>
												<th>한국어명</th>
												<th>영어명</th>
												<th>중국어명</th>
												<th>상위메뉴</th>
												<th>기타</th>
												<th>사용여부</th>
							
											</tr>
										</thead>
										<tbody> 
											  <tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="00001SP000316311" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00001" class="text-align-left">
													[00001] ATMEL
												</td>
												<td class="text-align-left">
													SP000316311
												</td>
												<td class="text-align-left">
													BSP76 E6433
												</td>
												<td class="text-align-center">
													Y
												</td>
												<td class="text-align-left">
													TEST1
												</td>
												<td class="text-align-center">
													2020-04-29
												</td>
												<td class="text-align-center">
													테스트
												</td>
												<td class="text-align-center">
													2020-04-29
												</td>
												<td class="text-align-center">
													테스트
												</td>
											</tr>
											
											<tr name="defaultTd">
												<td class="text-align-center">
													<label><input type="checkbox" name="chk[]" id="0000491961-3T310" value="" onclick="check(this)"><span class="text"></span></label>
												</td>
												<td value="00004" class="text-align-left">
													[00004] DELPHI
												</td>
												<td class="text-align-left">
													91961-3T310
												</td>
												<td class="text-align-left">
													1393-6515
												</td>
												<td class="text-align-center">
													Y
												</td>
												<td class="text-align-left">
												</td>
												<td class="text-align-center">
													2017-11-24
												</td>
												<td class="text-align-center">
													140609001
												</td>
												<td class="text-align-center">
												</td>
												<td class="text-align-center">
												</td>
											</tr>
										</tbody>
									</table>
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

//코드종류 Select
var Select_array_BARTYPE =  new Array(); 
var Select_list_BARTYPE = "";

function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/menu_02/menu_02Select.do',
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
			$('#BEFMENUID').html('<option value="">전체</option>');
			
			var list ="";
			var TOTAL_COUNT = "";
			Select_list_BARTYPE = "";
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			
			//코드종류 Select
			Select_array_BARTYPE = data['Select_MENUNAME'];
		
			for(var j = 0 ; j < Select_array_BARTYPE.length; j ++ ){
				Select_list_BARTYPE += "<option value="+Select_array_BARTYPE[j].MENUID+">"+Select_array_BARTYPE[j].MENUNAME+"</option>";
			}
		
			for(var i = 0 ; i < data['list'].length ; i ++ ){

				list += "<tr name='defaultTd'>"+
						"	 <td class='text-align-center'>"+
						"		<label>"+
						"			<input type='checkbox' name='chk[]' value='' onclick='check(this)'><span class='text'></span>"+ 
						"		</label>"+
						"    </td>"+
						"    <td class='text-align-center'>"+ data['list'][i].SORTKEY +"</td>"+ 	//순서
						"    <td class='text-align-left'>"+ data['list'][i].MENUID +"</td>"+ 		//메뉴ID	
						"    <td class='text-align-left'>"+ data['list'][i].MENUSTEP +"</td>"+		//수준
						"    <td class='text-align-left'>"+ data['list'][i].KORMENUNAME +"</td>"+	//한국어명
						"    <td class='text-align-left'>"+ data['list'][i].ENGMENUNAME +"</td>"+	//영어명
						"    <td class='text-align-left'>"+ data['list'][i].CHIMENUNAME +"</td>"+	//중국어명
						"    <td class='text-align-left'>"+ data['list'][i].BEFMENUID +"</td>"+		//상위메뉴
						"    <td class='text-align-left'>"+ data['list'][i].ETC +"</td>"+			//기타
						"    <td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+		//사용여부
						"    <td class='text-align-center'>"+ data['list'][i].UPDUSER +"</td>"+		//수정자
						"    <td class='text-align-center'>"+ data['list'][i].UPDDATE1 +"</td>"+	//수정일
						"</tr>";
			}
			
			$('#mytable tbody').append(list);		
			$('#BEFMENUID').append(Select_list_BARTYPE);
			$("#BEFMENUID").val(data['map'].BEFMENUID );
			
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
	
	for(var i = 0 ; i < Select_array.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array[i].CUSTCD_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array[i].CUSTCD ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array[i].CUSTCD){
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
	
	td0 = td.nextElementSibling;  //거래처 
	td1 = td0.nextElementSibling; //거래처품번
	td2 = td1.nextElementSibling; //HK품번
	td3 = td2.nextElementSibling; //사용여부 
	td4 = td3.nextElementSibling; //비고 

	
	var mail_arr = 	[{  yesCheck: appendSelect_array_CUSTCD, 	noCheck: appendSelectText,  column: td0}, 	//거래처 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td1}, 			//거래처품번
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td2},  			//HK품번
					{  yesCheck: appendSelect, 			noCheck: appendText,  		column: td3},  			//사용여부 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td4}];			//비고 

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
		mail_arr.splice(0, 1); //(거래처 삭제)
		mail_arr.splice(0, 1); //(거래처품번 삭제)
		
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
		    //거래처
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list+
				'</select>'+
			'</td>'+

			//거래처 품번 
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//HK품번 
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//사용여부 
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

		var td0 = td.next();   //거래처 
		var td1 = td0.next();  //거래처품번
		var td2 = td1.next();  //HK품번
		var td3 = td2.next();  //사용여부 
		var td4 = td3.next();  //비고 
	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT   : "100",  							//클라이언트
				CUSTCD  : td0.eq(i).children().val(),  		//거래처코드
				CMATNR  : trim(td1.eq(i).children().val()),	//거래처품번
				MAKTX   : trim(td2.eq(i).children().val()), //HK품번   
				USEFLAG : td3.eq(i).children().val(),		//사용여부  
				REMARK  : trim(td4.eq(i).children().val()), //비고     
				USERID  : user,								//사용자    
				NEWFLAG : "Y", 								//신규여부  
			});

			//공백 validation 체크 
			if(insertArray[i].CMATNR == ""){
				alert("거래처품번이 공백입니다.");
				save_chk = false;
				break;
			};
			
			if(insertArray[i].MAKTX == ""){
				alert("HK품번이 공백입니다.");
				save_chk = false;
				break;
			};		
			
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/supplierPartNumberMapping_07InsertUpdate.do",
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
		 					$('#CUSTNM').val("");
		 					$('#USEFLAG').val("Y");
		 					$('#CMATNR').val("");
		 					$('#MAKTX').val("");
		 					
		 				 	$('#orderby').val('MKDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
			 				
			 				//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
								
									$('#mytable > tbody:last').append(
										'<tr name="mytr">'+
											'<td class="text-align-center" style="background-color: gold;">'+
												'<label>'+
													'<input type="checkbox" name="chk[]" value="" onclick="check(this)"><span class="text"></span>'+
												'</label>'+
											'</td>'+
											//거래처
											'<td class="text-align-left" style="background-color:gold;">'+
												'<select type="text" value="" style="width:100%;" >'+
													Select_list+
												'</select>'+
											'</td>'+

											//거래처 품번 
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+ json.value[i].CMATNR +'" style="width:100%; height:31px;"></td>'+

											//HK품번 
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+ json.value[i].MAKTX +'" style="width:100%; height:31px;"></td>'+

											//사용여부 
											'<td class="text-align-center" style="background-color: gold;">'+
												'<select type="text" value="Y" style="width:100%;">'+
													'<option value="Y" selected="selected">Y</option>'+
													'<option value="N">N</option>'+
												'</select>'+
											'</td>'+

											//비고
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+ json.value[i].REMARK +'" style="width:100%; height:31px;"></td>'+

											//생성일시, 생성자, 수정일시, 수정자
											'<td class="text-align-center"></td>'+
											'<td class="text-align-center"></td>'+
											'<td class="text-align-center"></td>'+
											'<td class="text-align-center"></td>'+
										'</tr>'
									);
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
				 			
			 				}//유효성 검사에 막힌 데이터 반환  끝
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

		var td0 = td.next();   //거래처 
		var td1 = td0.next();  //거래처품번
		var td2 = td1.next();  //HK품번
		var td3 = td2.next();  //사용여부 
		var td4 = td3.next();  //비고 
	
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}
	
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT   : "100",  							//클라이언트
				CUSTCD  : td0.eq(i).attr("value"),  		//거래처코드
				CMATNR  : td1.eq(i).text(),					//거래처품번
				MAKTX   : trim(td2.eq(i).children().val()), //HK품번   
				USEFLAG : td3.eq(i).children().val(),		//사용여부  
				REMARK  : trim(td4.eq(i).children().val()), //비고     
				USERID  : user,								//사용자    
				NEWFLAG : "N", 								//신규여부  
			});

			//공백 validation 체크 
			if(insertArray[i].MAKTX == ""){
				alert("HK품번이 공백입니다.");
				save_chk = false;
				break;
			};			
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/supplierPartNumberMapping_07InsertUpdate.do",
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
							
							$('#CUSTCD').val("");
		 					$('#CUSTNM').val("");
		 					$('#USEFLAG').val("Y");
		 					$('#CMATNR').val("");
		 					$('#MAKTX').val("");
							
		 				 	$('#orderby').val('MODATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
			 			
			 				//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
				 					CUSTCD = json.value[i].CUSTCD;
					 				CMATNR = json.value[i].CMATNR;
					 				
					 				CUSTCD = CUSTCD.replace(/(\s*)/g, "");
									CMATNR = CMATNR.replace(/(\s*)/g, "");
				 					
									var keyValue = CUSTCD + CMATNR;
				 					$("#"+keyValue).trigger('click');

				 					var td = $("input[name='chk[]']:checked").parent().parent(); //체크박스 
				 					var td0 = td.next();   //거래처 
									var td1 = td0.next();  //거래처품번
									var td2 = td1.next();  //HK품번
									var td3 = td2.next();  //사용여부 
									var td4 = td3.next();  //비고 
				 				
				 					td2.children().val(json.value[i].MAKTX); 	//HK품번
				 					td3.children().val(json.value[i].USEFLAG); 	//사용여부 
				 					td4.children().val(json.value[i].REMARK); 	//비고
				 				}
				 				
				 				//스크롤 영역
				 				var specifiedSize  = $("#"+keyValue).offset().top - 400; //지정된 사이즈 
				 			    var scrollMove = {top:specifiedSize, left:240}; //스크롤 맨 밑 위치 
				 			   
				 			    $('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				
			 				}//유효성 검사에 막힌 데이터 반환  끝
			 				
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
//	$('#searchButton').trigger('click');
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