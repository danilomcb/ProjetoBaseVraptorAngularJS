<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
</script>

<c:if test="${not empty param.language}">  
    <fmt:setLocale value="${param.language}" scope="session"/>  
</c:if>

<html lang="pt-BR">
	<head>
		<title><tiles:getAsString name="title"/></title>
		<link href="${ctx}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${ctx}/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="${ctx}/resources/css/styles.css" rel="stylesheet" media="screen">
	</head>
	<body ng-app = "projetoBase">
		<tiles:insertAttribute name="header" />
		
		<tiles:insertAttribute name="body" />
		
		<tiles:insertAttribute name="footer" />
	</body>
</html>