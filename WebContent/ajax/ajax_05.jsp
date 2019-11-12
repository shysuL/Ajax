<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src = "/js/httpRequest.js"></script>


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
	var url = "./ajax_05_ok.jsp";
	
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
// 	console.log("-----resultText -----")
// 	console.log(httpRequest.responseText);
	
// 	console.log("-----resultXML-----")
// 	console.log(httpRequest.responseXML);
	
	var result = httpRequest.responseXML;
	console.log(result);
	
	// XML Pasing, 데이터(태그) 추출
	var member = result.getElementsByTagName("member")[0];
	
	var records = member.getElementsByTagName("record");
	
	var firstRecord = records[0];
	
	var name = firstRecord.getElementsByTagName("name")[0];
	var content = firstRecord.getElementsByTagName("content")[0];
	
	console.log("- - - name - - -  " );
	console.log(name);
	console.log(" - - - content - - -  " );
	console.log(content);
	
	var nameData = name.firstChild.nodeValue;
	var contentData = content.firstChild.nodeValue;
	
	console.log("-------")
	console.log(nameData)
	console.log(contentData)
	
	window.result.innerHTML += "<div>" + nameData +"," + contentData+ "</div>";
}



// body를 strig으로받고 
// innerHTML로 불러온다음에
// div (+)추가한다

</script>

</head>
<body>

<h1>AJAX 05</h1>
<hr>

 
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