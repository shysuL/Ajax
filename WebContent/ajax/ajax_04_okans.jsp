<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 
${param.name }
${param.content }
--%>
<div> 
		name: ${param.name }<br>
		content: ${param.content }<br><br>
	
		${param.name }님, ${param.content }
</div>
<hr>

