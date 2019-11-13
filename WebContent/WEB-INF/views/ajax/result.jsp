<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<table>
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
	</tr>
	<c:forEach var="mem" items="${list }">
	<tr>
		<td>${mem.id }</td>
		<td>${mem.pw }</td>
	</c:forEach>
</table>