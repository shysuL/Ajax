<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "n1" value="${param.name }"/>
<c:set var = "n2" value="${param.content }"/>

okokok

<div> 
		name: ${n1 }<br>
		content: ${n2 }<br><br>
	
		${n1 }님, ${n2 }
		
</div>