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
$(document).ready(function(){
	$("[name='num1']").focus();
});

</script>
</head>
<body>

<h1>계산기01</h1>
<hr>

<form action="./ajax_01_ok.jsp" method = "post">
	<input type="text" name="num1" />
	<select name="oper">
		<option value = "add">더하기</option>
		<option value = "sub">빼기기</option>
		<option value = "mul">곱하기</option>
		<option value = "div">나누기</option>
	</select><br>
	<input type="text" name="num2"/>
	<input type="submit" name=" = "/>
	
</form>

</body>
</html>