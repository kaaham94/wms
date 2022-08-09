function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}
 
function ComSubmit(opt_formId) {
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.url = "";
     
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
     
    this.submit = function submit(){
        var frm = $("#"+this.formId)[0];
        frm.action = this.url;
        frm.method = "post";
        frm.submit();  
    };
}


//ajax json 호출 함수 
function id_Ajax(url, input_id ,num){	// (받아올 내용이 있는 URL, 받아온 내용을 처리할 부분 , 받아온 내용은 변수 개수)
	var r_json ="";
	var A = new Array();

	function success_return(json) {
		for(var i=0; i<num; i++){ A[i] = new Array() };
		input_id(json, A);
	}

	$.ajax({
		url: url,
		type:"get",
		datatype:"json",
		async: false,
		contentType : "application/json;",
		error: function(XMLHttpRequest, textStatus, errorThrown) {
	
	  		//$('#ga').append("<span style='font-size:18px; color:#ffff00; padding-top:40px'>로딩 실패</span>");
		}, 
		success:function(json){ 
			success_return(json)
		}
	});	
}



//---------------------------------------------------------------
//var server_url = "http://39.117.142.14:8080/";
var server_url = "http://localhost:8080/";

//저장한 쿠키 가져오는 함수 
var getCookie = function (cName) {

    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x === cName) {
            return unescape(y);
        }
    }
    return "";
};

//쿠키 저장하는 함수
var setCookie = function(cName, cValue, cDay){
	try {
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
		cookies = cName + '=' + escape(cValue) + '; path=/ ';
		if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
		document.cookie = cookies;
	} catch(e) {}
}

//프로시저  date 출력 포멧 함수 
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

//메뉴 또는 탭 클릭시 해당 url + 값  이동 하는 함수 
function WEBURL(WEBURL, PROGID){
	
	var url =  "";
	if(PROGID === undefined){
		url =  WEBURL
	}else{
		url =  WEBURL+"&"+getCookie(PROGID)
	}
	url = url.replace(/undefined/g,"");
	location.href=url;

	
	
	event.stopPropagation();
}

//url parameter값을 검색 값에 뿌려주는 함수 
function get_query(){
	var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for(var i = 0, result = {}; i < qs.length; i++){
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
        result[qs[i][0]] = result[qs[i][0]].replace(/undefined/g,"");
    	
        $("#"+qs[i][0]).val(result[qs[i][0]]);
    	
    	//WERKS 탭은 클릭에 따라 값이 부여되는 LGORT탭 으로 인해 기술  
    	if(qs[i][0] == "WERKS"){
    		$('#WERKS').trigger('click');
        }
    	
    	//기준정보- 코드관리 페이지의 필터 
    	if(qs[i][0] == "filter"){
    		//$("input:radio[name='filter']:radio[value='"+result[qs[i][0]]+"']").trigger('click'); // 선택하기
    		$('input:radio[name=filter]:input[value="'+result[qs[i][0]]+'"]').attr("checked", true);

    	}
  
    }
}

//해당 parameter값 가져오는 함수 
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


//input 검색 텍스트 공백 제거 함수
function removeSpace(obj){
	var a = obj.value.trim();
   	obj.value = a;
}

//값 공백 제거 함수
function trim(obj) {
	
	var trimValue = obj;
	if(obj != "" && obj !== undefined){
		trimValue = trimValue.replace(/^\s+|\s+$/g,"");
	}else{
		trimValue = "";
	}
    return trimValue;
}

// 행 input 변환 함수 	
var appendInput = function(val, color) {
	
	var td = val; 
	var td_texter = td.innerText; //td text값
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.innerText = ""; //공백값 변환 
	
	//Input 객체 생성 
	var inputObj = document.createElement('INPUT'); 
	inputObj.setAttribute("type", "text"); //객체 텍스트 속성 추가 
	inputObj.setAttribute("value", td_texter); //객체 자식노드값 추가 
	inputObj.setAttribute("style",  "width:100%; height:31px;"); //객체 style 속성 추가
	
	td.appendChild(inputObj); //객체 추가 	  
}

// 행 Select 변환 함수
var appendSelect = function(val, color) {
	
	var td = val; 
	var td_texter = td.innerHTML; //td text값
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.innerHTML = ""; //공백값 변환 
	
	//Select 객체 생성 
	var selectObj = document.createElement('SELECT');
	var OPT1 = document.createElement('OPTION');
	var OPT2 = document.createElement('OPTION');
	
	//객체 속성 추가 
	selectObj.setAttribute("type", "text");
	selectObj.setAttribute("value", td_texter); //객체 자식노드값 추가 
	selectObj.setAttribute("style",  "width:100%"); //객체 style 속성 추가
	
	OPT1.setAttribute('value', "Y");
	OPT2.setAttribute('value', "N");
	
	//값에 따른 선택값 설정
	if(td_texter == "Y"){
		OPT1.setAttribute('selected', 'selected');
	}else{
		OPT2.setAttribute('selected', 'selected');
	}

	//Option Text 객체 생성 
	OPT1.appendChild( document.createTextNode( 'Y' ) );
	OPT2.appendChild( document.createTextNode( 'N' ) );
	
	//Select 객체 안에 Option 객체 추가 
	selectObj.appendChild(OPT1);
	selectObj.appendChild(OPT2);
	
	//td 객체 추가 	 
	td.appendChild(selectObj);  
}

//행 Text 변환 함수 	
var appendText = function(val) {
	
	var td = val; 
	
	//td 속성 변경 
	td.textContent = td.childNodes[0].value;
	
	//배경색 제거
	td.style.backgroundColor = "";
}

//행 select Text 변환 함수 (select 태그의 Text와 value값이 다를때)	
var appendSelectText = function(val) {
	
	var td = val; 
	
	//td 속성 변경 
	td.textContent = td.childNodes[0].options[td.childNodes[0].options.selectedIndex].text;
	
	//배경색 제거
	td.style.backgroundColor = "";
}


//●행 checkbox 변환 함수
var appendCheckbox = function(val, color) {
	var td = val; 
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.childNodes[0].childNodes[0].removeAttribute("disabled");//객체 disabled false 속성 제거
	//alert(td.childNodes[0].innerHTML);
}
var appendNoCheckbox = function(val) {
	var td = val; 
	
	//td 속성 변경 
	td.style.backgroundColor = ""; //배경색 변환
	td.childNodes[0].childNodes[0].setAttribute("disabled", "true");//객체 disabled true 속성 추가
}


//●배경색 변환 함수 (이미지 태그 사용)
var appendImage = function(val, color) {
	var td = val; 
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환4
}
var appendNoImage = function(val) {
	var td = val; 
	
	//td 속성 변경 
	td.style.backgroundColor ="" ; //배경색 변환
}


//●파일업로드 변환 함수	
var appendFileUpload = function(val, color) {
	var td = val; 
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.childNodes[0].removeAttribute("disabled");//객체 disabled false 속성 제거
	td.childNodes[0].removeAttribute("style");//객체 disabled false 속성 제거
}
var appendNoFileUpload = function(val) {
	var td = val; 
	
	td.style.backgroundColor = ""; //배경색 변환
	td.childNodes[0].setAttribute("disabled", "true");//객체 disabled true 속성 추가
	td.childNodes[0].setAttribute("style", "color:#e5e5e5; opacity:1;");//객체 color,객체 opacity(투명도) 속성 추가
}

//●행 달력(datetimepicker) 변환 함수 	
var appendDatetimepicker = function(val, color) {

	var td = val; 
	var td_texter = td.innerText; //td text값
	
	//td 속성 변경 
	td.style.backgroundColor = color; //배경색 변환
	td.innerText = ""; //공백값 변환 
	
	//Input 객체 생성 
	var inputObj = document.createElement('INPUT'); 
	inputObj.setAttribute("type", "text"); //객체 텍스트 속성 추가 
	inputObj.setAttribute("value", td_texter); //객체 자식노드값 추가 
	inputObj.setAttribute("style",  "width:100%; height:31px;"); //객체 style 속성 추가
	inputObj.setAttribute("data-date-format",  "YYYYMMDD"); 	 //객체 data-date-format 속성 추가
	inputObj.setAttribute("class",  "datetimepicker"); 			 //객체 class 속성 추가
	
	td.appendChild(inputObj); //객체 추가 	  

	$(".datetimepicker").datetimepicker({
        format: 'YYYYMMDD',
        pickTime: false,
        language: 'kr'
    });
}

//콤마 기입해주는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
