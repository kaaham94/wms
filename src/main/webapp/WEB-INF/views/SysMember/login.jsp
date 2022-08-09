<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
    
    <title>ACT Service</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/beyond.min.css" />


    <link href="../assets/css/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/weather-icons.min.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="../assets/css/animate.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="../assets/css/custom.css" />
    <link id="skin-link" href="../assets/css/skins/green.min.css" rel="stylesheet" type="text/css">


    <script type="text/javascript" src="../assets/js/jquery-1.11.0.min.js"></script>


	<script type="text/javascript" src="../assets/js/charts/highcharts/highcharts.js"></script><!-- 하이차트 -->
	<script type="text/javascript" src="../assets/js/charts/highcharts/highcharts-more.js"></script>
	<script type="text/javascript" src="../assets/js/charts/highcharts/modules/data.js"></script>
	<script type="text/javascript" src="../assets/js/charts/highcharts/modules/exporting.js"></script>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="">
	<div class="login-container animated fadeInDown" style="max-width:100%; margin:0 auto;padding:15% 0; background-image: url('../assets/img/Picture1.jpg'); background-position: center top; ">
		<div class="loginbox bg-white" style="height: 420px!important; margin:0 auto;">
			<div style="text-align:center;padding:15px 0 0px"><img src="../assets/img/logo_kelly.png"></div>
			<div style="font-size:17px; font-weight:bold;  text-align:center; padding-bottom:10px;">ACT HID 시스템</div>
			<!--<div class="loginbox-title">
			</div>-->
			<div class="loginbox-or">
                <div class="or-line"></div>
                <div class="or">LOGIN</div>
            </div>
			<div class="loginbox-social">
				<div class="social-title ">Connect with Your Accounts</div>
				
			</div>
			
			<div id="member_login">
				<div class="loginbox-textbox" style="padding-bottom:5px;">
					<input type="text" id="id" name="id" value="" class="form-control" placeholder="id" />
				</div>
				<div class="loginbox-textbox">
					<input type="password" id="pwd" name="pwd" value="" class="form-control" placeholder="Password" onKeyDown="javascript:if(event.keyCode==13) frmSubmit();" />
				</div>
				<div class="loginbox-submit">
					<a href="javascript:frmSubmit();"><input type="button" class="btn btn-primary btn-block" value="Login"  onclick="frmSubmit();return false;" ></a>
				</div>
			</div>
			
		</div>
	</div>




	<div class="login_foot">
			<h6 style="text-align: center; vertical-align: middle;">
			Copyright © WareHouse Management System. All Rights Reserved.</h6>
	</div>
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../assets/js/beyond.js"></script>
	<script src="../bootstrap/js/moment.js"></script>
	<script src="../bootstrap/js/scripts.js"></script>
	<script src="../bootstrap/js/respond.min.js"></script>
	<script src="../assets/js/toastr/toastr.js"></script>
</body>
</html>
	
	
	
	
	
		
	<script type = "text/javascript">
	
		// Log In 버튼 클릭시 진행되는 함수 
		function frmSubmit(){
			sys_member_id = $('#id').val();
			sys_member_pwd = $('#pwd').val();

			setCookie('sys_member_id', sys_member_id, 365);
			
			
			
			// 1.id 공백 일시 
			if(sys_member_id == ''){
				alert('아이디를 입력해주세요');
				return;
			// 2.pwd 공백 일시
			}else if(sys_member_pwd == ''){
				alert('비밀번호를 입력해주세요');
				return;
			// 3.id && pwd 공백이 아니라면 	
			}else{

				// 페이지 노출 로우 개수  
				if (!getCookie('pageSize')){
					setCookie('pageSize', "50", 365);		
				}
		
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/loginCheck.do' />");
				
				comSubmit.addParam("pageSize", getCookie('pageSize'));
				comSubmit.addParam("UID", sys_member_id);
	            comSubmit.addParam("PWD", sys_member_pwd);
	            comSubmit.submit();
			}
		}
		
		
		
		$(document).ready(function(){
			var sys_member_id = getCookie('sys_member_id');
			$('#id').val(sys_member_id);
		});

		
		var setCookie = function(cName, cValue, cDay){
			try {
				var expire = new Date();
				expire.setDate(expire.getDate() + cDay);
				cookies = cName + '=' + escape(cValue) + '; path=/ ';
				if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
				document.cookie = cookies;
			} catch(e) {}
		}

		var getCookie = function (cName) {
			cName = cName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cName);
			var cValue = '';
			if(start != -1){
				start += cName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cValue = cookieData.substring(start, end);
			}

			return unescape(cValue);
		}
	</script>
