<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<!-- Page Content -->
        <div class="page-content">
			<div class="tabbable">
				<ul class="nav nav-tabs wide_tab">
				 <c:forEach items="${list }" var="row">
					<c:choose> 
						<c:when test="${map.PROGID eq row.PROGID}"> 
							<li class="active">
								<a href="javascript:void(0);" id="${row.PROGID }" onclick="WEBURL('${row.WEBURL }','${row.PROGID }')";>${row.KORPROGNAME } &nbsp;
									<button onclick="tabDelete(this, '${row.PROGID }', '${row.MENUID}', 'action')" type="button" ><i class="fa fa-times"></i></button>
								</a>
							</li>
						</c:when>
						<c:otherwise> 
							<li class="">
								<a href="javascript:void(0);" onclick="WEBURL('${row.WEBURL }','${row.PROGID }')";>${row.KORPROGNAME } &nbsp;
									<button onclick="tabDelete(this,'${row.PROGID}', '${row.MENUID}', '')" type="button" ><i class="fa fa-times"></i></button>
								</a>
							</li>
						</c:otherwise> 
					</c:choose>
				
				 </c:forEach>
				</ul>				
			</div>
			
				
	
<script type="text/javascript">
//탭 지우기 
function tabDelete(it, PROGID, MENUID, action){
	
	var tab = it.parentNode;
	tab.remove();
	
	//해당 탭 쿠키 지우기
	setCookie( PROGID , '', -1)
	
	if(action == "action" ){
	
		var params = "PROGID="+PROGID+"&MENUID="+MENUID;
		
		// ajax({ 시작
		$.ajax({
			url : '/WMS/tabDelete.do',
			type: "post",
			dataType : 'json',
			data: params,
			async: false,
			processData: false,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			cache: false,
			timeout: 600000,
			success : function(data){
				WEBURL(data.WEBURL, data.PROGID)

			},
			error : function(error){
				alert('error');
			}
		})// ajax({ 끝	
		 
	}else if(action == "" ){
	
		var params = "PROGID="+PROGID+"&MENUID="+MENUID;
		
		// ajax({ 시작
		$.ajax({
			url : '/WMS/tabDelete_json.do',
			type: "post",
			dataType : 'json',
			data: params,
			async: false,
			processData: false,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			cache: false,
			timeout: 600000,
			success : function(data){
				//alert(data.sessionDelete);
				
			},
			error : function(error){
				alert('error');
			}
		
		})// ajax({ 끝	
	}

	event.stopPropagation();
}
</script>
			
<script type = "text/javascript">
//메뉴 불러오기 이벤트 (메뉴페이지에 있으면 메뉴 축소화 안됨)
$("[name='mainmenu']").on("click", function() {

	var MENUID =$(this).attr('id');
	var params = "MENUID="+MENUID;
	$.ajax({
 			url:"/WMS/menuSelect.do",
 			type:"post",
 			data: params,
 			datatype:"json",
 			async: false,
 			//cache : false,
 			timeout:1000,
 			error:function(){
 				alert("error");
 			},
 			success:function(data){
 				$("#"+MENUID +"> .submenu").empty();
 				var list ="";
 				for(var i = 0 ; i < data['list'].length ; i ++ ){
 					
 					list += "<li class=''>"+
 							"	<a href='"+data['list'][i].WEBURL+"'><span class='menu-text  menu-text2'>"+data['list'][i].KORPROGNAME+"</span></a>"+
 							"</li>";
 				}
				
 				$("#"+MENUID +"> .submenu").append(list);
 				
 			}//ajax Success 끝
 	});//ajax 끝		   
});

</script>