<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container" ng-controller="usuarioContoller">
	<div class="block">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<fmt:message key="form.usuario" />
			</div>
		</div>
		<div class="block-content collapse in">
			<div class="alert alert-error" ng-hide = "mostrarMensagensDeErro()">
				<a class="close" data-dismiss="alert" href="#"/>×</a>
				<div ng-repeat="erro in erros">		
					{{erro.message}}<br/>
				</div>
			</div>
			<form>
				<input id="entidadeId" type="hidden" ng-model = "entidade.id"/>
				<fieldset>
					<legend>
						<fmt:message key="usuario"></fmt:message>
					</legend>
					<div class="control-group">
						<label class="control-label"><fmt:message key="nome" /></label>
						<div class="controls">
							<input id='usuarioNome' class="form-control" type="text" ng-model = "entidade.nome" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><fmt:message key="email" /></label>
						<div class="controls">
							<input id="usuarioEmail" class="form-control" type="email" ng-model = "entidade.email" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><fmt:message key="senha" /></label>
						<div class="controls">
							<input id="usuarioSenha" class="form-control" type="password" ng-model = "entidade.senha"/>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary" ng-click="salvarEntidade()">
							<fmt:message key="save" />
						</button>
						<a type="button" class="btn" href="<c:url value="/"/>">Cancelar</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	
	<div class="block">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left"><fmt:message key = "list.usuario"></fmt:message></div>
		</div>
		<div class="block-content collapse in">
			<div class="span12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th><fmt:message key = "nome"></fmt:message></th>
							<th><fmt:message key = "email"></fmt:message></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="usuario in entidades">
							<td>{{usuario.nome}}</td>
							<td>{{usuario.email}}</td>
							<td><a href = "#" ng-click = "editarEntidade(usuario)"><i class = "icon-edit"></i></a></td>
							<td><a href = "#" ng-click = "removerEntidade(usuario)"><i class = "icon-trash"></i></a></td>
						</tr>
						<tr ng-show = "hide_mensagem_empty_table(entidades)">
							<td><fmt:message key = "lista.vazia"></fmt:message></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script src="<c:url value= "/resources/js/angular.js" />"></script>
<script src="<c:url value='/resources/js/pages/usuario/usuarioController.js' />"></script>
