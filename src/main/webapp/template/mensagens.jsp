<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="alert alert-error" ng-hide = "mostrarMensagensDeErro()">
	<a class="close" ng-click="fecharMensagemDeErro()">×</a>
	<div ng-repeat="erro in erros">		
		{{erro.message}}<br/>
	</div>
</div>