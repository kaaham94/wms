<%@ page contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8" import="java.util.*"%>
<%@ taglib prefix="spriong" uri="http://www.springframework.org/tags" %>
<%@ page import="java.text.SimpleDateFormat"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	// data 받기
	Object obj = request.getAttribute("list");
	obj = (obj == null) ? new ArrayList() : obj;
	List<Map<String,String>> list = (List)obj;
	
	//파일명에 날짜 붙이기
	Date date = new Date();
	SimpleDateFormat dayformat  = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	SimpleDateFormat hourFormat = new SimpleDateFormat("hhmmss"  , Locale.KOREA);
	String day = dayformat.format(date);
	String hour = hourFormat.format(date);
	String fileName = "Job Posting 등록 관리";
	
	response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
	response.setContentType("application/vnd.ms-excel");
	
%>
<!doctype html>
<html lang="ko" style="overflow:hidden">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<style>td { mso-number-format:\@; } </style>
	</head>
	<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
	    <table width="784" border = "1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bordercolordark="#6C717D" cellspacing="0" cellpadding="0">
	        <thead>
	            <tr>
	                <th>No</th>
					<th>회사</th>
					<th>카테고리</th>
					<th>이름</th>
					<th>이메일</th>
					<th>휴대폰 번호</th>
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
	                            <td>${row.number }</td>
	                            <td>${row.company }</td>
	                            <td>${row.category }</td>
	                            <td>${row.name }</td>
	                            <td>${row.email }</td>
	                            <td>${row.phoneNumber }</td>
	                            <td>${row.title }</td>
	                            <td>${row.registrant }</td>
	                            <td>${row.viewCount }</td>
	                            <td>${row.date }</td>
	                            <td>${row.modified_date }</td>
	                        </tr>
	                    </c:forEach>
	                </c:when>
	            </c:choose>
	        </tbody>
	    </table>
	</body>
</html>