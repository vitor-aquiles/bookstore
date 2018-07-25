<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<c:url value="/resources/images" var="imagesPath" />
<c:url value="/" var="contextPath" />


<tags:pageTemplate titulo="Carrinho">
  	
  	
  	
  	
	 <!-- Page Content -->
    <div class="container">
    	<h1 class="mt-5 mb-4">Carrinho</h1>
    	
    	<c:if test="${carrinho.quantidade ne 0}">
    	<div>
    		<table class="table table-hover table-carrinho">  
				<thead class="thead-dark">
					<tr>
						<th>Item</th>
						<th>Idioma</th>
						<th>Preço</th>
						<th>Quantidade</th>
						<th>Total</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${carrinho.itens}" var="item">
						<tr> 
							<td class="col-sm-4">${item.livro.titulo}</td>
							<td class="col-sm-2">${item.idioma}</td>
							<td class="col-sm-2">R$ ${item.valor}</td>
							<td class="col-sm-2">
								<form:form id="formQtd" action="${contextPath}carrinho/atualizar" method="post">
									<input type="hidden" value="${item.livro.codigo}" name="codigo">
									<input type="hidden" value="${item.idioma}" name="idioma">
									<input class="table-input" type="number"  min="0" value="${carrinho.getQuantidade(item)}" name="quantidade" onchange="atualizaQtd();">
								</form:form>
							</td>
							<td class="col-sm-2">R$ ${carrinho.getTotal(item)}</td>
							<td class="col-sm-1">
								<form:form action="${s:mvcUrl('CC#remover').arg(0, item.livro.codigo).arg(1, item.idioma).build()}" method="post">
									<input type="image" src="${imagesPath}/excluir.png" alt="Excluir" title="Excluir">
								</form:form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot> 
				<tr class="table-active">
					<td colspan="3"></td>
					<td>			</td>
					<td>R$ ${carrinho.total}</td>
					<td></td>
				</tr>
				<tr class="table-row"> 
					<td colspan="4"></td>
					<td>
						<form:form>
							<button class="btn btn-primary" type="submit">Finalizar</button>
						</form:form>
					</td>
					<td></td>
				</tr>
				</tfoot>
			</table> 
			<div class="d-flex flex-row-reverse">
				
			</div>
			</div>	
    	</c:if>
    	
    	<c:if test="${carrinho.quantidade eq 0}">
			<p>Seu carrinho de compras está vazio!</p>
			<a href="/bookstore">Confira nossos livros!</a>
		</c:if>
	</div>
</tags:pageTemplate>