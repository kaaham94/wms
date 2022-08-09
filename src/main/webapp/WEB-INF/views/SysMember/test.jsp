<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/include/include_head.jsp" %>
<%@ include file ="/WEB-INF/views/include/include_left.jsp" %>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>
<html>
    <body>

        <input type="text"></input>

        <button>현재페이지</button>

        <div id="pageZone"></div>

    </body>
</html>

    <script src ="https://code.jquery.com/jquery-1.11.2.js"></script>

<script type="text/javascript">
//byte수 벨리데이션 체크

    var totalCount = 1000; //전체 건수
    
    var PageViewRow = 10;	//한페이지에 보여질 행 개수

    var totalPage = Math.ceil(totalCount/PageViewRow);	//페이지 개수

    var PageNum;	//펼쳐진 이동가능한 페이지

    var page;	//현재 페이지 

    var startDataNum = (page * PageViewRow) - (PageViewRow-1) ;  	//데이터 블러올 시작 번호 
    var endDataNum = (page * PageViewRow)	//데이터 블러올 끝 번호 

    $("button").click(function(){    

        page = parseInt($("input").val());

        drawPage(page);

    });

    

    function drawPage(goTo){        

        page = goTo;    

        var pageGroup = Math.ceil(page/10);    //페이지 그룹 넘버링

        var next = pageGroup*10;

        var prev = next-9;            

        

        var goNext = next+1;

        if(prev-1<=0){

            var goPrev = 1;

        }else{

            var goPrev = prev-1;

        }    

        

        if(next>totalPage){

            var goNext = totalPage;

            next = totalPage;

        }else{

            var goNext = next+1;

        }

        

        var prevStep = " <a href='javascript:drawPage("+goPrev+");'>"+goPrev+"이동</a> ";

        var nextStep = " <a href='javascript:drawPage("+goNext+");'>"+goNext+"이동</a> ";            

        

        $("#pageZone").empty();

        $("#pageZone").append(prevStep);

        for(var i=prev; i<=next;i++){

            PageNum = "<strong>"+i+"</strong> ";

            $("#pageZone").append(PageNum);
        }    

        $("#pageZone").append(nextStep);    

    }    
</script>




