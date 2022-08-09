<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<style>
 .menu-text2 {word-break: break-all;-webkit-box-orient: vertical;-webkit-line-clamp: 1;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;width: 180px;}
</style> 
<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container">
        <!-- Page Sidebar -->
        <div class="page-sidebar" id="sidebar">
       
            <!-- Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <!--Dashboard-->
		
                <!--Databoxes-->
				<c:forEach items="${MENU }" var="row">
					<li class="${row.active }" name="mainmenu" id="${row.MENUID }">
						<a href="#" class="menu-dropdown">
							<i class="menu-icon fa fa-sitemap"></i>
							<span class="menu-text "> ${row.KORMENUNAME } </span>
							<i class="menu-expand"></i>
						</a>			    
						<c:choose>
							<c:when  test="${row.active eq 'active open'}">						
								<ul class="submenu">
									<c:forEach items="${PROG }" var="row2">
										<li class="${row2.active }">
											<a href="javascript:void(0);" onclick="WEBURL('${row2.WEBURL }','${row2.PROGID }')" ><span class="menu-text menu-text2">${row2.KORPROGNAME }</span></a>
										</li>
									</c:forEach>
								</ul>
							</c:when>		
							<c:otherwise>
						        <ul class="submenu">
								
								</ul>
						    </c:otherwise>
						</c:choose>			
					</li>
				</c:forEach>
			
            </ul>
            <!-- /Sidebar Menu -->
        </div>
        <!-- /Page Sidebar -->

  

		