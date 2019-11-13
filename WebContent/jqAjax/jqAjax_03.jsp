<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
src = https://code.jquery.com/jquery-2.2.4.min.js></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnCalc").on("click", function(){
		$.ajax({
			type: "get"
			, url: "/jqAjax/jqAjax_ok.jsp"
			, data: {
				"num1" : $("#num1").val()
				, "num2" : $("#num2").val()
				, "oper" : $("#oper").val()
			}
			, datatype: "html"
			, success: function(data){
				console.log("성공")
				console.log(data)

				$("#resultLayout").html(data)
			}
			, error: function(data){
				console.log("실패")
			}
		})	
		
		
	})
})


</script>

</head>
<body>


<h1>jQuery 계산기03</h1>
<hr>

	<input type="text" id="num1" />
	<select id="oper">
		<option value="add">더하기</option>
		<option value="sub">빼기기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select><br>
	<input type="text" id="num2" />
	<button id="btnCalc">=</button>

<hr>
<div id="resultLayout"></div>

</body>
</html>