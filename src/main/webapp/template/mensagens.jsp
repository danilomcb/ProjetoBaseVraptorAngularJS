<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:if test="${!empty errors}">
	<div class="alert alert-error">
		<a class="close" data-dismiss="alert" href="#" />×</a>
		<c:forEach var="erro" items="${errors}">		
					${erro.category} ${erro.message}<br />
		</c:forEach>
	</div>
</c:if>