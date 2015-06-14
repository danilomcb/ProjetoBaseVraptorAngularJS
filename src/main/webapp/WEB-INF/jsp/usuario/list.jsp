<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
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
						<c:forEach items="${entidades}" var="usuario">
							<tr>
								<td>${usuario.nome}</td>
								<td>${usuario.email}</td>
								<td><a href = "<c:url value="/usuario/form/${usuario.id}"/>"><i class = "icon-edit"></i></a></td>
								<td><a href = "<c:url value="/usuario/remover/${usuario.id}"/>"><i class = "icon-trash"></i></a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty entidades}">
							<tr>
								<td><fmt:message key = "lista.vazia"></fmt:message></td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
