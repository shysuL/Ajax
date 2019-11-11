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
		
	}
}



</script>

</head>
<body>


<h1>계산기01</h1>
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