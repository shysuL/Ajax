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
	if(!XMLHttpRequest){ // XMLHttpRequest 객체가 존재한다면
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
$(document).ready(function(){
	$("#num1").focus();
});
// function send(){
// 	console.log("send button Clicked!!");
// }
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