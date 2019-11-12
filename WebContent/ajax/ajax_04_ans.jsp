<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src = "/js/httpRequest.js"></script>

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

var xmlHttp = null; // AJAX 객체

// <button>태그의 onclick 리스너
// AJAX 호출 코드
function send(){
	// 전달 파라미터 얻기
// 	var name = window.name.value;  // name은 window 객체에 존재할 수 있음
	var name = document.getElementById("name").value;
	var content = window.content.value;
	
	
	
	// - - - AJAX 요청 전 설정 - - - 
	// 요청 URL 과 쿼리스트링 생성
	var query = "name="+name+"&content="+content;
	var url = "./ajax_04_okans.jsp";
	
	// AJAX요청
	sendRequest("POST", url,query,callback);
	
	
}

// AJAX 요청 처리 콜백 함수
function callback(){
// 	console.log("응답 처리 함수 호출됨");
	
	
	
	if(httpRequest.readyState == 4){ // XHR DONE
		if(httpRequest.status == 200){ // HTTP OK.
			console.log("정상 응답");
			
			appendResult();
		
		}
	}
}

// 결과 <div>를 추가하는 함수
function appendResult(){
// 	console.log("appendResult() called")
	
	// 방법 1
// 	var newDiv = document.createElement("div"); // <div>태그 생성
	
// 	newDiv.innerText = httpRequest.responseText; // 응답 데이터를 div에 추가
// 	result.appendChild(newDiv); // id = "result" 인 요소에 div추가
	
	
	// 방법 2
// 	window.result.innerHTML += "<div>" + httpRequest.responseText + "</div>";
	
	
	// 방법 3
	window.result.innerHTML += httpRequest.responseText;
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


// body를 strig으로받고 
// innerHTML로 불러온다음에
// div (+)추가한다

</script>

</head>
<body>

<h1>AJAX 04 _TT</h1>
<hr>

<!-- 이름, <input>태그, name="name" -->
<!-- 내용, <textarea>태그, name="content" -->

<!-- 이름, 내용 두 개의 데이터를 ajax_04_ok.jpsp로 전송-->
<!-- 전송한 데이터를 이용하여 응답데이터 작성 -->

<!-- 응답 받은 데이터를 이용하여  <div>를 생성하고 그 안에 데이터를 기록 -->
<!-- 형식
	<div> 
		name: Alice
		content: 안녕하세요!
	
		Alice님, 안녕하세요!
	</div>
 -->
 
<!-- 응답 받은 <div>태그는 <button> 하단에 계속해서 추가되도록 한다 --> 
 
 
 <div>
 	<label>이름 : <input type = "text" id = "name" /></label><br>
 	<label>
 		내용<br>
 		<textarea id ="content"></textarea>
 	</label><br>
 	<button onclick="send();"> 전송 </button>
 </div>
 <hr>
 <div id="result"></div>


</body>
</html>