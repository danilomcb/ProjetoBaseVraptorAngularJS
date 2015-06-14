<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="${ctx}">Projeto Base</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li><a class="languageFlag" href="?language=pt_BR"><img	src="${ctx}/resources/images/flags/br.png" alt="br" /></a></li>
						<li><a class="languageFlag" href="?language=en"><img src="${ctx}/resources/images/flags/us.png" alt="en" /></a></li>
						<li><a href="<c:url value = "/login/sair"/>"><fmt:message	key="sair" /></a></li>
					</ul>
					<ul class="nav">
						<li class="${activeHome}"><a href="#"><fmt:message key = "home"/></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<fmt:message key="usuario" /> <span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/usuario/form"/>"><fmt:message key = "form"/></a></li>
								<li><a href="<c:url value="/usuario/list"/>"><fmt:message key = "lista"/></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>