<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 기준정보 - 이미지 기준관리  -->   
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
											<span class="form-control" style="width:100px;">이미지코드</span>
										</span>
										<input type="text" id="IMAGECODE" name="IMAGECODE" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>	
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">이미지명</span>
										</span>
										<input type="text" id="IMAGENAME" name="IMAGENAME" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>
								<div class="col-sm-2">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control " style="width:100px;">사용유무</span>
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
											<option value="IMAGECODE">이미지코드</option>
											<option value="MAKESTAMP">생성일</option>
											<option value="EDITSTAMP">수정일</option>
										</select>
									</div>
								</div>
								<div class="col-sm-2">
									<button type="button" id="searchButton"  style="margin-top: 0px;" class="btn btn-lg btn-block btn-primary search" onclick="javascript:frmScanSubmit();"><i class="fa fa-search"></i> Search</button>
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

/*파일 업로드 css*/
.filebox input[type="file"] {
	position: static;
	width: 0px;
	height: 0px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.filebox label {
	position: static;
	color: #999;
	display: inline-block;
	cursor: pointer;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	vertical-align: middle;
	background-color: rgba( 255, 255, 255, 0 );
 	border: 0px ; 
  	-webkit-appearance: none;
  	-moz-appearance: none;
 	appearance: none;
}
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
										<col style="width: 7%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 80px;">
										<col style="width: 80px;">
										<col style="width: 70px;">   
										<col >
										<col style="width: 6%;">
										<col style="width: 6%;">
										<col style="width: 6%;">
										<col style="width: 6%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                        	<th><label><input type='checkbox' id='chkAll'/><span class='text'></span></label></th>
                                            <th>이미지코드</th>
                                            <th>이미지명</th>
                                            <th>파일명</th>
                                            <th>파일선택</th>
                                            <th>이미지확인</th>
                                            <th>사용유무</th>
                                            <th>비고</th>
                                            <th>생성자</th>
                                            <th>생성일</th>
                                            <th>수정자</th>
                                            <th>수정일</th>
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

.popupFixHead          { overflow-x: hidden; overflow-y: auto; height: 600px; }

</style>
<!-- 팝업 -->
<div class="modal fade modal_status" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-big " style="width:800px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                	<i class="fa fa-picture-o" aria-hidden="true"></i> 파일명 :
                	<span class="word-title" id="popup_FILENAME" value=""></span>
                </h4>
            </div>


            <div class="modal-body common_popup padding-bottom-50 popupFixHead">
				<p class="font-120 padding-top-10">
					이미지코드 : <span class="word-title" id="popup_IMAGECODE" value=""></span>
					<br>
                 	   <!-- 이미지명 : <span id="popup_IMAGENAME" value=""></span> -->
                 	
				</p>
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

//이미지 팝업 함수
function imagePopup(it){
	
	var td = it.parentNode;//이미지 확인
	var td0 = td.previousElementSibling;  //파일선택
	var td1 = td0.previousElementSibling; //파일명
	var td2 = td1.previousElementSibling; //이미지명
	var td3 = td2.previousElementSibling; //이미지코드

	var IMAGECODE = td3.innerHTML;
	//var IMAGENAME = td2.innerHTML;
	var FILENAME = td1.children[0].value;
	
	$("#myimage").attr("src", server_url+"WMS/imageReference_05Select_VIEWIMAGE.do?IMAGECODE=" + IMAGECODE + "&MANDT=100");

	$("#popup_IMAGECODE").html(IMAGECODE);
	//$("#popup_IMAGENAME").html(IMAGENAME);
	$("#popup_FILENAME").html(FILENAME);
	
}

//파일 업로드 벨리데이션
var fileCheck = function (getFile) 
{				

	var returnValue = true;
	
	// 사이즈체크
	var maxSize = 10 * 1024 *1024  //10MB
	var fileSize = 0;

	// 브라우저 확인
	var browser = navigator.appName;
	
	// 파일 객체
	var file = document.getElementById(getFile);
	 
	// 파일 정보 추출
	var filePath = file.value;
	var fileName = filePath.substring(filePath.lastIndexOf("\\")+1); //파일 이름
	var fileKind = fileName.split(".")[1]; //확장자
	
	// 확장자 체크 
	if(fileKind != "jpg" && fileKind != "gif" && fileKind != "png"){
		    alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
		    returnValue = false;
	}
	
	// 익스플로러일 경우
	if (  file != "" ) { 
		
		if (browser=="Microsoft Internet Explorer")
		{
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile( file.value ).size;
		}
		// 익스플로러가 아닐경우
		else
		{
			fileSize = file.files[0].size;
		}
	}
		
	// 크기 체크
	if(fileSize > maxSize)
	{
		alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
		returnValue = false;
	}
	return returnValue;
}	
  
//파일 이름 선택자  
$(document).on('change', '.filebox .upload-hidden', function(){
	
    if(window.FileReader){
        var filename = $(this)[0].files[0].name;
    } else {
        var filename = $(this).val().split('/').pop().split('\\').pop();
    }
    
    $(this).parent().parent().prev().find('.upload-name').val(filename);
});

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


function frmScanSubmit(){	
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/imageReference_05/imageReference_05Select.do',
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
			//$('#WERKS').html("<option value=''>전체</option>");	
			
			var list ="";
			var TOTAL_COUNT = "";
			Select_list = "";
			
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}	
			
			for(var i = 0 ; i < data['list'].length ; i ++ ){

					list += //
							"<tr name='defaultTd'>"+
							
						        "<td class='text-align-center'>"+
						        "	<label>"+
						        "		<input type='checkbox' name='chk[]' id='"+ data['list'][i].IMAGECODE +"' value='' onclick='check(this)'><span class='text'></span>"+
						        "	</label>"+
						        "</td>"+
						        
						        "<td value='"+ data['list'][i].IMAGECODE +"' class='text-align-left'>"+ data['list'][i].IMAGECODE +"</td>"+
						        "<td class='text-align-left'>"+ data['list'][i].IMAGENAME +"</td>"+
						        
						        "<td class='text-align-left filebox'>"+
						        	"<input class='upload-name' value='"+data['list'][i].FILENAME+"' disabled='disabled' style='width:264px'>"+
						        "</td>"+
						        	  
						        "<td class='text-align-center filebox'>"+
							        "<label id='upload_label' for='ex_filename_"+i+"' class='btn' style='color:#e5e5e5; opacity:1;' disabled='disabled'>"+
							        	"<i class='fa fa-plus' style='margin-right:-1px;'></i>"+
							        "</label>"+
							        "<form name='frm' id='frm_"+i+"' method='post' enctype='multipart/form-data'>"+
							        	"<input type='file'   id='ex_filename_"+i+"' name='VIEWIMAGE' class='upload-hidden'>"+
										"<input type='hidden' name='IMAGECODE' id='IMAGECODE' />"+
										"<input type='hidden' name='IMAGENAME' id='IMAGENAME' />"+
										"<input type='hidden' name='FILENAME' id='FILENAME' />"+
										"<input type='hidden' name='IMAGEEDIT' id='IMAGEEDIT' />"+
										"<input type='hidden' name='USEFLAG' id='USEFLAG' />"+
										"<input type='hidden' name='REMARK' id='REMARK' />"+
										"<input type='hidden' name='USERID' id='USERID' />"+
										"<input type='hidden' name='NEWFLAG' id='NEWFLAG' />"+
										"<input type='hidden' name='MANDT' id='MANDT' />"+
										"<input type='hidden' name='RTNMSG' id='RTNMSG' />"+										
									"</form>"+
							    "</td>"+
						    
						        "<td class='text-align-center'>"+ 
						        	"<a href='#' data-toggle='modal' data-target='.modal_status' class='btn' style='position:static;'"+
										"<span class='label label-info' onclick='imagePopup(this)'> <i class='fa fa-picture-o' style='color:#57b5e3; margin-right:-1px;'></i> </span>"+
									"</a>"+
						        "</td>"+
						        
						        "<td class='text-align-center'>"+ data['list'][i].USEFLAG +"</td>"+
						        "<td class='text-align-left'>"+ data['list'][i].REMARK +"</td>"+
						        "<td class='text-align-center'>"+ data['list'][i].MAKEUSER +"</td>"+
						        "<td class='text-align-center'>"+ data['list'][i].MAKESTAMP +"</td>"+
						        "<td class='text-align-center'>"+ data['list'][i].EDITUSER +"</td>"+
						        "<td class='text-align-center'>"+ data['list'][i].EDITSTAMP +"</td>"+ 
					    "</tr>";
					       // 
			}
			
			$('#mytable tbody').append(list);		
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
		$("tbody input:checkbox").prop("checked", true);		
	}else{
		$("tbody input:checkbox").prop("checked", false);
	}

	//1. 체크박스 전체 체크
	if (chkAll){

			//3. 모든 row for문 체크  
			for(var i = 0; i < size; i++){
			
				var td = document.getElementsByName("chk[]")[i].parentNode.parentNode;
				var td0 = td.nextElementSibling;  //이미지코드 
				var td1 = td0.nextElementSibling; //이미지명
				var td2 = td1.nextElementSibling; //파일명
				var td3 = td2.nextElementSibling; //파일선택
				var td4 = td3.nextElementSibling; //이미지확인
				var td5 = td4.nextElementSibling; //사용유무
				var td6 = td5.nextElementSibling; //비고
				
				var mail_arr = 	[
									//{ yesCheck: appendInput, 	column: td0},  		//이미지코드
									{  yesCheck: appendInput,  	column: td1},  		//이미지명
									//{  yesCheck: appendInput, column: td2},  		//파일명
									{  yesCheck: appendFileUpload, 	column: td3},  		//파일선택
									{  yesCheck: appendImage, 	column: td4},  		//이미지확인
									{  yesCheck: appendSelect, 	column: td5},  		//사용유무
									{  yesCheck: appendInput, 	column: td6} 		//비고
								];
				
				//4. input 태그 여부 확인
				inputValue = td5.childNodes[0].value; 
				if(inputValue === undefined ) {
	
					//5.1 추가된 행
					if(td0.parentNode.attributes.name.value == "mytr"){
	
						for (var prop in mail_arr) {
							td.style.backgroundColor = "gold";
							mail_arr[prop].yesCheck(mail_arr[prop].column, "gold");
						}
						
					//5.2 기존 행 
		        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
		        		
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
			var td0 = td.nextElementSibling;  //이미지코드 
			var td1 = td0.nextElementSibling; //이미지명
			var td2 = td1.nextElementSibling; //파일명
			var td3 = td2.nextElementSibling; //파일선택
			var td4 = td3.nextElementSibling; //이미지확인
			var td5 = td4.nextElementSibling; //사용유무
			var td6 = td5.nextElementSibling; //비고
			
			var mail_arr = 	[
								//{ yesCheck: appendInput, 		column: td0},  	//이미지코드
								{  noCheck: appendText,  		column: td1},  	//이미지명
								//{  yesCheck: appendInput, 	column: td2},  	//파일명
								{  noCheck: appendNoFileUpload, 		column: td3}, 	//파일선택
								{  noCheck: appendNoImage, 		column: td4},  	//이미지확인
								{  noCheck: appendText, 		column: td5},  	//사용유무
								{  noCheck: appendText, 		column: td6}	//비고
							]; 
							
			//4. input 태그 여부 확인
			inputValue = td5.childNodes[0].value; 
			if(inputValue !== undefined ) {
				td.style.backgroundColor = "";
				//5.1 추가된 행
				if(td0.parentNode.attributes.name.value == "mytr"){

					for (var prop in mail_arr) {
						mail_arr[prop].noCheck(mail_arr[prop].column);
					}
					
				//5.2 기존 행 	
	        	}else if(td0.parentNode.attributes.name.value == "defaultTd"){
	        		
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
	
	td0 = td.nextElementSibling;  //이미지코드 
	td1 = td0.nextElementSibling; //이미지명
	td2 = td1.nextElementSibling; //파일명
	td3 = td2.nextElementSibling; //파일선택 
	td4 = td3.nextElementSibling; //이미지확인 
	td5 = td4.nextElementSibling; //사용유무
	td6 = td5.nextElementSibling; //비고
	
	var mail_arr = 	[
						//{ noCheck: appendText,		yesCheck: appendInput,	column: td0},  //이미지코드
						{  noCheck: appendText,			yesCheck: appendInput,  column: td1},  //이미지명
						//{  noCheck: appendText,		yesCheck: appendInput, 	column: td2},  //파일명
						{  noCheck: appendNoFileUpload,		yesCheck: appendFileUpload, 	column: td3},  //파일선택
						{  noCheck: appendNoImage,		yesCheck: appendImage, 	column: td4},  //이미지확인
						{  noCheck: appendText,			yesCheck: appendSelect, column: td5},  //사용유무
						{  noCheck: appendText,			yesCheck: appendInput, 	column: td6}   //비고
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
	 
	var cnt = $( "[name='chk[]']" ).length; //총 엘리먼트 갯수
	$('#mytable > tbody:last').append(
			
			"<tr name='mytr'>"+
			"<td class='text-align-center'>"+
				"<label>"+
					"<input type='checkbox' name='chk[]' value='' onclick='check(this)'><span class='text'></span>"+
				"</label>"+
			"</td>"+
			
			"<td class='text-align-left'></td>"+
			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+
			"<td class='text-align-left filebox'>"+
				"<input class='upload-name' value='' disabled='disabled'>"+
			"</td>"+
			
			"<td class='text-align-center filebox' style='background-color: gold;'>"+
				"<label id='upload_label' for='ex_filename_"+cnt+"' class='btn' style='position:static'>"+
					"<i class='fa fa-plus' style='margin-right:-1px;'></i>"+
				"</label>"+	
				 "<form name='frm' id='frm_"+cnt+"' method='post' enctype='multipart/form-data'>"+
		        	"<input type='file'   name='VIEWIMAGE'   id='ex_filename_"+cnt+"' class='upload-hidden'>"+
					"<input type='hidden' name='IMAGECODE' id='IMAGECODE' />"+
					"<input type='hidden' name='IMAGENAME' id='IMAGENAME' />"+
					"<input type='hidden' name='FILENAME' id='FILENAME' />"+
					"<input type='hidden' name='IMAGEEDIT' id='IMAGEEDIT' />"+
					"<input type='hidden' name='USEFLAG' id='USEFLAG' />"+
					"<input type='hidden' name='REMARK' id='REMARK' />"+
					"<input type='hidden' name='USERID' id='USERID' />"+
					"<input type='hidden' name='NEWFLAG' id='NEWFLAG' />"+
					"<input type='hidden' name='MANDT' id='MANDT' />"+
					"<input type='hidden' name='RTNMSG' id='RTNMSG' />"+										
				"</form>"+	
			"</td>"+
			
			"<td class='text-align-center' style='background-color: gold;'>"+ 
				
			"</td>"+
			
			"<td class='text-align-center' style='background-color: gold;'>"+
				"<select type='text' value='Y' style='width:100%;'>"+
					"<option value='Y' selected='selected'>Y</option>"+
					"<option value='N'>N</option>"+
				"</select>"+
			"</td>"+

			"<td class='text-align-left' style='background-color: gold;'><input type='text' value='' style='width:100%; height:31px;'></td>"+

			"<td class='text-align-left'></td>"+
			"<td class='text-align-left'></td>"+
			"<td class='text-align-left'></td>"+
			"<td class='text-align-left'></td>"+	
		"</tr>"	
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


function upload(formId, returnValue){
	
	$("#"+formId).ajaxForm({
		url: server_url+"WMS/Standard_infomation_1/imageReference_05InsertUpdate.do",
		enctype : "multipart/form-data",
		dataType : "json",
		async: false,
		error:function(){
			returnValue[0] = false
			returnValue[1] = "error";
		},
		success : function(json){
			returnValue[1] += "\n"+json.message	
		}
		
	});
	$("#"+formId).submit() ;
	return returnValue;
}

//체크박스 행  추가하기(insert)  
$("#res").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var insert_checked_length = $("tr[name='mytr'] td label input[name='chk[]']:checked").length //insert row 체크 수
	var update_checked_length = $("tr[name='defaultTd'] td label input[name='chk[]']:checked").length //update row 체크 수
	var returnValue = [true, ""];
	var message = "";
	var fromId = [];
	var fileId = null;
	
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

		var td0 = td.next();   //이미지코드
		var td1 = td0.next();  //이미지명
		var td2 = td1.next();  //파일명
		var td3 = td2.next();  //파일선택
		var td4 = td3.next();  //이미지확인
		var td5 = td4.next();  //사용유무
		var td6 = td5.next();  //비고

		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			fromId[i] = td3.eq(i).children("form").attr("id");
			fileId = td3.eq(i).children("form").find("[name=VIEWIMAGE]").attr("id");
			
			$("#"+fromId[i]).find("[name=IMAGECODE]").val();
			$("#"+fromId[i]).find("[name=IMAGENAME]").val(td1.eq(i).children().val());
			$("#"+fromId[i]).find("[name=FILENAME]").val(td2.eq(i).children().val());
			$("#"+fromId[i]).find("[name=IMAGEEDIT]").val("Y");
			$("#"+fromId[i]).find("[name=USEFLAG]").val(td5.eq(i).children().val());
			$("#"+fromId[i]).find("[name=REMARK]").val(trim(td6.eq(i).children().val()));
			$("#"+fromId[i]).find("[name=NEWFLAG]").val("Y");
			$("#"+fromId[i]).find("[name=MANDT]").val("100");
			$("#"+fromId[i]).find("[name=RTNMSG]").val("");
			$("#"+fromId[i]).find("[name=USERID]").val(user);
		
			//공백 validation 체크 
			if(td1.eq(i).children().val() == ""){
				alert("이미지명이 공백입니다.");
				save_chk = false;
				break;
			};
			
			if(td2.eq(i).children().val() == ""){
				alert("업로드한 파일이 없습니다.");
				save_chk = false;
				break;
			};		
			
			//파일 확장자/크기 validation 체크
			if(fileCheck(fileId) == false){
				save_chk = false;
				break;
			}
		}//각 행의 데이터 검증 for문 끝
		
	
		//validation 검증 성공 -> 파일 업로드 
		if(save_chk == true){
			for(var i = 0; i<fromId.length; i++){
				upload(fromId[i], returnValue);		
			}
			
		 	$('#orderby').val('MAKESTAMP');
		  	$('#orderby').trigger('change');
			$('#searchButton').trigger('click');
			
			//반환값
			if(returnValue[0] == true){
				alert(returnValue[1]);
			}
		}
		
		
		
		
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
	var returnValue = [true, ""];
	var message = "";
	var fromId = [];
	var fileId = null;
	
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

		var td0 = td.next();   //이미지코드
		var td1 = td0.next();  //이미지명
		var td2 = td1.next();  //파일명
		var td3 = td2.next();  //파일선택
		var td4 = td3.next();  //이미지확인
		var td5 = td4.next();  //사용유무
		var td6 = td5.next();  //비고
		
		
		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<total_checked_length.size(); i++){
		
			fromId[i] = td3.eq(i).children("form").attr("id");
			fileId = td3.eq(i).children("form").find("[name=VIEWIMAGE]").attr("id");
			
			$("#"+fromId[i]).find("[name=IMAGECODE]").val(td0.eq(i).attr("value"));
			$("#"+fromId[i]).find("[name=IMAGENAME]").val(td1.eq(i).children().val());
			$("#"+fromId[i]).find("[name=FILENAME]").val(td2.eq(i).children().val());
			$("#"+fromId[i]).find("[name=IMAGEEDIT]").val("Y");
			$("#"+fromId[i]).find("[name=USEFLAG]").val(td5.eq(i).children().val());
			$("#"+fromId[i]).find("[name=REMARK]").val(trim(td6.eq(i).children().val()));
			$("#"+fromId[i]).find("[name=NEWFLAG]").val("");
			$("#"+fromId[i]).find("[name=MANDT]").val("100");
			$("#"+fromId[i]).find("[name=RTNMSG]").val("");
			$("#"+fromId[i]).find("[name=USERID]").val(user);
		
			//공백 validation 체크 
			if(td1.eq(i).children().val() == ""){
				alert("이미지명이 공백입니다.");
				save_chk = false;
				break;
			};
			
			if(td2.eq(i).children().val() == ""){
				alert("업로드한 파일이 없습니다.");
				save_chk = false;
				break;
			};		
			
			//파일 확장자/크기 validation 체크
			if(fileCheck(fileId) == false){
				save_chk = false;
				break;
			}
		}//각 행의 데이터 검증 for문 끝
		
		//validation 검증 성공 -> 파일 업로드 
		if(save_chk == true){
			for(var i = 0; i<fromId.length; i++){
				upload(fromId[i], returnValue);		
			}
			
		 	$('#orderby').val('EDITSTAMP');
		  	$('#orderby').trigger('change');
			$('#searchButton').trigger('click');
			
			//반환값
			if(returnValue[0] == true){
				alert(returnValue[1]);
			}
		}
	
		
		
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