<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="<c:url value= "/resources/js/angular.js" />"></script>
<script src="<c:url value='/resources/js/pages/usuario/loginController.js' />"></script>

<div id = "login" class="container" ng-controller="loginController">
	<form class="form-signin">
		<h2 class="form-signin-heading">Please sign in</h2>
		
		<input type="text" class="input-block-level" placeholder="Email address" ng-model = "entidade.email"> 
		<input type="password" class="input-block-level" placeholder="Password" ng-model = "entidade.senha"> 
		<label class="checkbox">
			<input type="checkbox" value="remember-me">
			Remember me
		</label>
		<button style="margin-bottom: 20px;" class="btn btn-large btn-primary" type="submit" ng-click="login()">Entrar</button>
		
		<c:import url="${ctx}/template/mensagens.jsp" />
		
	</form>
</div>

<script src="<c:url value='/resources/js/jquery-2.1.3.js' />"></script>
<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
