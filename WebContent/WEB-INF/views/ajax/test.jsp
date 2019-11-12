<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
src = "/js/httpRequest.js"></script>

<script type="text/javascript">
window.onload = function(){
	var btnAction = document.getElementById("btnAction");
	
	btnAction.addEventListener("click", function(){
// 		console.log("[JS] btnAction Clicked");
		
		sendRequest("POST","/ajax/test","",callback);
	});
};

function callback(){
	if(httpRequest.readyState == 4){ // XHR DONE
		if(httpRequest.status == 200){ // HTTP OK
// 			console.log("정상적인 AJAX 완료");
		
			printData();
		}
	}
}

function printData(){
	var res = document.getElementById("result");
	
	var jsonText = httpRequest.responseText; // 응답 데이터 받기
	
	var jsonObject = JSON.parse(jsonText); // 응답 데이터 JSON 파싱, 언마샬링
	// 1	
// 	res.innerHTML += JSON.parse(jsonText) + "<br>"
	
// 	res.innerHTML += jsonObject + "<br>";


	// 2
	console.log(jsonObject);
// 	console.log(jsonObject.data);
// 	res.innerHTML += jsonObject.data + "<br>";

	// Member Map
// 	res.innerHTML += "<br>" + jsonObject.id + ":" + jsonObject.pw + "<br>";

	// Member List
	for(var i = 0; i<jsonObject.length; i++){
		res.innerHTML += "<div>" + jsonObject[i].id + ":" + jsonObject[i].pw + "<div>";
	}
	

// ========================
// 	res.innerHTML = httpRequest.responseText;
// 	res.innerHTML += httpRequest.responseText + "<br>";
	
	
}
</script>

</head>
<body>

<h1>AJAX 테스트</h1>
<hr>

<button id="btnAction">AJAX 요청</button>

<div id="result"></div>

</body>
</html>