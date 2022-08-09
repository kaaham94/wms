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
                                        <col style="width: 6%;">
                                        <col style="width: 6%">
                                        <col style="width: 8%">
                                        <col >
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>제목</th>
                                            <th>표시기간</th>
                                        </tr>
                                    </thead>
                                    <tbody> 
								          <c:choose>
								            <c:when test="${fn:length(list) > 0}">
								                <c:forEach items="${list }" var="row">
								                    <tr>
								                        <td class="text-align-center">${row.seq }</td>
								                        <td class="text-align-center"><a href="javascript:detail(${row.seq });">${row.TITLE }</a></td>
								                      	<td class="text-align-center">${row.TERM }</td>
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
		<input type="hidden" id="param" name="param" value="" />
	</form>
	
	
	<form id="frmSearch" method="post" action="/sample/list_event.do">
	</form>
	


<script type="text/javascript">	

//처음 페이지 로드 시, 세팅해주는 값 
$(document).ready(function() {

	

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