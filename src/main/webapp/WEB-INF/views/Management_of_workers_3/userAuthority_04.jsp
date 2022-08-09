<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<!-- 작업자 관리 - 사용자별 권한 관리  -->   
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
											<span class="form-control" style="width:100px;">사용자ID</span>
										</span>
										<input type="text" id="USERID" name="USERID" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>					
								
								<div class="col-sm-3">                                   
									<div class="input-group table-responsive">
										<span class="input-group-btn">
											<span class="form-control" style="width:100px;">사용자명</span>
										</span>
										<input type="text" id="USERNAME" name="USERNAME" value="" onblur="removeSpace(this);" class="form-control">
									</div>
								</div>	
								
								<div class="col-sm-2">   
								
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
									    <!--a class="btn btn-primary" id="btn-delete-row"><i class="fa fa-plus"></i> 삭제 하기 </a -->
									    <a class="btn btn-warning" id="res"><i class="fa fa-floppy-o"></i> 저장 </a>
									</div>            
									<div class="pull-right">	
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
									</div>
								</div>
	                        </div>
	                        
							<div class="search_box col-sm-4" style="padding:0px; border:0px;">
								<div id="scroll" class="table-responsive tableFixHead">
									<table id="left_table" class="table table-bordered table-striped table-condensed ">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 110px;">
											<col style="width: 200px;">
											<col style="width: 100px;">
											<col style="width: 120px;">
											<col style="width: 100px;">
										</colgroup>
										<thead>
											<tr>
												<th>사용자ID</th>
												<th>사용자명</th>
												<th>법인</th>
												<th>작업장</th>
												<th>사용자그룹</th>
												<th>권한</th>
											</tr>
										</thead>
										<tbody> 
											<tr name="defaultTd">
											
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="widget-body-sub col-sm-8">
							<div style="font-weight:bold; font-size:19px;" id="right_title" > </div>
							<div style="margin-top: 5px;" id="right_checkBox">
								
							</div>
								<div id="scroll" class="table-responsive tableFixHead">
									<table id="right_table" class="table table-bordered table-striped table-condensed ">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 80px;">
											<col style="width: 180px;">
											<col style="width: 50px;">
											<col style="width: 50px;">
											<col style="width: 50px;">   
											<col style="width: 50px;">
											<col style="width: 90px;">
											<col style="width: 90px;">
										</colgroup>
										<thead>
											<tr>
												<th>메뉴명</th>
												<th>화면ID</th>
												<th>화면명</th>
												<th>조회</th>
												<th>신규</th>
												<th>저장</th>
												<th>삭제</th>
												<th>수정자</th>
												<th>수정일 </th>
											</tr>
										</thead>
										<tbody> 
										  <tr name="defaultTd">
										
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

function frmScanSubmit(){
	//Create an FormData object 
	var params = jQuery("#search").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	setCookie(getParameterByName("prog"), params, 1);  //세션값에 ID 저장
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/userAuthority_04/userAuthority_04Select_left.do',
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
			$("#right_checkBox").html('');
			
			var list ="";
			var TOTAL_COUNT = "";
	
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
	
		
			for(var i = 0 ; i < data['list'].length ; i ++ ){

				list += "<tr name='defaultTd'>"+
						"    <td class='text-align-center' name='USERID' value='"+data['list'][i].STCAUTH+"'>"+ data['list'][i].USERID +"</td>"+ 	//사용자ID
						"    <td class='text-align-left'>"+ data['list'][i].USERNAME +"</td>"+ 	//사용자명
						"    <td class='text-align-left'>"+ data['list'][i].PLANT +"</td>"+		//법인
						"    <td class='text-align-left'>"+ data['list'][i].WC +"</td>"+		//작업장
						"    <td class='text-align-left'>"+ data['list'][i].AUTH +"</td>"+	//사용자그룹
						"    <td class='text-align-left'>"+ data['list'][i].AUTH2 +"</td>"+		//권한
						"</tr>";
			}
			
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




function right_table(MANDT, language, USERID, STCAUTH, userName){	
	//Create an FormData object 
	var params =  "MANDT=" + MANDT + "&language=" + language + "&USERID=" + USERID;
	
	// ajax({ 시작
	$.ajax({
		url : '/WMS/userAuthority_04/userAuthority_04Select_right.do',
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
			$('#right_table tbody').html('');
			$("#right_title").html('');
			$("#right_checkBox").html('');
			$("#TOTAL_COUNT").html('');
			
			var list ="";
			var TOTAL_COUNT = "";
	
			if(data['list'][0] !== undefined){
				TOTAL_COUNT = data['list'][0].TOTAL_COUNT;
			}else{
				TOTAL_COUNT = 0;
			}
			
			var rowspan = "";
			
			
			
			for(var i = 0 ; i < data['list'].length ; i ++ ){
				
				if(data['list'][i].rowspan != ""){
					rowspan = "<td class='text-align-center' style='background-color: #f9f9f9; font-size:16px;' rowspan='"+data['list'][i].rowspan+"'><b>"+ data['list'][i].MENUNAME +"</b></td>" //메뉴명
				}else{
					rowspan = ""; //메뉴명
				}

				list = "<tr name='defaultTd'>"+
							rowspan +	//메뉴명
						"    <td class='text-align-left' name='PROGID'>"+ data['list'][i].PROGID +"</td>"+ 	 //화면ID	
						"    <td class='text-align-left'>"+ data['list'][i].PROGNAME +"</td>"+	 //화면명
					
						"	 <td class='text-align-center'>"+						
								"<label>"+	
									"<input type='checkbox' name='FINDGRANT'  value='"+data['list'][i].FINDGRANT+"' >"+ //조회
									"<span class='text'></span>"+
								"</label>"+
						"	 </td>"+
						"	 <td class='text-align-center'>"+						
								"<label>"+	
									"<input type='checkbox' name='NEWGRANT' value='"+data['list'][i].NEWGRANT+"' >"+ //신규
									"<span class='text'></span>"+
								"</label>"+
						"	 </td>"+
						"	 <td class='text-align-center'>"+						
								"<label>"+	
									"<input type='checkbox' name='SAVEGRANT' value='"+data['list'][i].SAVEGRANT+"' >"+ //저장
									"<span class='text'></span>"+
								"</label>"+
						"	 </td>"+
						"	 <td class='text-align-center'>"+						
								"<label>"+	
									"<input type='checkbox' name='DELGRANT' value='"+data['list'][i].DELGRANT+"' >"+ //삭제
									"<span class='text'></span>"+
								"</label>"+
						"	 </td>"+
						
						"    <td class='text-align-left'>"+ data['list'][i].UPDUSER +"</td>"+	 //수정자
						"    <td class='text-align-left'>"+ data['list'][i].UPDDATE1 +"</td>"+  //수정일 
						"</tr>";
			
				$('#right_table tbody').append(list);
				
				checkBox_load(data['list'][i].FINDGRANT, "FINDGRANT", i)
				checkBox_load(data['list'][i].NEWGRANT, "NEWGRANT", i)
				checkBox_load(data['list'][i].SAVEGRANT, "SAVEGRANT", i)
				checkBox_load(data['list'][i].DELGRANT, "DELGRANT", i)

			}
			
			$("#right_title").append(userName);
			$('#right_checkBox').append(
					"<label>"+
						"<input type='checkbox' name='stockCheck' id='stockCheck' value=''><span class='text'>재고실사 시작 및 재고반영 권한</span>"+
					"</label>"
			);
			
			if(STCAUTH == "Y"){
				$("input:checkbox[id='stockCheck']").prop("checked", true);	
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

function checkBox_load( data, name, i ){
	if(data == '-1'){
		$("tr input:checkbox[name='"+name+"']").eq(i).prop("checked", true);
	}else if(data == '4'){
		$("tr input:checkbox[name='"+name+"']").eq(i).attr( 'disabled', 'true' );
		$("tr input:checkbox[name='"+name+"']").eq(i).parent().parent().css( 'backgroundColor', '#CCCBCB' );
	}
}

//좌측 데이터 클릭 시, 우측 테이블 불러오기 
$(document).on('click','#left_table [name="defaultTd"]',function(e){
	 $('#left_table [name="defaultTd"]').children().css( 'backgroundColor', '' );

	var USERID =  $(this).children().eq(0).text();
	var userName =  $(this).children().eq(1).text();
	var MANDT = $('#MANDT').val();
	var language ="KOREAN";
	var STCAUTH = $(this).children().eq(0).attr("value");
	
	right_table(MANDT, language, USERID, STCAUTH, userName)
	
	 $(this).children().eq(0).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(1).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(2).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(3).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(4).css( 'backgroundColor', 'gold' );
	 $(this).children().eq(5).css( 'backgroundColor', 'gold' );
	//e.target.parentNode.style.backgroundColor= "gold"; 

});	


//체크박스 행  추가하기(insert)  
$("#res").on("click", function() {

	var save_chk = true;
	var user = getCookie("sys_member_id"); //로그인시 세션값
	var stockCheck = "";
	//1.저장 진행여부 alert   
	if(confirm(  "저장 하시겠습니까?" )){  //1.1 진행여부 : Yes
		
		var insertArray = [];
		var PROGID = $("td[name='PROGID']"); //
		var USERID = $("td[name='USERID']"); //
		
		var USERID_value="";
		for(var i = 0; i<USERID.size(); i++){
			if(USERID.eq(i).attr('style') == "background-color: gold;"){
				USERID_value = USERID.eq(i).text();
			}
		}
		
		var FINDGRANT = 0;
		var NEWGRANT = 0;
		var SAVEGRANT = 0;
		var DELGRANT = 0;

		
		//3.각 행의 데이터 검증 for문 
		for(var i = 0; i<PROGID.size(); i++){
		
		
			if($("input:checkbox[name='FINDGRANT']").eq(i).is(":checked")){
				FINDGRANT = "-1";				
			}else{
				FINDGRANT = $("input:checkbox[name='FINDGRANT']").eq(i).val();
			
				if(FINDGRANT != "4"){
					FINDGRANT = "0";	
				}
			}
			
			if($("input:checkbox[name='NEWGRANT']").eq(i).is(":checked")){
				NEWGRANT = "-1";				
			}else{
				NEWGRANT = $("input:checkbox[name='NEWGRANT']").eq(i).val();
			
				if(NEWGRANT != "4"){
					NEWGRANT = "0";	
				}
			}
		
			if($("input:checkbox[name='SAVEGRANT']").eq(i).is(":checked")){
				SAVEGRANT = "-1";				
			}else{
				SAVEGRANT = $("input:checkbox[name='SAVEGRANT']").eq(i).val();
			
				if(SAVEGRANT != "4"){
					SAVEGRANT = "0";	
				}
			}
			
			if($("input:checkbox[name='DELGRANT']").eq(i).is(":checked")){
				DELGRANT = "-1";				
			}else{
				DELGRANT = $("input:checkbox[name='DELGRANT']").eq(i).val();
			
				if(DELGRANT != "4"){
					DELGRANT = "0";	
				}
			}
			
			
			if($("input:checkbox[id='stockCheck']").is(":checked")){
				stockCheck = "Y";
			}else{
				stockCheck = "N";
			}

			
			//배열에 각 행의 데이터를 넣는다.
			insertArray.push({
				MANDT     : "100", 				  //클라이언트
				USERID    : USERID_value,  		  //사용자ID 
				PROGID    : PROGID.eq(i).text(),  //프로그램ID 
				FINDGRANT : FINDGRANT, 			  //조회권한:I(등록):U(업데이트):D(삭제) 
				NEWGRANT  : NEWGRANT,  			  //신규
				SAVEGRANT : SAVEGRANT,  		  //저장
				DELGRANT  : DELGRANT,  			  //삭제
				EXPGRANT  :  ""  	,  			  //엑셀
				PRTGRANT  :  ""  	,  			  //출력
				UPDUSER   : user   	,			  //수정자 
				check 	  : stockCheck
			});
			
		}//각 행의 데이터 검증 for문 끝
		//USERID=" + USERID +"&"
		//1. validation이  완전한 true 일 때, 저장 ajax 실행  
		if(save_chk == true){
			//ajax 시작 
			 $.ajax({
		 			url:"/WMS/Management_of_workers_3/userAuthority_04InsertUpdate.do?",
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
		 				/*
		 				if(json.result == true){
			 				$('#searchButton').trigger('click');	
		 				}
		 				*/
		 			}
		 	});//ajax 끝		   
		}//validation이  완전한 true 일 때, 저장 ajax 실행 끝 			
		
		
	}else {//1.2 진행여부 : No
		return;
	}
	//1.저장 진행여부 alert 끝
}) ;


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