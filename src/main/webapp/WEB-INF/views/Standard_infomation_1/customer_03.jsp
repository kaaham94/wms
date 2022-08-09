<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 기준정보 - 거래처 관리  -->   
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
											<span class="form-control" style="width:100px;">거래처코드</span>
										</span>
										<input type="text" id="CUSTCD" name="CUSTCD" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>					
								
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">거래처명</span>
										</span>
										<input type="text" id="CUSTNM" name="CUSTNM" value="" onblur="removeSpace(this);" class="form-control">
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
											<option value="CUSTCD">거래처코드</option>
											<option value="MKDATE">등록일</option>
											<option value="MODATE">수정일</option>
										</select>
									</div>
								</div>
								
								<div class="col-sm-2">
                                    <button type="button" id="searchButton" style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search"  onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
                                </div>
                            
	                            <div class="col-sm-6">                                   
									
										<div style="margin-top: 5px;" >
											<label>
												<input type="checkbox" name="IFLAG" id="IFLAG" value="Y" ><span class="text">공급처</span>
											</label>
											<label>
												<input type="checkbox" name="OFLAG" id="OFLAG" value="Y" style="width:30px;"><span class="text">납품처</span>	
											</label>
											<label>
												<input type="checkbox" name="MFLAG" id="MFLAG" value="Y" style="width:30px;"><span class="text">제조사</span>	
											</label>
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
  left:140px; /* 좌측 고정할 컬럼 width합 값  */
  z-index:1;
  background-color:#f9f9f9;
 
}
th:nth-child(3){z-index:2;}

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
										<col style="width: 90px;"><!-- 코드 -->
										<col style="width: 110px;"><!-- 거래처명 -->
										<col style="width: 180px;"><!-- 거래처 FULL 명칭 -->
										<col style="width: 60px;"><!-- 공급처 (체크박스)-->
										<col style="width: 60px;"><!-- 납품처 (체크박스)-->
										<col style="width: 60px;"><!-- 제조사 (체크박스)-->
										<col style="width: 100px;"><!-- 품번 채번코드 -->
										<col style="width: 100px;"><!-- 바코드 채번코드 -->
										<col style="width: 90px;"><!-- 거래처 이니셜 -->
										<col style="width: 130px;"><!-- 사업자 번호 -->
										<col style="width: 90px;"><!-- 담당자 -->
										<col style="width: 130px;"><!-- 이메일 -->
										<col style="width: 120px;"><!-- 전화1 -->
										<col style="width: 120px;"><!-- 전화2 -->
										<col style="width: 120px;"><!-- 팩스 -->
										<col style="width: 400px;"><!-- 주소 -->
										<col style="width: 200px;"><!-- 메모 -->
										<col style="width: 80px;"><!-- 사용여부 -->
										<col style="width: 90px;"><!-- 등록일 -->
										<col style="width: 85px;"><!-- 등록자 -->
										<col style="width: 90px;"><!-- 수정일 -->
										<col style="width: 85px;"><!-- 수정자 -->
                                    </colgroup>
                                    <thead>
                                        <tr>
                                        	<th><label><input type='checkbox' id='chkAll'/><span class='text'></span></label></th>
                                            <th>코드</th>
                                            <th>거래처명</th>
                                            <th>거래처FULL명칭</th>
                                            <th>공급처</th>
                                            <th>납품처</th>
                                            <th>제조사</th>
                                            <th>품번 채번코드</th>
                                            <th>바코드 채번코드</th>
                                            <th>거래처 이니셜</th>
                                            <th>사업자번호</th>
                                            <th>담당자</th>
                                            <th>EMAIL</th>
                                            <th>전화1</th>
                                            <th>전화2</th>
                                            <th>팩스</th>
                                            <th>주소</th>
                                            <th>메모</th>
                                            <th>사용여부</th>
                                            <th>등록일</th>
                                            <th>등록자</th>
                                            <th>수정일</th>
                                            <th>수정자</th>
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

function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/customer_03/customer_03Select.do',
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
		
			var select_list ="";
			var TOTAL_COUNT = "";
			Select_plant_list = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}	
		
			for(var i = 0 ; i < data['list'].length ; i ++ ){

				select_list += "<tr name='defaultTd'>"+
							        "<td class='text-align-center' >"+
							        "	<label>"+
							        "		<input type='checkbox' name='chk[]' id='"+data['list'][i].CUSTCD+"' value='' onclick='check(this)'><span class='text'></span>"+
							        "	</label>"+
							        "</td>"+
							        "<td class='text-align-left'>"+ data['list'][i].CUSTCD +"</td>"+ 	//코드
							        "<td class='text-align-left'>"+ data['list'][i].CUSTNM +"</td>"+	//거래처명
							        "<td class='text-align-left'>"+ data['list'][i].CUSTFULLNM +"</td>"+//거래처FULL명칭
							        
							        "<td class='text-align-center'>"+						
								        "<label>"+	
											"<input disabled='true' type='checkbox' name='IFLAG' id='IFLAG' value='-1' >"+ //공급처
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									
									"<td class='text-align-center'>"+						
								        "<label>"+	
											"<input disabled='disabled' type='checkbox' name='OFLAG' id='OFLAG' value='-1' >"+ //납품처
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									
									"<td class='text-align-center'>"+						
								        "<label>"+	
											"<input disabled='disabled' type='checkbox' name='MFLAG' id='MFLAG' value='-1' >"+ //제조사
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									
							        "<td class='text-align-center'>"+ data['list'][i].MATNRCODE +"</td>"+//품번 채번코드
							        "<td class='text-align-center'>"+ data['list'][i].BARINDEXCODE +"</td>"+//바코드 채번코드
							        "<td class='text-align-center'>"+ data['list'][i].INITIAL +"</td>"+	//거래처 이니셜
							        "<td class='text-align-center'>"+ data['list'][i].REGNO +"</td>"+	//사업자번호
							        "<td class='text-align-center'>"+ data['list'][i].SMAN +"</td>"+	//담당자
							        "<td class='text-align-center'>"+ data['list'][i].EMAIL +"</td>"+	//이메일
							        "<td class='text-align-center'>"+ data['list'][i].TEL1 +"</td>"+	//전화1
							        "<td class='text-align-center'>"+ data['list'][i].TEL2 +"</td>"+	//전화2
							        "<td class='text-align-center'>"+ data['list'][i].FAX1 +"</td>"+	//팩스
							        "<td class='text-align-left'>"+ data['list'][i].ADDR +"</td>"+		//주소
							        "<td class='text-align-left'>"+ data['list'][i].MEMO +"</td>"+		//메모
							        "<td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+	//사용여부
							        "<td class='text-align-center'>"+ data['list'][i].MKDATE +"</td>"+	//등록일
							        "<td class='text-align-center'>"+ data['list'][i].MKUSER +"</td>"+	//등록자
							        "<td class='text-align-center'>"+ data['list'][i].MODATE +"</td>"+	//수정일
							        "<td class='text-align-center'>"+ data['list'][i].MOUSER +"</td>"+	//수정자
					        	"</tr>";
			}
			
			$('#mytable tbody').append(select_list);		
			
			for(var k = 0 ; k < data['list'].length; k++ ){
				
				if(data['list'][k].IFLAG == '-1'){
					$("tr input:checkbox[id='IFLAG']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].OFLAG == '-1'){
					$("tr input:checkbox[id='OFLAG']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].MFLAG == '-1'){
					$("tr input:checkbox[id='MFLAG']").eq(k).prop("checked", true);
				}
			}
			
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
 	
 	
 	
//체크박스 선택된 해당 열 선택    
function check(it) {
	
	td = it.parentNode.parentNode;//0. 공통작업- 체크박스 
	
	td0 = td.nextElementSibling;  	//코드 
	td1 = td0.nextElementSibling; 	//거래처명
	td2 = td1.nextElementSibling; 	//거래처FULL명칭
	td3 = td2.nextElementSibling; 	//공급처
	td4 = td3.nextElementSibling; 	//납품처
	td5 = td4.nextElementSibling; 	//제조사
	td6 = td5.nextElementSibling; 	//품번 채번코드
	td7 = td6.nextElementSibling;	//바코드 채번코드
	td8 = td7.nextElementSibling;	//거래처 이니셜
	td9 = td8.nextElementSibling; 	//사업자번호
	td10 = td9.nextElementSibling; 	//담당자
	td11 = td10.nextElementSibling; //EMAIL
	td12 = td11.nextElementSibling; //전화1
	td13 = td12.nextElementSibling; //전화2
	td14 = td13.nextElementSibling; //팩스
	td15 = td14.nextElementSibling; //주소
	td16 = td15.nextElementSibling; //메모
	td17 = td16.nextElementSibling; //사용여부
		
	var mail_arr = 	[{ yesCheck: appendInput, 			noCheck: appendText,  		column: td0},  //코드
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td1},  //거래처명  
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td2},  //거래처FULL명칭 
					{  yesCheck: appendCheckbox, 		noCheck: appendNoCheckbox,  column: td3},  //공급처 
					{  yesCheck: appendCheckbox, 		noCheck: appendNoCheckbox,  column: td4},  //납품처 
					{  yesCheck: appendCheckbox, 		noCheck: appendNoCheckbox,  column: td5},  //제조사 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td6},  //품번 채번코드  
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td7},  //바코드 채번코드 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td8},  //거래처 이니셜 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td9},  //사업자번호 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td10},  //담당자 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td11},  //EMAIL 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td12},  //전화1 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td13},  //전화2 
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td14},  //팩스
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td15},  //주소
					{  yesCheck: appendInput, 			noCheck: appendText,  		column: td16},  //메모
					{  yesCheck: appendSelect, 			noCheck: appendText,  		column: td17}]; //사용여부 

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
		mail_arr.splice(0, 1); //(코드 삭제)
		
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
			
		"<tr name='mytr'>"+
			
			"<td class='text-align-center' style='background-color: gold;'>"+
				"<label>"+
					"<input type='checkbox' name='chk[]' value='' onclick='check(this)'><span class='text'></span>"+
				"</label>"+
		    "</td>"+
			
		    "<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+ 	//코드
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//거래처명
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//거래처FULL명칭
		
			"<td class='text-align-center' style='background-color: gold;'>"+						
				"<label>"+	
					"<input type='checkbox' value='-1' >"+ //공급처
					"<span class='text'></span>"+
				"</label>"+
			"</td>"+
			
			"<td class='text-align-center' style='background-color: gold;'>"+						
				"<label>"+	
					"<input type='checkbox' value='-1' >"+ //납품처
					"<span class='text'></span>"+
				"</label>"+
			"</td>"+
			
			"<td class='text-align-center' style='background-color: gold;'>"+						
				"<label>"+	
					"<input type='checkbox' value='-1' >"+ //제조사
					"<span class='text'></span>"+
				"</label>"+
			"</td>"+

			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//품번 채번코드
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//바코드 채번코드
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//거래처 이니셜
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//사업자번호
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//담당자
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//이메일
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//전화1
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//전화2
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//팩스
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//주소
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+	//메모
			
			"<td class='text-align-center' style='background-color: gold;'>"+ //사용여부
				"<select type='text' value='Y' style='width:100%;'>"+
					"<option value='Y' selected='selected'>Y</option>"+
					"<option value='N'>N</option>"+
				"</select>"+
			"</td>"+
			
			"<td class='text-align-left'></td>"+	//등록일
			"<td class='text-align-left'></td>"+	//등록자
			"<td class='text-align-left'></td>"+	//수정일
			"<td class='text-align-left'></td>"+	//수정자
		"</tr>"
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

		var td0 = td.next();  	//코드 
		var td1 = td0.next(); 	//거래처명
		var td2 = td1.next(); 	//거래처FULL명칭
		var td3 = td2.next(); 	//공급처
		var td4 = td3.next(); 	//납품처
		var td5 = td4.next(); 	//제조사
		var td6 = td5.next(); 	//품번 채번코드
		var td7 = td6.next();	//바코드 채번코드
		var td8 = td7.next();	//거래처 이니셜
		var td9 = td8.next(); 	//사업자번호
		var td10 = td9.next(); 	//담당자
		var td11 = td10.next(); //EMAIL
		var td12 = td11.next(); //전화1
		var td13 = td12.next(); //전화2
		var td14 = td13.next(); //팩스
		var td15 = td14.next(); //주소
		var td16 = td15.next(); //메모
		var td17 = td16.next(); //사용여부
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}

		  var checkbox_arr = [{ checkbox: td3.eq(i).children().children(":checked").val()},  //공급처
						 { checkbox: td4.eq(i).children().children(":checked").val() },  //납품처
						 { checkbox: td5.eq(i).children().children(":checked").val() }];  //제조사
						
	
			//체크박스 체크
			for (var prop in checkbox_arr) {
				if( checkbox_arr[prop].checkbox != -1){			
					checkbox_arr[prop].checkbox = "";
				}
			}

			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT : "100",									//전역변수
				CUSTCD : trim(td0.eq(i).children().val()), 		//코드
				CUSTNM : trim(td1.eq(i).children().val()), 		//거래처명
				CUSTFULLNM : trim(td2.eq(i).children().val()), 	//거래처 FULL명칭
				IFLAG : checkbox_arr[0].checkbox,				//공급처
				OFLAG : checkbox_arr[1].checkbox, 				//납품처
				MFLAG : checkbox_arr[2].checkbox,				//제조사
				MATNRCODE : trim(td6.eq(i).children().val()),	//품번 채번코드
				BARINDEXCODE : trim(td7.eq(i).children().val()),//s바코드 채번코드
				INITIAL : trim(td8.eq(i).children().val()),		//거래처 이니셜
				REGNO : trim(td9.eq(i).children().val()), 		//사업자 번호 
				SMAN : trim(td10.eq(i).children().val()),		//담당자
				EMAIL : trim(td11.eq(i).children().val()),		//이메일 	
				TEL1 :	trim(td12.eq(i).children().val()), 		//전화1
				TEL2 :	trim(td13.eq(i).children().val()), 		//전화2
				FAX1 :	trim(td14.eq(i).children().val()),		//팩스
				ADDR :	trim(td15.eq(i).children().val()),		//주소
				MEMO :	trim(td16.eq(i).children().val()),		//메모
				USEFLAG : td17.eq(i).children().val(),			//사용우무
				USERID : user,									//사용자 ID
				NEWFLAG : 'Y' //신규여부 
			});

			//공백 validation 체크 
			if(insertArray[i].CUSTCD == ""){
				alert("코드가 공백입니다.");
				save_chk = false;
				break;
			};
			
			if(insertArray[i].CUSTNM == ""){
				alert("거래처명이 공백입니다.");
				save_chk = false;
				break;
			};		
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/customer_03InsertUpdate.do",
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
		 					$("input:checkbox[id='IFLAG']").prop("checked", false);
		 					$("input:checkbox[id='OFLAG']").prop("checked", false);
		 					$("input:checkbox[id='MFLAG']").prop("checked", false);
		 					
		 				 	$('#orderby').val('MKDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
	
			 				//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
	
				 					$('#mytable > tbody:last').append(
				 							
			 							"<tr name='mytr'>"+
			 								"<td class='text-align-center' style='background-color: gold;'>"+
			 									"<label>"+
			 										"<input type='checkbox' name='chk[]' value='' onclick='check(this)'><span class='text'></span>"+
			 									"</label>"+
			 							    "</td>"+
			 								
			 							    "<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].CUSTCD +"' style='width:100%; height:31px;'></td>"+ 	//코드
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].CUSTNM +"' style='width:100%; height:31px;'></td>"+	//거래처명
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].CUSTFULLNM +"' style='width:100%; height:31px;'></td>"+	//거래처FULL명칭
			 							
			 								"<td class='text-align-center' style='background-color: gold;'>"+						
			 									"<label>"+	
			 										"<input type='checkbox' name='IFLAG' id='IFLAG' value='-1' >"+ //공급처
			 										"<span class='text'></span>"+
			 									"</label>"+
			 								"</td>"+
			 								
			 								"<td class='text-align-center' style='background-color: gold;'>"+						
			 									"<label>"+	
			 										"<input type='checkbox' name='OFLAG' id='OFLAG' value='-1' >"+ //납품처
			 										"<span class='text'></span>"+
			 									"</label>"+
			 								"</td>"+
			 								
			 								"<td class='text-align-center' style='background-color: gold;'>"+						
			 									"<label>"+	
			 										"<input type='checkbox' name='MFLAG' id='MFLAG' value='-1' >"+ //제조사
			 										"<span class='text'></span>"+
			 									"</label>"+
			 								"</td>"+
		
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].MATNRCODE +"' style='width:100%; height:31px;'></td>"+	//품번 채번코드
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].BARINDEXCODE +"' style='width:100%; height:31px;'></td>"+	//바코드 채번코드
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].INITIAL +"' style='width:100%; height:31px;'></td>"+	//거래처 이니셜
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].REGNO +"' style='width:100%; height:31px;'></td>"+	//사업자번호
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].SMAN +"' style='width:100%; height:31px;'></td>"+	//담당자
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].EMAIL +"' style='width:100%; height:31px;'></td>"+	//이메일
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].TEL1 +"' style='width:100%; height:31px;'></td>"+	//전화1
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].TEL2 +"' style='width:100%; height:31px;'></td>"+	//전화2
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].FAX1 +"' style='width:100%; height:31px;'></td>"+	//팩스
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].ADDR +"' style='width:100%; height:31px;'></td>"+	//주소
			 								"<td class='text-align-left' style='background-color: gold;'><input type='text' value='"+ json.value[i].MEMO +"' style='width:100%; height:31px;'></td>"+	//메모
			 								
			 								"<td class='text-align-center' style='background-color: gold;'>"+ //사용여부
			 									"<select type='text' value='Y' style='width:100%;'>"+
			 										"<option value='Y' selected='selected'>Y</option>"+
			 										"<option value='N'>N</option>"+
			 									"</select>"+
			 								"</td>"+
			 								
			 								"<td class='text-align-left'>"+ json.value[i].MKDATE +"</td>"+	//등록일
			 								"<td class='text-align-left'>"+ json.value[i].MKUSER +"</td>"+	//등록자
			 								"<td class='text-align-left'>"+ json.value[i].MODATE +"</td>"+	//수정일
			 								"<td class='text-align-left'>"+ json.value[i].MOUSER +"</td>"+	//수정자
			 							"</tr>"
				 					);
				 						        	
				 
				 					//체크박스 체크, 색 적용   
					 			 	$("tbody tr:last input:checkbox:eq(0)").prop("checked", true);		
					 				$("tbody tr:last input:checkbox:eq(0)").parent().parent().css("background-color", "gold");
					 				
					 				if(json.value[i].IFLAG == '-1'){
				 						$("tbody tr:last input:checkbox[id='IFLAG']").prop("checked", true);
				 					}
				 					
				 					if(json.value[i].OFLAG == '-1'){
				 						$("tbody tr:last input:checkbox[id='OFLAG']").prop("checked", true);
				 					}
				 					
				 					if(json.value[i].MFLAG == '-1'){
				 						$("tbody tr:last input:checkbox[id='MFLAG']").prop("checked", true);
				 					}
				 				}
				 				
				 				//스크롤 영역
				 				var totalScroll = $('#scroll').prop('scrollHeight'); //스크롤 전체 크기
				 			    var scrollMove = {top:totalScroll, left:240}; //스크롤 맨 밑 위치 
				 			 
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

		var td0 = td.next();  	//코드 
		var td1 = td0.next(); 	//거래처명
		var td2 = td1.next(); 	//거래처FULL명칭
		var td3 = td2.next(); 	//공급처
		var td4 = td3.next(); 	//납품처
		var td5 = td4.next(); 	//제조사
		var td6 = td5.next(); 	//품번 채번코드
		var td7 = td6.next();	//바코드 채번코드
		var td8 = td7.next();	//거래처 이니셜
		var td9 = td8.next(); 	//사업자번호
		var td10 = td9.next(); 	//담당자
		var td11 = td10.next(); //EMAIL
		var td12 = td11.next(); //전화1
		var td13 = td12.next(); //전화2
		var td14 = td13.next(); //팩스
		var td15 = td14.next(); //주소
		var td16 = td15.next(); //메모
		var td17 = td16.next(); //사용여부
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}

		  var checkbox_arr = [{ checkbox: td3.eq(i).children().children(":checked").val()},  //공급처
							 { checkbox: td4.eq(i).children().children(":checked").val() },  //납품처
							 { checkbox: td5.eq(i).children().children(":checked").val() }];  //제조사
						
	
			//체크박스 체크
			for (var prop in checkbox_arr) {
				if( checkbox_arr[prop].checkbox != -1){			
					checkbox_arr[prop].checkbox = "";
				}
			}

			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT : "100",									//전역변수
				CUSTCD : trim(td0.eq(i).text()), 		//코드
				CUSTNM : trim(td1.eq(i).children().val()), 		//거래처명
				CUSTFULLNM : trim(td2.eq(i).children().val()), 	//거래처 FULL명칭
				IFLAG : checkbox_arr[0].checkbox,				//공급처
				OFLAG : checkbox_arr[1].checkbox, 				//납품처
				MFLAG : checkbox_arr[2].checkbox,				//제조사
				MATNRCODE : trim(td6.eq(i).children().val()),	//품번 채번코드
				BARINDEXCODE : trim(td7.eq(i).children().val()),//바코드 채번코드
				INITIAL : trim(td8.eq(i).children().val()),		//거래처 이니셜
				REGNO : trim(td9.eq(i).children().val()), 		//사업자 번호 
				SMAN : trim(td10.eq(i).children().val()),		//담당자
				EMAIL : trim(td11.eq(i).children().val()),		//이메일 	
				TEL1 :	trim(td12.eq(i).children().val()), 		//전화1
				TEL2 :	trim(td13.eq(i).children().val()), 		//전화2
				FAX1 :	trim(td14.eq(i).children().val()),		//팩스
				ADDR :	trim(td15.eq(i).children().val()),		//주소
				MEMO :	trim(td16.eq(i).children().val()),		//메모
				USEFLAG : td17.eq(i).children().val(),			//사용우무
				USERID : user,									//사용자 ID
				NEWFLAG : '' //신규여부 
			});

			//공백 validation 체크 
			if(insertArray[i].CUSTCD == ""){
				alert("코드가 공백입니다.");
				save_chk = false;
				break;
			};
			
			if(insertArray[i].CUSTNM == ""){
				alert("거래처명이 공백입니다.");
				save_chk = false;
				break;
			};		
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/customer_03InsertUpdate.do",
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
		 					$("input:checkbox[id='IFLAG']").prop("checked", false);
		 					$("input:checkbox[id='OFLAG']").prop("checked", false);
		 					$("input:checkbox[id='MFLAG']").prop("checked", false);
		 					 
		 				 	$('#orderby').val('MODATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
	
			 				//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
				 					
				 					var td = $("#"+json.value[i].CUSTCD); //체크박스 
				 					$(td).trigger('click');

				 					var td0 = td.parent().parent(); //체크박스 
				 					var td1 = td0.next(); 			//코드
				 					var td2 = td1.next(); 			//거래처명
				 					var td3 = td2.next(); 			//거래처FULL명칭
				 					var td4 = td3.next(); 			//공급처
				 					var td5 = td4.next(); 			//납품처
				 					var td6 = td5.next(); 			//제조사
				 					var td7 = td6.next(); 			//품번 채번코드
				 					var td8 = td7.next(); 			//바코드 채번코드
				 					var td9 = td8.next(); 			//거래처 이니셜
				 					var td10 = td9.next(); 			//사업자번호
				 					var td11 = td10.next(); 		//담당자
				 					var td12 = td11.next(); 		//이메일
				 					var td13 = td12.next(); 		//전화1
				 					var td14 = td13.next(); 		//전화2
				 					var td15 = td14.next(); 		//팩스
				 					var td16 = td15.next(); 		//주소
				 					var td17 = td16.next(); 		//메모
				 					var td18 = td17.next(); 		//사용여부
				 					
				 					td2.children().val(json.value[i].CUSTNM); 	//거래처명
				 					td3.children().val(json.value[i].CUSTFULLNM); 	//거래처 FULL명칭
				 					
				 					if(json.value[i].IFLAG == '-1'){
				 						td4.children().children().prop("checked", true);	//공급처
				 					}
				 					if(json.value[i].OFLAG == '-1'){
				 						td5.children().children().prop("checked", true);	//납품처
				 					}
				 					if(json.value[i].MFLAG == '-1'){
				 						td6.children().children().prop("checked", true);	//제조사
				 					}
				 					
				 					td7.children().val(json.value[i].MATNRCODE);	//품번 채번코드
				 					td8.children().val(json.value[i].BARINDEXCODE);	//바코드 채번코드
				 					td9.children().val(json.value[i].INITIAL);	//거래처 이니셜
				 					td10.children().val(json.value[i].REGNO);	//사업자번호
				 					td11.children().val(json.value[i].SMAN);	//담당자
				 					td12.children().val(json.value[i].EMAIL);	//이메일
				 					td13.children().val(json.value[i].TEL1);	//전화1
				 					td14.children().val(json.value[i].TEL2);	//전화2
				 					td15.children().val(json.value[i].FAX1);	//팩스
				 					td16.children().val(json.value[i].ADDR);	//주소
				 					td17.children().val(json.value[i].MEMO);	//메모
				 					td18.children().val(json.value[i].USEFLAG);	//사용여부
				 					
				 				}
				 				
				 				//스크롤 영역
				 				var specifiedSize  = $("#"+json.value[0].CUSTCD).offset().top - 400; //지정된 사이즈 
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

</script>



<script type="text/javascript">	

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {
	
	if(getParameterByName("MANDT") != ""){
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