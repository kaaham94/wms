<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

session.setAttribute("USERNAME", "USERNAME" ); //이름
session.setAttribute("DEPTNM", "DEPTNM" );	//부서
session.setAttribute("UID", "20160000" );
session.setAttribute("PWD", "" );
session.setAttribute("pageSize", 10 );

%>
</body>
</html>