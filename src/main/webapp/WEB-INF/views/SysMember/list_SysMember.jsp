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
                        회원 관리
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
								<div class="col-sm-4"></div>        
								<div class="col-sm-3">
                                    <label class="control-label text-align-left">기간</label>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <select class="form-control" id="search_dt" style="width:100px;">
												<option value="date">등록일</option>
												<option value="modified_date">수정일</option>
											</select>
                                         </span>
                                        <div id="reportrange" class="input-sm btn_daterange2 form-control">
											<span class="txt_date"></span>
										</div>
                                    </div>
                                </div>                                
								
								
								<div class="col-sm-3">
                                    <label class="control-label text-align-left">상세 검색</label>

									<div class="input-group">
                                        <span class="input-group-btn">
                                            <select class="form-control" id="search_detail" style="width:100px;">
												<option value="category">카테고리</option>
												<option value="email">이메일</option>
												<!-- <option value="">아이디</option> -->
												<option value="registrant">등록자</option>
											</select>
                                        </span>
                                        <input type="text" id="search_detail_txt" name="search_detail_txt"  value='' class="form-control" >
                                    </div>
                                </div>
                                
								<div class="col-sm-2">
                                    <label class="control-label text-align-left"></label>
                                    <button type="button" class="btn btn-lg btn-block btn-primary search" onclick="javascript:search_form();"><i class="fa fa-search"></i> Search</button>
                                </div>
                            </div>
                        </div>

						<div class="widget">
                            <div class="widget-header">
                                <div class="widget-buttons" style="display: block">
									<div class="pull-left">
                                        <!--  button type="button" class="btn btn-primary" onClick="javascript:write();"><i class="fa fa-plus"></i> 추가 하기 </button-->
                                        <a class="btn btn-primary" href="javascript:write();"><i class="fa fa-plus"></i> 추가 하기 </a>
                                    </div>
                                  
									<div class="pull-right">	
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_now_down()"><i class="fa fa-download"></i> Excel-현재</button>
										<button type="button" class="btn btn-default"  onclick="javascript:fn_excel_all_down()"><i class="fa fa-download"></i> Excel-전체</button>
									</div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-condensed">
                                    <colgroup>
                                        <col style="width: 50px;">
                                        <col style="width: 6%">
                                        <col style="width: 8%">
                                        <col >
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>회사</th>
                                            <th>카테고리</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>휴대폰번호</th>
                                            <th>제목</th>
                                            <th>등록자</th>
                                            <th>조회수</th>
                                            <th>등록일</th>
                                            <th>수정일</th>

                                        </tr>
                                    </thead>
                                    <tbody> 
								          <c:choose>
								            <c:when test="${fn:length(list) > 0}">
								                <c:forEach items="${list }" var="row">
								                    <tr>
								                        <td class="text-align-center">${row.number }</td>
								                        <td class="text-align-center">${row.company }</td>
								                        <td class="text-align-center">${row.category }</td>
								                        <td class="text-align-center">${row.name }</td>
								                        <td class="text-align-center">${row.email }</td>
								                        <td class="text-align-center">${row.phoneNumber }</td>
								                        <td class="text-align-center"><a href="javascript:detail(${row.number });">${row.title }</a></td>
								                        <td class="text-align-left">${row.registrant }</td>
								                        <td class="text-align-left">${row.viewCount }</td>
								                        <td class="text-align-left">${row.date }</td>
								                        <td class="text-align-left">${row.modified_date }</td>
								                    </tr>
								                </c:forEach>
								            </c:when>
								            <c:otherwise>
								                <tr>
								                    <td colspan="4">조회된 결과가 없습니다.</td>
								                </tr>
								            </c:otherwise>
								        </c:choose>         
                                    </tbody>
                                </table>
                            </div>

	<jsp:include page="/WEB-INF/views/include/paging.jsp" flush="true">
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		<jsp:param name="startPageNo" value="${paging.startPageNo}" />
		<jsp:param name="pageNo" value="${paging.pageNo}" />
		<jsp:param name="endPageNo" value="${paging.endPageNo}" />
		<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		<jsp:param name="totalCount" value="${paging.totalCount}" />
	</jsp:include>
	
                        </div>
                    </div>

                </div><!-- /row -->
            </div><!-- /Page Body -->
            <footer class="text-center mb20">Copyright © WareHouse Management System. All Rights Reserved.</footer>
        </div><!-- /Page Content -->
    </div><!-- /Page Container -->
</div><!-- Main Container -->



<%@ include file ="/WEB-INF/views/include/include_footer.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_foot.jsp" %>

	<form id="frmDownloadExcel" method="post" action="/sample/openExcel_down.do">
		<input type="hidden" id="pageStart" name="pageStart" value="${map.START}" />				
		<input type="hidden" id="pageEnd" name="pageEnd" value="${map.END}" />						
		
		<input type="hidden" id="search_dt" name="search_dt" value="${map.search_dt}" />	
		<input type="hidden" id="search_s_dt_simp" name="search_s_dt_simp" value="${map.search_s_dt_simp}" />   
		<input type="hidden" id="search_e_dt_simp" name="search_e_dt_simp" value="${map.search_e_dt_simp}" />   
		
		<input type="hidden" id="search_detail" name="search_detail" value="${map.search_detail}" /> 		   	  
		<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${map.search_detail_txt}" />
		
		<input type="hidden" id="param" name="param" value="" />
	</form>
	
	
	<form id="frmSearch" method="post" action="/sample/list_event.do">
		<input type="hidden" id="search_dt" name="search_dt" value="${map.search_dt}" />	
		<input type="hidden" id="search_s_dt" name="search_s_dt" value="${map.search_s_dt}" />   
		<input type="hidden" id="search_e_dt" name="search_e_dt" value="${map.search_e_dt}" />   
		<input type="hidden" id="search_s_dt_simp" name="search_s_dt_simp" value="${map.search_s_dt_simp}" />   
		<input type="hidden" id="search_e_dt_simp" name="search_e_dt_simp" value="${map.search_e_dt_simp}" />   
		
		<input type="hidden" id="search_detail" name="search_detail" value="${map.search_detail}" /> 		   	  
		<input type="hidden" id="search_detail_txt" name="search_detail_txt" value="${map.search_detail_txt}" />
		
	</form>
	

<script type="text/javascript">	

//행 수가 변경될 때 이벤트 발생
$('#plant').change(function() {
	
  	var selectedText = $("#plant option:selected").val();
	var setCookie = function(cName, cValue, cDay){
		try {
			var expire = new Date();
			expire.setDate(expire.getDate() + cDay);
			cookies = cName + '=' + escape(cValue) + '; path=/ ';
			if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
			document.cookie = cookies;
		} catch(e) {}
	}
	
	setCookie( 'pageSize', selectedText, 365);	//지정한 행값을 쿠키값으로 저장한다(공통함수).
	
	var comSubmit = new ComSubmit("frmSearch");
    comSubmit.setUrl("<c:url value='/sys/list_SysMember.do' />");
    comSubmit.addParam("pageSize", selectedText);
    comSubmit.submit();
});


// 검색
function search_form(){

	var search_detail =  $("#search_detail option:selected").val();
	var search_detail_txt = $("#search_detail_txt").val();

	var search_dt =  $("#search_dt option:selected").val()
	var search_s_dt = document.getElementsByName('daterangepicker_start')[0].value;
	var search_e_dt = document.getElementsByName('daterangepicker_end')[0].value


	if(!search_s_dt){
		search_s_dt = $("#search_s_dt").val();
		search_e_dt = $("#search_e_dt").val();
	} 
	var search_s_dt_simp = search_s_dt.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '-' ).replace(/\s/gi, '');
		search_s_dt_simp = search_s_dt_simp.substring(0,  search_s_dt_simp.length - 1);	
	var search_e_dt_simp = search_e_dt.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '-' ).replace(/\s/gi, '');
		search_e_dt_simp = search_e_dt_simp.substring(0,  search_s_dt_simp.length);
	
	$('#frmSearch').children('#search_dt').val(search_dt);
	$('#frmSearch').children('#search_s_dt').val(search_s_dt);
	$('#frmSearch').children('#search_e_dt').val(search_e_dt);
	$('#frmSearch').children('#search_s_dt_simp').val(search_s_dt_simp);
	$('#frmSearch').children('#search_e_dt_simp').val(search_e_dt_simp);
	
	$('#frmSearch').children('#search_detail').val(search_detail);
	$('#frmSearch').children('#search_detail_txt').val("%"+search_detail_txt+"%");
	
	var comSubmit = new ComSubmit("frmSearch");
    comSubmit.setUrl("<c:url value='/sys/list_SysMember.do' />");
    comSubmit.submit();
}


// 페이지 이동 값 
function goPage(pageNo) {
	
	var comSubmit = new ComSubmit("frmSearch");
	comSubmit.setUrl("<c:url value='/sys/list_SysMember.do' />");
    comSubmit.addParam("pageNo", pageNo);
    comSubmit.submit();
}	


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


// 상세페이지 
function detail(number) { 

		var comSubmit = new ComSubmit("frmSearch");
	       comSubmit.setUrl("<c:url value='/sys/view_SysMember.do' />");
	       comSubmit.addParam("number", number);
	       comSubmit.addParam("pageNo", "${paging.pageNo}");
	       comSubmit.submit();
}	
	

// 글작성하기 
function write() {
	
		var comSubmit = new ComSubmit();
	       comSubmit.setUrl("<c:url value='/sys/write_SysMember.do' />");
	       comSubmit.submit();
}	
</script>


<script type="text/javascript">

//처음 페이지 로드 시, 세팅해주는 값 
  $(document).ready(function() {
	  

		$('#plant').val("${map.pageSize}").prop("selected", true);	 
		$("#search_dt").val("${map.search_dt}").prop("selected", true);
		$("#search_detail").val("${map.search_detail}").prop("selected", true);
		$("#search_detail_txt").val("${map.search_detail_txt}");
	  
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
       	
        function cb(start, end) {
			$('#reportrange .txt_date').html(start.format('YYYY년 MM월 DD일') + ' - ' + end.format('YYYY년 MM월 DD일'));
		}
        
    	cb(moment().startOf('year'), moment());
		
    	if(!"${map.search_s_dt_simp}"){
    		cb(moment().startOf('year'), moment());
    	}else{
	    	$('#reportrange').data('daterangepicker').setStartDate("${map.search_s_dt_simp}");		    	
	    	$('#reportrange').data('daterangepicker').setEndDate("${map.search_e_dt_simp}");	
	    	$('#reportrange .txt_date').html("${map.search_se_dt}");
    	}
    	
	});

</script>
 
</html>