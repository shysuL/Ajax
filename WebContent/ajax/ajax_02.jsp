<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
//AJAX 객체(XHR) 을 생성하는 함수 - Cross Browsing 처리
function createXMLHttpRequest(){

	var xmlReq = null;
	if(XMLHttpRequest){ // XMLHttpRequest 객체가 존재한다면
		// IE 7.0이상일 때
		// IE 브라우저가 아닐 때
		xmlReq = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		//ActiveXObject가 존재하는 브라우저일 때
		// -> IE계열 브라우저
		
		try{
			// 비교적 최근 버전
			xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e1){
			
			try{
				// 비교적 예전 버전
				xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				// XHR이 없는 경우 아무것도 수행하지 않음
			}
		}
	}
	return xmlReq;
}
</script>

<script type="text/javascript">
// $(document).ready(function(){
// 	$("#num1").focus();
// });
	
var xmlHttp = null; // AJAX 객체
function send(){
// 	console.log("send button Clicked!!");
	
	xmlHttp = createXMLHttpRequest();
// 	console.log(xmlHttp);
	
	// 입력데이터 (전송데이터) 구하기
// 	var n1 = num1.value;
// 	var n2 = num2.value;
	var n1 = document.getElementById("num1").value;
	var n2 = window.num2.value;
	var op = oper.value;
	
	console.log("n1 : " + n1);
	console.log("n2 : " + n2);
	console.log("op : " + op);
	
	// - - - AJAX 요청 전 설정 - - - 
	// 요청 URL 지정
	var query = "num1="+n1+"&num2="+n2+"&oper="+op;
	var url = "/ajax/ajax_02_ok.jsp" + "?" + query;
	console.log(url);
	
	// 요청 Method
	var method = "GET";
	
	// AJAX 객체의 상태 변화에 따라 호출될 callback 함수 지정
	//  -> 서버로부터의 응답 데이터를 처리하는데 사용한다
	xmlHttp.onreadystatechange = callback;
	// -------------------------
	
	// - - - 요청 준비 - - -
	xmlHttp.open(method,url);
	// ------------------
	
	
	// - - - 요청 보내기 - - - 
	xmlHttp.send(null);
	// -------------------
	
}
function callback(){
// 	console.log("XHR 동작");
// 	console.log(xmlHttp.readyState);
	
	if(xmlHttp.readyState == 4){ // XHR DONE
		if(xmlHttp.status == 200){ // OK.
			console.log("정상 응답");
		
			// 정상 응답 데이터를 처리하는 함수 호출 - -
			printData();
		
		}else if(xmlHttp.status == 404) { //Not Found.
			console.log("페이지 없음");
		}else if(xmlHttp.status == 500){ //Server Internal Error.
			console.log("서버 에러");	
		}else{
			// 200(OK)또는 404(Not Found) 또는 500(Server Error)가 아닐 경우
			console.log(xmlHttp.statusText);
		}
	}
}

// 응답 데이터 처리 함수
function printData(){
// 	console.log("200 상태코드를 가진 정상 응답시 호출되는 함수");
	
	// 응답 데이터
	var result = xmlHttp.responseText;
	console.log(result);
	
	// 결과를 반영할 div
// 	var layout = document.getElementById("resultLayout");
	var layout = resultLayout
	
	// 결과 반영
	layout.innerHTML = result;
	
}

</script>

</head>
<body>


<h1>계산기02</h1>
<hr>

	<input type="text" id="num1" />
	<select id="oper">
		<option value="add">더하기</option>
		<option value="sub">빼기기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select><br>
	<input type="text" id="num2" />
	<button onclick="send();">=</button>

<hr>
<div id="resultLayout"></div>



</body>
</html>