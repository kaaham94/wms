<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>WMS SYSTEM</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/beyond.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/daterangepicker.css" />


    <link href="../assets/css/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/weather-icons.min.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
	<link href="../assets/css/skins/ui.dynatree.css" rel="stylesheet">
	
    <link rel="stylesheet" type="text/css" href="../assets/css/custom.css" />
    <link id="skin-link" href="../assets/css/skins/green.min.css" rel="stylesheet" type="text/css">

	<link href="../css/common.css" rel="stylesheet">


    <script type="text/javascript" src="../assets/js/jquery-1.11.0.min.js"></script>


	<script type="text/javascript" src="../assets/js/charts/highcharts/highcharts.js"></script><!-- 하이차트 -->
	<script type="text/javascript" src="../assets/js/charts/highcharts/highcharts-more.js"></script>
	<script type="text/javascript" src="../assets/js/charts/highcharts/modules/data.js"></script>
	<script type="text/javascript" src="../assets/js/charts/highcharts/modules/exporting.js"></script>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
	<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
	<script src="<c:url value='/js/jquery.serialize-object.min.js'/>" charset="utf-8"></script>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


<%    // Session의 속성값을 가져옵니다.
//session.invalidate(); //세션 무효화
session.setMaxInactiveInterval(-1);
String sesValue = ""; 
String DEPTNM = ""; 
String USERNAME = ""; 

	try {
		//sesValue에 ID 세션을 문자열타입으로 저장
	    sesValue = session.getAttribute("UID").toString(); 
	    DEPTNM = session.getAttribute("DEPTNM").toString(); 
	    USERNAME = session.getAttribute("USERNAME").toString(); 
	    
	    if ("".equals(sesValue)){ //sesValue 값이 공백 이라면 (=session 값이 없다면,)
	    	response.sendRedirect("/WMS/session_out.do"); // session_out.do 페이지로 이동
	    	System.out.println("session out1");
	    }
	}
	catch(NullPointerException e){ //세션안에 ID라는 세션이 없다면 예외가 발생하고
		 response.sendRedirect("/WMS/session_out.do");   //session_out.do 페이지로 이동 
		 System.out.println("session out2");
	}
	System.out.println("세션 유효시간:" +session.getMaxInactiveInterval());
%>

<script>

	function logout(){
	   location.href = "/WMS/session_out.do";
	}
</script>

<body onunload = "logout()">
<!-- Loading Container -->
    <div class="loading-container">
        <div class="loading-progress">
            <div class="loader">
		    Loading...
		</div>
        </div>
    </div>
    <!--  /Loading Container -->

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="navbar-container">
            <!-- Navbar Barnd -->
            <div class="navbar-header pull-left">
                <a href="#" class="navbar-brand">
                    <small>
                        <!-- img src="../assets/img/logo_title.png" alt="" / -->
                    </small>
                </a>
            </div>
            <!-- /Navbar Barnd -->

            <!-- Sidebar Collapse -->
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="collapse-icon fa fa-bars"></i>
            </div>
            
            <div class="text-align-center">					
				<span style="font-size: 20px; color: white; bold; line-height: 40px;">   
			    	<strong>${map.topMenu}
                     - ${map.pageName} 
                     </strong>
			    </span>                
			</div>
		            <!-- /Sidebar Collapse -->
            <!-- Account Area and Settings --->
            <div class="navbar-header pull-right">
                <div class="navbar-account">
                    <ul class="account-area">						

						<li>
                            <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                <div class="avatar" title="View your public profile">
                                    <img src="../assets/img/avatars/person_default.jpg">
                                </div>				
                                <section>				
                                    <h2><span class="profile"><span><%=DEPTNM %>  <%=USERNAME %>님 </span></span></h2>
                                </section>
                            </a>
                            <!--Login Area Dropdown-->
                            <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                
                                <!--Avatar Area-->
                                <li>
                                    <div class="avatar-area">
                                        <img src="../assets/img/avatars/person_default.jpg" class="avatar">
                                    </div>
                                </li>
                                <!--Avatar Area-->
                                
                                <li class="dropdown-footer">
                                    <a href="/WMS/session_out.do">
                                        Sign out
                                    </a>
                                </li>

                            </ul>
                            <!--/Login Area Dropdown-->
                        </li>
                        <!-- /Account Area -->
                        <!--Note: notice that setting div must start right after account area list.
                        no space must be between these elements-->
                       
                </div>
            </div>
            <!-- /Account Area and Settings -->
        </div>
    </div>
</div>
<!-- /Navbar -->

