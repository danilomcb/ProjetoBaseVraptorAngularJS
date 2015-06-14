<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<div id = "login" class="container">
		<form class="form-signin" action="<c:url value="/login/login"/>" method="post">
			<h2 class="form-signin-heading">Please sign in</h2>
			
			<input type="text" class="input-block-level" name = "entidade.email" value = "${entidade.email}" placeholder="Email address"> 
			<input type="password" class="input-block-level" name = "entidade.senha" value = "${entidade.senha}" placeholder="Password"> 
			<label class="checkbox">
				<input type="checkbox" value="remember-me">
				Remember me
			</label>
			<button class="btn btn-large btn-primary" type="submit">Entrar</button>
		</form>
	</div>
	<script src="<c:url value='/resources/js/jquery-2.1.3.js' />"></script>
    <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
	