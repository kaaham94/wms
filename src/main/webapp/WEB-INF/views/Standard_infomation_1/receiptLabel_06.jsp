<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 기준정보 - 입고 라벨 타입 관리  -->   
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
									<div class=" table-responsive">
                                    	<button type="button" id="searchButton" style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search"  onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
                                	</div>
                                </div>
                            
                           		<div class="col-sm-6">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">바코드타입</span>
										</span>
										<select id="BARTYPE" name="BARTYPE" class="form-control" style="">
											<option value="">전체</option>
										</select>
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

td:first-child, .fixedColum:first-child {
  position:sticky;
  left:0;
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum:first-child{z-index:2;}

td:nth-child(2), .fixedColum:nth-child(2) {
  position:sticky;
  left:50px; /* 좌측 고정할 컬럼 width합 값  */
  z-index:1;
  background-color:#f9f9f9;
}
.fixedColum:nth-child(2){z-index:2;}

td:nth-child(3), .fixedColum:nth-child(3) {
  position:sticky;
  left:210px; /* 좌측 고정할 컬럼 width합 값  */
  z-index:1;
  background-color:#f9f9f9;
 
}
.fixedColum:nth-child(3){z-index:2;}

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
                                        <col style="width: 50px;"><!-- 선택 -->
										<col style="width: 160px;"><!-- 거래처 -->
										<col style="width: 130px;"><!-- 라벨종류 -->
										<col style="width: 250px;"><!-- 바코드타입 -->
										
										<col style="width: 40px;"><!-- 수기입력 -->
										<col style="width: 110px;"><!-- 조회제거문자-->
										<col style="width: 90px;"><!-- 전구분자-->
										<col style="width: 90px;"><!-- 후구분자 -->
										<col style="width: 70px;"><!-- 길이 -->
										
										<col style="width: 40px;"><!-- 수기입력 -->
										<col style="width: 70px;"><!-- 전구분자 -->
										<col style="width: 90px;"><!-- 후구분자 -->
										<col style="width: 70px;"><!-- 길이 -->
										
										<col style="width: 40px;"><!-- 수기입력 -->
										<col style="width: 150px;"><!-- 일자타입 -->
										<col style="width: 90px;"><!-- 전구분자 -->
										<col style="width: 90px;"><!-- 후구분자 -->
											
										<col style="width: 260px;"><!-- 이미지 -->
										<col style="width: 60px;"><!-- 이미지 보기 -->
										<col style="width: 85px;"><!-- 거래처 품번 매핑처리 -->
										<col style="width: 75px;"><!-- 사용여부 -->
										<col style="width: 200px;"><!-- 비고 -->
										<col style="width: 800px;"><!-- 예제 바코드 데이터 -->
										<col style="width: 90px;"><!-- 생성일시 -->
										<col style="width: 80px;"><!-- 생성자 -->
										<col style="width: 90px;"><!-- 수정일시 -->
										<col style="width: 80px;"><!-- 수정자 -->
										
                                    </colgroup>
                             		<thead>
										<tr>
											<th class ="fixedColum" rowspan="2" style="vertical-align:middle">선택</th>
											<th class ="fixedColum" rowspan="2" style="vertical-align:middle">거래처</th>
											<th class ="fixedColum" rowspan="2" style="vertical-align:middle">라벨종류</th>
											<th rowspan="2" style="vertical-align:middle">바코드타입</th>
											<th colspan="5" style="vertical-align:middle">P코드</th>
											<th colspan="4" style="vertical-align:middle">Q코드</th>
											<th colspan="4" style="vertical-align:middle">S코드</th>
											<th rowspan="2" style="vertical-align:middle">이미지</th>
											<th rowspan="2" style="vertical-align:middle">이미지보기</th>
											<th rowspan="2" style="vertical-align:middle">거래처 품번매핑처리</th>
											<th rowspan="2" style="vertical-align:middle">사용여부</th>
											<th rowspan="2" style="vertical-align:middle">비고</th>
											<th rowspan="2" style="vertical-align:middle">예제 바코드데이터</th>
											<th rowspan="2" style="vertical-align:middle">생성일시</th>
											<th rowspan="2" style="vertical-align:middle">생성자</th>
											<th rowspan="2" style="vertical-align:middle">수정일시</th>
											<th rowspan="2" style="vertical-align:middle">수정자</th>
										</tr>
										<tr>
											<th>수기입력</th>
											<th>조회제거문자</th>
											<th>전구분자</th>
											<th>후구분자</th>
											<th>길이</th>
											
											<th>수기입력</th>
											<th>전구분자</th>
											<th>후구분자</th>
											<th>길이</th>
											
											<th>수기입력</th>
											<th>일자타입</th>
											<th>전구분자</th>
											<th>후구분자</th>
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

<style>

.popupFixHead          { overflow-x: hidden; overflow-y: auto; height: 580px; }

</style>
<!-- 팝업 -->
<div class="modal fade modal_status" id="popupView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-big " style="width:800px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                	<i class="fa fa-picture-o" aria-hidden="true"></i> 파일명 :
                	<span class="word-title" id="popup_IMAGECODE" value=""></span>
                </h4>
            </div>


            <div class="modal-body common_popup padding-bottom-50 popupFixHead">
				
				<div id="downloadImage" align="center"  style="width: 700px;" >
				
				   <img id='myimage' alt="" src=""  style=" width: 700px; " >
				
				</div>	
            </div>
			
            <div class="modal-footer text-align-center">
                <button type="button" class="btn btn-lg btn-blue" id="save">이미지 저장</button>
                <button type="button" class="btn btn-lg btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<!-- 웹화면 캡쳐 라이브러리 -->
<script src="<c:url value='/js/FileSaver.min.js'/>" charset="utf-8"></script>
<script src="<c:url value='/js/html2canvas.js'/>" charset="utf-8"></script>
<!-- ajax form 전송 라이브러리 -->
<script src="<c:url value='/js/jquery.form.js'/>" charset="utf-8"></script>

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



//P코드 - 수기입력 체크박스 선택
function PINPUT_check(it) {
	tr = it.parentNode.parentNode.parentNode.getAttribute('name');
	
	var color = "";
	if(tr == "defaultTd"){
		color = "#3fc21f"
	}else if(tr == "mytr"){
		color = "gold"
	}
	
	td = it.parentNode.parentNode;//수기입력 
	
	td0 = td.nextElementSibling;  	//조회제거문자 
	td1 = td0.nextElementSibling; 	//전구분자
	td2 = td1.nextElementSibling; 	//후구분자
	td3 = td2.nextElementSibling; 	//길이

	//3.1 체크박스 체크
	if (it.checked){ 
		appendText(td1);
		appendText(td2);
		appendText(td3);
		td1.innerHTML = ""; 
		td2.innerHTML = ""; 
		td3.innerHTML = ""; 
	//3.2 체크박스 해제	
	}else{
		td1.style.backgroundColor = color;
		td2.style.backgroundColor = color;
		td3.style.backgroundColor = color;
		appendInput(td1);
		appendInput(td2);
		appendInput(td3);
	}	
}

//Q코드 - 수기입력 체크박스 선택
function QINPUT_check(it) {
	tr = it.parentNode.parentNode.parentNode.getAttribute('name');
	
	var color = "";
	if(tr == "defaultTd"){
		color = "#3fc21f"
	}else if(tr == "mytr"){
		color = "gold"
	}
	
	td = it.parentNode.parentNode;//수기입력 
	
	td0 = td.nextElementSibling;  	//전구분자 
	td1 = td0.nextElementSibling; 	//후구분자
	td2 = td1.nextElementSibling; 	//길이

	//3.1 체크박스 체크
	if (it.checked){ 
		appendText(td0);
		appendText(td1);
		appendText(td2);
		td0.innerHTML = ""; 
		td1.innerHTML = ""; 
		td2.innerHTML = ""; 
	//3.2 체크박스 해제	
	}else{
		td0.style.backgroundColor = color;
		td1.style.backgroundColor = color;
		td2.style.backgroundColor = color;
		appendInput(td0);
		appendInput(td1);
		appendInput(td2);
	}	
}

//S코드 - 수기입력 체크박스 선택
function SINPUT_check(it) {
	tr = it.parentNode.parentNode.parentNode.getAttribute('name');
	
	var color = "";
	if(tr == "defaultTd"){
		color = "#3fc21f"
	}else if(tr == "mytr"){
		color = "gold"
	}
	
	td = it.parentNode.parentNode;//수기입력 
	
	td0 = td.nextElementSibling;  	//일자타입 
	td1 = td0.nextElementSibling; 	//전구분자
	td2 = td1.nextElementSibling; 	//후구분자

	//3.1 체크박스 체크
	if (it.checked){ 
		appendText(td1);
		appendText(td2);
		td1.innerHTML = ""; 
		td2.innerHTML = ""; 
	//3.2 체크박스 해제	
	}else{
		td1.style.backgroundColor = color;
		td2.style.backgroundColor = color;
		appendInput(td1);
		appendInput(td2);
	}	
}


//이미지 팝업 함수

function imagePopup(it){

	var td = it.parentNode;				//이미지 보기
	var td0 = td.previousElementSibling;//이미지
	
	var IMAGENAME = "";
	var IMAGECODE = "";

	if(td0.childNodes[0].nodeName == "SELECT"){ // 행 선택 했을 때, -> SELECT 태그 
		IMAGENAME = td0.childNodes[0].options[td0.childNodes[0].options.selectedIndex].text;
		IMAGECODE = td0.childNodes[0].value;
	
	}else if(td0.childNodes[0].nodeName == "#text"){ // 행 선택 안했을때, -> TD 태그의 text 
		IMAGENAME = td0.innerText;
		IMAGECODE = td0.getAttribute('value');
	}
	
	if( IMAGECODE == '' || IMAGECODE == null ){
		return;
	}else{
		
		$("#myimage").attr("src", server_url+"WMS/imageReference_05Select_VIEWIMAGE.do?IMAGECODE=" + IMAGECODE + "&MANDT=100");
		$("#popup_IMAGECODE").html(IMAGENAME);
		$('#popupView').modal("show");
	}
}

//이미지 다운로드
$("#save").click(function() { 
    html2canvas($("#downloadImage"), {
        onrendered: function(canvas) {
            canvas.toBlob(function(blob) {
                saveAs(blob, 'image.jpg');
            });
        }
    });
});

//코드종류 Select
var Select_array_BARTYPE =  new Array(); 
var Select_list_BARTYPE = "";

var Select_array_CUSTCD =  new Array();
var Select_list_CUSTCD = "";

var Select_array_VIEWIMAGE =  new Array();
var Select_list_VIEWIMAGE = "";

var Select_array_SDATETYPE =  new Array();
var Select_list_SDATETYPE = "";

function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/receiptLabel_06/receiptLabel_06Select.do',
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
			$('#BARTYPE').html('<option value="">전체</option>');
			
			var list ="";
			var TOTAL_COUNT = "";
			var keyValue = "";
			Select_list_BARTYPE = "";
			Select_list_CUSTCD = "";
			Select_list_VIEWIMAGE = "";
			Select_list_SDATETYPE = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}	
		
			//코드종류 Select
			Select_array_BARTYPE = data['Select_BARTYPE'];
			Select_array_VIEWIMAGE = data['Select_VIEWIMAGE'];
			Select_array_CUSTCD = data['Select_CUSTCD'];
			Select_array_SDATETYPE = data['Select_SDATETYPE'];
		
			for(var j = 0 ; j < Select_array_BARTYPE.length; j ++ ){
				Select_list_BARTYPE += "<option value="+Select_array_BARTYPE[j].BARTYPE_CODE+">"+Select_array_BARTYPE[j].BARTYPE+"</option>";
			}
			
			for(var j = 0 ; j < Select_array_CUSTCD.length; j ++ ){
				Select_list_CUSTCD += "<option value="+Select_array_CUSTCD[j].CUSTCD_CODE+">"+Select_array_CUSTCD[j].CUSTCD+"</option>";
			}
			
			for(var j = 0 ; j < Select_array_VIEWIMAGE.length; j ++ ){
				Select_list_VIEWIMAGE += "<option value="+Select_array_VIEWIMAGE[j].IMAGECODE_CODE+">"+Select_array_VIEWIMAGE[j].IMAGECODE+"</option>";
			}
		
			for(var j = 0 ; j < Select_array_SDATETYPE.length; j ++ ){
				Select_list_SDATETYPE += "<option value="+Select_array_SDATETYPE[j].SDATETYPE+">"+Select_array_SDATETYPE[j].SDATETYPE+"</option>";
			}
			
			for(var i = 0 ; i < data['list'].length ; i ++ ){
				keyValue = data['list'][i].CUSTCD_CODE + data['list'][i].CTYPE;
				list += "<tr name='defaultTd'>"+
									"<td class='text-align-center' >"+
									"	<label>"+
									"		<input type='checkbox' name='chk[]' id='"+keyValue+"' value='' onclick='check(this)'><span class='text'></span>"+
									"	</label>"+
									"</td>"+
									"<td class='text-align-left' value='"+ data['list'][i].CUSTCD_CODE +"' >"+ data['list'][i].CUSTCD +"</td>"+ 	//거래처
									"<td class='text-align-left'>"+ data['list'][i].CTYPE +"</td>"+		//라벨종류
									"<td class='text-align-left'>"+ data['list'][i].BARTYPE +"</td>"+	//바코드타입
									
									//<!-- P코드 -->
									"<td class='text-align-center'>"+						
										"<label>"+	
											"<input disabled='true' type='checkbox' name='PINPUT' id='PINPUT' value='-1' onclick='PINPUT_check(this)' >"+ //수기입력
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									"<td class='text-align-left'>"+ data['list'][i].PSPLITSTRING +"</td>"+	//조회제거문자
									"<td class='text-align-left'>"+ data['list'][i].PPREFIX +"</td>"+		//전구분자
									"<td class='text-align-left'>"+ data['list'][i].PLASTFIX +"</td>"+		//후구분자
									"<td class='text-align-left'>"+ data['list'][i].PLENGTH +"</td>"+		//길이
									
									//<!-- Q코드 -->
									"<td class='text-align-center'>"+						
										"<label>"+	
											"<input disabled='disabled' type='checkbox' name='QINPUT' id='QINPUT' value='-1' onclick='QINPUT_check(this)' >"+ //수기입력
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									"<td class='text-align-left'>"+ data['list'][i].QPREFIX +"</td>"+//전구분자
									"<td class='text-align-left'>"+ data['list'][i].QLASTFIX +"</td>"+//후구분자
									"<td class='text-align-left'>"+ data['list'][i].QLENGTH +"</td>"+//길이
									
									//<!-- S코드 -->
									"<td class='text-align-center'>"+						
										"<label>"+	
											"<input disabled='disabled' type='checkbox' name='SINPUT' id='SINPUT' value='-1' onclick='SINPUT_check(this)' >"+ //수기입력
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									"<td class='text-align-left'>"+ data['list'][i].SDATETYPE +"</td>"+	//일자타입
									"<td class='text-align-left'>"+ data['list'][i].SPREFIX +"</td>"+	//전구분자
									"<td class='text-align-left'>"+ data['list'][i].SLASTFIX +"</td>"+	//후구분자
									
									//이미지
									"<td class='text-align-left' value=\""+data['list'][i].IMAGECODE_CODE+"\">"+ data['list'][i].IMAGECODE +"</td>"+
									
									//이미지 보기
									"<td class='text-align-center'>"+ 
										"<a href='#' data-toggle='modal' class='btn'  onclick='imagePopup(this)'   style='position:static; "+	
											"<span class='label label-info' > <i class='fa fa-picture-o' style='color:#57b5e3; margin-right:-1px;'></i> </span>"+
										"</a>"+
									"</td>"+
									
									//거래처 품번 매핑처리	
									"<td class='text-align-center'>"+					
										"<label>"+	
											"<input disabled='disabled' type='checkbox' name='CMATNRFLAG' id='CMATNRFLAG' value='-1' >"+ 
											"<span class='text'></span>"+
										"</label>"+
									"</td>"+
									
									"<td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+ //사용여부
									"<td class='text-align-left'>"+ data['list'][i].REMARK +"</td>"+ //비고
									"<td class='text-align-left'>"+ data['list'][i].EXBARDATA +"</td>"+ //예제 바코드 데이터
									
									"<td class='text-align-center'>"+ data['list'][i].MKDATE +"</td>"+ //생성일시(=등록일)
									"<td class='text-align-center'>"+ data['list'][i].MKUSER +"</td>"+ //생성자 (=등록자)
									"<td class='text-align-center'>"+ data['list'][i].MODATE +"</td>"+ //수정일시
									"<td class='text-align-center'>"+ data['list'][i].MOUSER +"</td>"+ //수정자
								"</tr>";
			}
			
			$('#mytable tbody').append(list);		
			$('#BARTYPE').append(Select_list_BARTYPE);
			
			for(var k = 0 ; k < data['list'].length; k++ ){
				
				if(data['list'][k].PINPUT == '-1'){ //P코드 수기입력 
					$("tr input:checkbox[id='PINPUT']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].QINPUT == '-1'){ //Q코드 수기입력 
					$("tr input:checkbox[id='QINPUT']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].SINPUT == '-1'){ //S코드 수기입력 
					$("tr input:checkbox[id='SINPUT']").eq(k).prop("checked", true);
				}
				
				if(data['list'][k].CMATNRFLAG == '-1'){ //거래처 품번 매핑처리
					$("tr input:checkbox[id='CMATNRFLAG']").eq(k).prop("checked", true);
				}
			}
			
			$("#BARTYPE").val(data['map'].BARTYPE);
			
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

//행  Select 변환 함수
var appendSelect_array_BARTYPE = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_BARTYPE.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_BARTYPE[i].BARTYPE_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_BARTYPE[i].BARTYPE ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_BARTYPE[i].BARTYPE){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}
	
	

var appendSelect_array_VIEWIMAGE = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_VIEWIMAGE.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_VIEWIMAGE[i].IMAGECODE_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_VIEWIMAGE[i].IMAGECODE ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_VIEWIMAGE[i].IMAGECODE){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

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
		OPT[i].setAttribute('value', Select_array_CUSTCD[i].CUSTCD_CODE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_CUSTCD[i].CUSTCD ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_CUSTCD[i].CUSTCD){
			OPT[i].setAttribute('selected', 'selected');
		}		
	}	
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

var appendSelect_array_SDATETYPE = function(val, color) {
	
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
	
	for(var i = 0 ; i < Select_array_SDATETYPE.length ; i ++ ){
		
		OPT[i] = document.createElement('OPTION');
		
		//객체 속성 추가 
		//Option value 객체 생성
		OPT[i].setAttribute('value', Select_array_SDATETYPE[i].SDATETYPE);
		
		//Option Text 객체 생성 
		OPT[i].appendChild( document.createTextNode( Select_array_SDATETYPE[i].SDATETYPE ) );
		
		//Select 객체 안에 Option 객체 추가 
		selectObj.appendChild(OPT[i]);
		
		if(td_texter == Select_array_SDATETYPE[i].SDATETYPE){
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
*/ 	

//수기입력 - 선택된 행에 수기입력이 체크된 상태에서 체크박스 클릭해제 할때 로직  
var appendText_receiptLabel_06 = function(val) {
	var td = val; 
	if(td.innerHTML != "" ){
		//td 속성 변경 

		//td 속성 변경 
		td.textContent = td.childNodes[0].value;
		
		//배경색 제거
		td.style.backgroundColor = "";
	}	
}	

//이미지 - 선택된 행에 이미지 셀렉트값을 바꿀때 선택값이 td값으로 이동하는 로직  
var appendSelectText_receiptLabel_06 = function(val) {
	
	var td = val; 
	var imageValue = td.childNodes[0].value
	
	//td 속성 변경 
	td.textContent = td.childNodes[0].options[td.childNodes[0].options.selectedIndex].text;
	
	td.setAttribute('value' ,imageValue )
	//배경색 제거
	td.style.backgroundColor = "";
}


//체크박스 선택된 해당 열 선택    
function check(it) {
	
	td = it.parentNode.parentNode;//선택
	
	td0 = td.nextElementSibling;  	//거래처 
	td1 = td0.nextElementSibling; 	//라벨종류
	td2 = td1.nextElementSibling; 	//바코드타입
	td3 = td2.nextElementSibling; 	//P코드 - 수기입력
	td4 = td3.nextElementSibling; 	//P코드 - 조회제거문자
	td5 = td4.nextElementSibling; 	//P코드 - 전구분자
	td6 = td5.nextElementSibling; 	//P코드 - 후구분자
	td7 = td6.nextElementSibling;	//P코드 - 길이
	
	td8 = td7.nextElementSibling;	//Q코드 - 수기입력
	td9 = td8.nextElementSibling; 	//Q코드 - 전구분자
	td10 = td9.nextElementSibling; 	//Q코드 - 후구분자
	td11 = td10.nextElementSibling; //Q코드 - 길이
	
	td12 = td11.nextElementSibling; //S코드 - 수기입력
	td13 = td12.nextElementSibling; //S코드 - 일자타입
	td14 = td13.nextElementSibling; //S코드 - 전구분자
	td15 = td14.nextElementSibling; //S코드 - 후구분자
	
	td16 = td15.nextElementSibling; //이미지
	td17 = td16.nextElementSibling; //이미지보기 
	td18 = td17.nextElementSibling; //거래처 품번 매핑처리
	td19 = td18.nextElementSibling; //사용여부
	td20 = td19.nextElementSibling; //비고
	td21 = td20.nextElementSibling; //예제 바코드 데이터
	
	var mail_arr = 	[{ yesCheck: appendSelect_array_CUSTCD, 	noCheck: appendSelectText,  column: td0},  //거래처
					{  yesCheck: appendInput, 					noCheck: appendText,  		column: td1},  //라벨종류  
					{  yesCheck: appendSelect_array_BARTYPE, 	noCheck: appendSelectText , column: td2},  //바코드타입  
					
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  column: td3},  //P코드 - 수기입력 
					{  yesCheck: appendInput, 					noCheck: appendText,  		column: td4},  //P코드 - 조회제거문자 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td5},  //P코드 - 전구분자 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td6},  //P코드 - 후구분자 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td7},  //P코드 - 길이
					
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  column: td8},  //Q코드 - 수기입력
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td9},  //Q코드 - 전구분자 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td10},  //Q코드 - 후구분자 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td11},  //Q코드 - 길이 
					
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  column: td12},  //S코드 - 수기입력 
					{  yesCheck: appendSelect_array_SDATETYPE, 	noCheck: appendSelectText,  column: td13},  //S코드 - 일자타입 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td14},  //S코드 - 전구분자 
					{  yesCheck: appendInput, 					noCheck: appendText_receiptLabel_06,  		column: td15},  //S코드 - 후구분자
					
					{  yesCheck: appendSelect_array_VIEWIMAGE, 	noCheck: appendSelectText_receiptLabel_06,  column: td16},  //이미지
					{  yesCheck: appendImage, 					noCheck: appendNoImage,  		column: td17},  //이미지보기
					{  yesCheck: appendCheckbox, 				noCheck: appendNoCheckbox,  column: td18},	//거래처 품번 매핑처리
					{  yesCheck: appendSelect, 					noCheck: appendText,  		column: td19},	//사용여부
					{  yesCheck: appendInput, 					noCheck: appendText,  		column: td20}, 	//비고
					{  yesCheck: appendInput, 					noCheck: appendText,  		column: td21}]; //예제 바코드 데이터

	//2.1 추가된 행 
	if(td0.parentNode.attributes.name.value == "mytr"){
		
		//3.1 체크박스 체크
		if (it.checked){ 
			for (var prop in mail_arr) {
				td.style.backgroundColor = "gold";
				mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
				
			}

			if(td3.childNodes[0].childNodes[0].checked){
				PINPUT_check(td3.childNodes[0].childNodes[0])
			}
			if(td8.childNodes[0].childNodes[0].checked){
				QINPUT_check(td8.childNodes[0].childNodes[0])
			}
			if(td12.childNodes[0].childNodes[0].checked){
				SINPUT_check(td12.childNodes[0].childNodes[0])
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
		mail_arr.splice(0, 1); //(라벨종류 삭제)
		
		//3.1 체크박스 체크
		if (it.checked){ 
			for (var prop in mail_arr) {
				td.style.backgroundColor = "#3fc21f";
				mail_arr[prop].yesCheck(mail_arr[prop].column, "#3fc21f");
			}
			
			if(td3.childNodes[0].childNodes[0].checked){
				PINPUT_check(td3.childNodes[0].childNodes[0])
			}
			if(td8.childNodes[0].childNodes[0].checked){
				QINPUT_check(td8.childNodes[0].childNodes[0])
			}
			if(td12.childNodes[0].childNodes[0].checked){
				SINPUT_check(td12.childNodes[0].childNodes[0])
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
					Select_list_CUSTCD+
	        	'</select>'+
		 	'</td>'+
			
			//라벨종류
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//바코드타입
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_BARTYPE+
	        	'</select>'+
		 	'</td>'+
			
			
			//<!-- P코드 -->
			//수기입력
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+							  
					'<input type="checkbox" value="-1" onclick="PINPUT_check(this)">'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+
			
			//조회제거문자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//전구분자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//후구분자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//길이
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//<!-- Q코드 -->
			//수기입력
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" onclick="QINPUT_check(this)" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+
			//전구분자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//후구분자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//길이
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+

			//<!-- S코드 -->
			//수기입력
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" onclick="SINPUT_check(this)" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+
			
			//일자타입
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_SDATETYPE+
	        	'</select>'+
		 	'</td>'+
			
			//전구분자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//후구분자
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
	
			//이미지
			'<td class="text-align-left" style="background-color:gold;">'+
				'<select type="text" value="" style="width:100%;" >'+
					Select_list_VIEWIMAGE+
	        	'</select>'+
		 	'</td>'+
	
		 	//이미지 보기
		 	'<td class="text-align-center" style="background-color: gold;">'+ 
		 		'<a href="#" data-toggle="modal" class="btn"  onclick="imagePopup(this)"   style="position:static; >'+	
		 			'<span class="label label-info" > <i class="fa fa-picture-o" style="color:#57b5e3; margin-right:-1px;"></i> </span>'+
		 		'</a>'+
		 	'</td>'+
	
			//거래처 품번 매핑처리	
			'<td class="text-align-center" style="background-color: gold;">'+						
				'<label>'+	
					'<input type="checkbox" value="-1" >'+ 
					'<span class="text"></span>'+
				'</label>'+
			'</td>'+
	
			//사용여부
			'<td class="text-align-center" style="background-color: gold;">'+
				'<select type="text" value="Y" style="width:100%;">'+
					'<option value="Y" selected="selected">Y</option>'+
					'<option value="N">N</option>'+
				'</select>'+
			'</td>'+
			
			//비고
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//예제 바코드 데이터
			'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
			
			//생성일시(=등록일)
			'<td class="text-align-center"></td>'+
			
			//생성자 (=등록자)
			'<td class="text-align-center"></td>'+
			
			//수정일시
			'<td class="text-align-center"></td>'+
			
			//수정자
			'<td class="text-align-center"></td>'+
		'</tr>'
		
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

		var	td0 = td.next(); 		//거래처 
		var	td1 = td0.next();		//라벨종류
		var	td2 = td1.next();		//바코드타입

		var	td3 = td2.next();		//P코드 - 수기입력
		var	td4 = td3.next();		//P코드 - 조회제거문자
		var	td5 = td4.next();		//P코드 - 전구분자
		var	td6 = td5.next();		//P코드 - 후구분자
		var	td7 = td6.next();		//P코드 - 길이
				
		var	td8 = td7.next();		//Q코드 - 수기입력
		var	td9 = td8.next();		//Q코드 - 전구분자
		var	td10 = td9.next(); 		//Q코드 - 후구분자
		var	td11 = td10.next();		//Q코드 - 길이				

		var	td12 = td11.next();		//S코드 - 수기입력
		var	td13 = td12.next();		//S코드 - 일자타입
		var	td14 = td13.next();		//S코드 - 전구분자
		var	td15 = td14.next();		//S코드 - 후구분자		
			
		var	td16 = td15.next();		//이미지
		var	td17 = td16.next();		//이미지보기 
		var	td18 = td17.next();		//거래처 품번 매핑처리
		var	td19 = td18.next();		//사용여부
		var	td20 = td19.next();		//비고
		var	td21 = td20.next();		//예제 바코드 데이터
		
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}

		  var checkbox_arr = [{ checkbox: td3.eq(i).children().children(":checked").val()}, 	//P코드 - 수기입력
							{ checkbox: td8.eq(i).children().children(":checked").val() },  	//Q코드 - 수기입력
							{ checkbox: td12.eq(i).children().children(":checked").val() },  	//S코드 - 수기입력
							{ checkbox: td18.eq(i).children().children(":checked").val() }];  	//거래처 품번 매핑처리
						
	
			//체크박스 체크
			for (var prop in checkbox_arr) {
				if( checkbox_arr[prop].checkbox == -1){			
					checkbox_arr[prop].checkbox = "Y";
				}else{
					checkbox_arr[prop].checkbox = "";
				}
			}
							
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT:   		"100",		 						//클라이언트
				CUSTCD:  		td0.eq(i).children().val(),			//거래처
				CTYPE: 	 		trim(td1.eq(i).children().val()),	//라벨종류
				BARTYPE: 		td2.eq(i).children().val(),	 		//바코드타입
				
				PINPUT: 		checkbox_arr[0].checkbox, 		 	//P코드 수기입력
				PSPLITSTRING:	trim(td4.eq(i).children().val()),	//조회제거문자
				PPREFIX: 		trim(td5.eq(i).children().val()),	//전구분자
				PLASTFIX: 		trim(td6.eq(i).children().val()),	//후구분자
				PLENGTH: 		trim(td7.eq(i).children().val()),	//길이
				
				QINPUT: 		checkbox_arr[1].checkbox,		 	//Q코드 수기입력
				QPREFIX: 		trim(td9.eq(i).children().val()),  	//전구분자
				QLASTFIX: 		trim(td10.eq(i).children().val()), 	//후구분자
				QLENGTH: 		trim(td11.eq(i).children().val()), 	//길이
				
				SINPUT: 		checkbox_arr[2].checkbox,		 	//S코드 수기입력
				SDATETYPE: 		td13.eq(i).children().val(), 		//일자타입
				SPREFIX: 	 	trim(td14.eq(i).children().val()), 	//전구분자
				SLASTFIX: 		trim(td15.eq(i).children().val()), 	//후구분자
				
				IMAGECODE:		td16.eq(i).children().val(),		//이미지코드
				CMATNRFLAG:		checkbox_arr[3].checkbox, 			//거래처품번매핑처리
				USEFLAG:		td19.eq(i).children().val(), 		//사용유무
				REMARK:			trim(td20.eq(i).children().val()), 	//비고
				EXBARDATA:	 	trim(td21.eq(i).children().val()),	//바코드예제
				USERID: 		user,								//사용자
				NEWFLAG: 	 	'Y'									//신규여부
			});

			//공백 validation 체크 
			if(insertArray[i].CTYPE == ""){
				alert("라벨종류가 공백입니다.");
				save_chk = false;
				break;
			};
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/receiptLabel_06InsertUpdate.do",
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

		 					$('#CUSTCD').val(""); 	//거래처코드
		 					$('#CUSTNM').val("");	//거래처명
		 					$('#USEFLAG').val("Y"); //사용유무
		 					$('#BARTYPE').val("Y"); //바코드타입
		 					
		 				 	$('#orderby').val('MKDATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
							/*
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
													Select_list_CUSTCD+
												'</select>'+
											'</td>'+
											
											//라벨종류
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].CTYPE+'" style="width:100%; height:31px;"></td>'+
											
											//바코드타입
											'<td class="text-align-left" style="background-color:gold;">'+
												'<select type="text" value="" style="width:100%;" >'+
													Select_list_BARTYPE+
												'</select>'+
											'</td>'+
											
											
											//<!-- P코드 -->
											//수기입력
											'<td class="text-align-center" style="background-color: gold;">'+						
												'<label>'+							  
													'<input type="checkbox" name="PINPUT" id="PINPUT" value="-1" onclick="PINPUT_check(this)">'+ 
													'<span class="text"></span>'+
												'</label>'+
											'</td>'+
											
											//조회제거문자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].PSPLITSTRING+'" style="width:100%; height:31px;"></td>'+
											
											//전구분자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].PPREFIX+'" style="width:100%; height:31px;"></td>'+
											
											//후구분자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].PLASTFIX+'" style="width:100%; height:31px;"></td>'+
											
											//길이
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].PLENGTH+'" style="width:100%; height:31px;"></td>'+

											//<!-- Q코드 -->
											//수기입력
											'<td class="text-align-center" style="background-color: gold;">'+						
												'<label>'+	
													'<input type="checkbox" name="QINPUT" id="QINPUT" value="-1" onclick="QINPUT_check(this)" >'+ 
													'<span class="text"></span>'+
												'</label>'+
											'</td>'+
											//전구분자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].QPREFIX+'" style="width:100%; height:31px;"></td>'+
											
											//후구분자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].QLASTFIX+'" style="width:100%; height:31px;"></td>'+
											
											//길이
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].QLENGTH+'" style="width:100%; height:31px;"></td>'+

											//<!-- S코드 -->
											//수기입력
											'<td class="text-align-center" style="background-color: gold;">'+						
												'<label>'+	
													'<input type="checkbox" name="SINPUT" id="SINPUT" value="-1" onclick="SINPUT_check(this)" >'+ 
													'<span class="text"></span>'+
												'</label>'+
											'</td>'+
											
											//일자타입
											'<td class="text-align-left" style="background-color:gold;">'+
												'<select type="text" value="" style="width:100%;" >'+
													Select_list_SDATETYPE+
												'</select>'+
											'</td>'+
											
											//전구분자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].SPREFIX+'" style="width:100%; height:31px;"></td>'+
											
											//후구분자
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="'+json.value[i].SLASTFIX+'" style="width:100%; height:31px;"></td>'+
									
											//이미지
											'<td class="text-align-left" style="background-color:gold;">'+
												'<select type="text" value="" style="width:100%;" >'+
													Select_list_VIEWIMAGE+
												'</select>'+
											'</td>'+
									
											//이미지 보기
											'<td class="text-align-center" style="background-color: gold;">'+ 
												'<a href="#" data-toggle="modal" class="btn"  onclick="imagePopup(this)"   style="position:static; >'+	
													'<span class="label label-info" > <i class="fa fa-picture-o" style="color:#57b5e3; margin-right:-1px;"></i> </span>'+
												'</a>'+
											'</td>'+
									
											//거래처 품번 매핑처리	
											'<td class="text-align-center" style="background-color: gold;">'+						
												'<label>'+	
													'<input type="checkbox" name="CMATNRFLAG" id="CMATNRFLAG" value="-1" >'+ 
													'<span class="text"></span>'+
												'</label>'+
											'</td>'+
									
											//사용여부
											'<td class="text-align-center" style="background-color: gold;">'+
												'<select type="text" value="Y" style="width:100%;">'+
													'<option value="Y" selected="selected">Y</option>'+
													'<option value="N">N</option>'+
												'</select>'+
											'</td>'+
											
											//비고
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
											
											//예제 바코드 데이터
											'<td class="text-align-left" style="background-color: gold;"><input type="text" value="" style="width:100%; height:31px;"></td>'+
											
											//생성일시(=등록일)
											'<td class="text-align-center"></td>'+
											
											//생성자 (=등록자)
											'<td class="text-align-center"></td>'+
											
											//수정일시
											'<td class="text-align-center"></td>'+
											
											//수정자
											'<td class="text-align-center"></td>'+
										'</tr>'
											
									);
									//checkbox값 적용 
									if(json.value[i].PINPUT == 'Y'){
										$("tbody tr:last input:checkbox[id='PINPUT']").prop("checked", true);	//P코드 수기입력
										$("tbody tr:last input:checkbox[id='PINPUT']").next().text();
										$("tbody tr:last input:checkbox[id='PINPUT']").next().text();
									}
									
									if(json.value[i].QINPUT == 'Y'){
										$("tbody tr:last input:checkbox[id='QINPUT']").prop("checked", true);	//Q코드 수기입력
									}
									
									if(json.value[i].SINPUT == 'Y'){
										$("tbody tr:last input:checkbox[id='SINPUT']").prop("checked", true);	//S코드 수기입력
									}
									
									if(json.value[i].CMATNRFLAG == 'Y'){
										$("tbody tr:last input:checkbox[id='CMATNRFLAG']").prop("checked", true);	//거래처품번매핑처리
									}
									
				 					//select 값 적용
									$("tbody tr:last select").eq(0).val(json.value[i].BARTYPE_CODE).attr("selected", "selected");
									$("tbody tr:last select").eq(1).val(json.value[i].CUSTCD_CODE).attr("selected", "selected");
									$("tbody tr:last select").eq(2).val(json.value[i].IMAGECODE_CODE).attr("selected", "selected");   	
									$("tbody tr:last select").eq(3).val(json.value[i].SDATETYPE).attr("selected", "selected");   	
									$("tbody tr:last select").eq(4).val(json.value[i].IMAGECODE_CODE).attr("selected", "selected");  //이미지	
									$("tbody tr:last select").eq(5).val(json.value[i].USEFLAG).attr("selected", "selected");   		//사용여부
				 
				 					//체크박스 체크, 색 적용   
					 			 	$("tbody tr:last input:checkbox:eq(0)").prop("checked", true);		
					 				$("tbody tr:last input:checkbox:eq(0)").parent().parent().css("background-color", "gold");
					 				
				 				}
				 				
				 				//스크롤 영역
				 				var totalScroll = $('#scroll').prop('scrollHeight'); //스크롤 전체 크기
				 			    var scrollMove = {top:totalScroll, left:240}; //스크롤 맨 밑 위치 
				 			 
				 			  	$('html, #scroll').animate({//스크롤 위치 이동
				 				    scrollTop: scrollMove.top
				 				}, 10);
			 				
			 				}//유효성 검사에 막힌 데이터 반환  끝
			 			*/
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

		var	td0 = td.next(); 		//거래처 
		var	td1 = td0.next();		//라벨종류
		var	td2 = td1.next();		//바코드타입

		var	td3 = td2.next();		//P코드 - 수기입력
		var	td4 = td3.next();		//P코드 - 조회제거문자
		var	td5 = td4.next();		//P코드 - 전구분자
		var	td6 = td5.next();		//P코드 - 후구분자
		var	td7 = td6.next();		//P코드 - 길이
				
		var	td8 = td7.next();		//Q코드 - 수기입력
		var	td9 = td8.next();		//Q코드 - 전구분자
		var	td10 = td9.next(); 		//Q코드 - 후구분자
		var	td11 = td10.next();		//Q코드 - 길이				

		var	td12 = td11.next();		//S코드 - 수기입력
		var	td13 = td12.next();		//S코드 - 일자타입
		var	td14 = td13.next();		//S코드 - 전구분자
		var	td15 = td14.next();		//S코드 - 후구분자		
			
		var	td16 = td15.next();		//이미지
		var	td17 = td16.next();		//이미지보기 
		var	td18 = td17.next();		//거래처 품번 매핑처리
		var	td19 = td18.next();		//사용여부
		var	td20 = td19.next();		//비고
		var	td21 = td20.next();		//예제 바코드 데이터
		
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			if(save_chk == false){
				break;
			}

		  var checkbox_arr = [{ checkbox: td3.eq(i).children().children(":checked").val()}, 	//P코드 - 수기입력
							{ checkbox: td8.eq(i).children().children(":checked").val() },  	//Q코드 - 수기입력
							{ checkbox: td12.eq(i).children().children(":checked").val() },  	//S코드 - 수기입력
							{ checkbox: td18.eq(i).children().children(":checked").val() }];  	//거래처 품번 매핑처리
							
			//체크박스 체크
			for (var prop in checkbox_arr) {
				if( checkbox_arr[prop].checkbox == -1){			
					checkbox_arr[prop].checkbox = "Y";
				}else{
					checkbox_arr[prop].checkbox = "";
				}
			}

			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT:   		"100",		 						//클라이언트
				CUSTCD:  		td0.eq(i).attr("value"),				//거래처
				CTYPE: 	 		td1.eq(i).text(),					//라벨종류
				BARTYPE: 		td2.eq(i).children().val(),	 		//바코드타입
				
				PINPUT: 		checkbox_arr[0].checkbox, 		 	//P코드 수기입력
				PSPLITSTRING:	trim(td4.eq(i).children().val()),	//조회제거문자
				PPREFIX: 		trim(td5.eq(i).children().val()),	//전구분자
				PLASTFIX: 		trim(td6.eq(i).children().val()),	//후구분자
				PLENGTH: 		trim(td7.eq(i).children().val()),	//길이
				
				QINPUT: 		checkbox_arr[1].checkbox,		 	//Q코드 수기입력
				QPREFIX: 		trim(td9.eq(i).children().val()),  	//전구분자
				QLASTFIX: 		trim(td10.eq(i).children().val()), 	//후구분자
				QLENGTH: 		trim(td11.eq(i).children().val()), 	//길이
				
				SINPUT: 		checkbox_arr[2].checkbox,		 	//S코드 수기입력
				SDATETYPE: 		td13.eq(i).children().val(), 		//일자타입
				SPREFIX: 	 	trim(td14.eq(i).children().val()), 	//전구분자
				SLASTFIX: 		trim(td15.eq(i).children().val()), 	//후구분자
				
				IMAGECODE:		td16.eq(i).children().val(),		//이미지코드
				CMATNRFLAG:		checkbox_arr[3].checkbox, 			//거래처품번매핑처리
				USEFLAG:		td19.eq(i).children().val(), 		//사용유무
				REMARK:			trim(td20.eq(i).children().val()), 	//비고
				EXBARDATA:	 	trim(td21.eq(i).children().val()),	//바코드예제
				USERID: 		user,								//사용자
				NEWFLAG: 	 	''									//신규여부
			});

			
			//공백 validation 체크 
			if(insertArray[i].CTYPE == ""){
				alert("라벨종류가 공백입니다.");
				save_chk = false;
				break;
			};
			
		}//각 행의 데이터 검증 for문 끝
		
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Standard_infomation_1/receiptLabel_06InsertUpdate.do",
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
		 					
		 				$('#CUSTCD').val(""); 	//거래처코드
		 					$('#CUSTNM').val("");	//거래처명
		 					$('#USEFLAG').val("Y"); //사용유무
		 					$('#BARTYPE').val("Y"); //바코드타입
		 					
		 				 	$('#orderby').val('MODATE');
			 			  	$('#orderby').trigger('change');
			 				
			 				$('#searchButton').trigger('click');
	
	
			 				//유효성 검사에 막힌 데이터 반환 
			 				if(json.value.length > 0) {
				 				for(var i = 0 ; i < json.value.length; i ++ ){
				 					
				 					var td = $("#"+json.value[i].CUSTCD_CODE + json.value[i].CTYPE ); //체크박스 
				 					$(td).trigger('click');

				 					var	td0 = td.next(); 		//거래처 
									var	td1 = td0.next();		//라벨종류
									var	td2 = td1.next();		//바코드타입

									var	td3 = td2.next();		//P코드 - 수기입력
									var	td4 = td3.next();		//P코드 - 조회제거문자
									var	td5 = td4.next();		//P코드 - 전구분자
									var	td6 = td5.next();		//P코드 - 후구분자
									var	td7 = td6.next();		//P코드 - 길이
											
									var	td8 = td7.next();		//Q코드 - 수기입력
									var	td9 = td8.next();		//Q코드 - 전구분자
									var	td10 = td9.next(); 		//Q코드 - 후구분자
									var	td11 = td10.next();		//Q코드 - 길이				

									var	td12 = td11.next();		//S코드 - 수기입력
									var	td13 = td12.next();		//S코드 - 일자타입
									var	td14 = td13.next();		//S코드 - 전구분자
									var	td15 = td14.next();		//S코드 - 후구분자		
										
									var	td16 = td15.next();		//이미지
									var	td17 = td16.next();		//이미지보기 
									var	td18 = td17.next();		//거래처 품번 매핑처리
									var	td19 = td18.next();		//사용여부
									var	td20 = td19.next();		//비고
									var	td21 = td20.next();		//예제 바코드 데이터
									
									td2.children().val(json.value[i].BARTYPE);	 		//바코드타입
			
									if(json.value[i].PINPUT == 'Y'){
										td3.children().children().prop("checked", true);	//P코드 수기입력

										td4.text();
										td5.text();
									}
									td4.children().val(json.value[i].PSPLITSTRING)		//조회제거문자
									td5.children().val(json.value[i].PPREFIX)			//전구분자
									td6.children().val(json.value[i].PLASTFIX)			//후구분자
									td7.children().val(json.value[i].PLENGTH)			//길이
									
									if(json.value[i].QINPUT == 'Y'){
										td8.children().children().prop("checked", true);	//Q코드 수기입력
									//	QINPUT_check(td8.children().children())
									}
									td9.children().val(json.value[i].QPREFIX)  			//전구분자
									td10.children().val(json.value[i].QLASTFIX) 		//후구분자
									td11.children().val(json.value[i].QLENGTH) 			//길이
									
									if(json.value[i].SINPUT == 'Y'){
										td12.children().children().prop("checked", true);	//S코드 수기입력
								//		SINPUT_check(td12.children().children())
									}
									td13.children().val(json.value[i].SDATETYPE) 		//일자타입
									td14.children().val(json.value[i].SPREFIX) 			//전구분자
									td15.children().val(json.value[i].SLASTFIX) 		//후구분자
									
									td16.children().val(json.value[i].IMAGECODE)		//이미지코드
									if(json.value[i].CMATNRFLAG == 'Y'){
										td18.children().children().prop("checked", true);	//거래처품번매핑처리
									}
									td19.children().val(json.value[i].USEFLAG) 			//사용유무
									td20.children().val(json.value[i].REMARK) 			//비고
									td21.children().val(json.value[i].EXBARDATA)		//바코드예제
									
								
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