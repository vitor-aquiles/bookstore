<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<c:url value="/resources/images" var="imagesPath" />
<c:url value="/" var="contextPath" />

<tags:pageTemplate titulo="Lista">
  	
	 <!-- Page Content -->
    <div class="container">
      <h1 class="mt-5 mb-4">Livros</h1>
    

		<!-- class="table-carrinho" somente para text-align -->
		<table class="table table-hover table-carrinho">
			<thead class="thead-dark">
				<tr>
					<th>Código</th>
					<th>Título</th>
					<th>Data Publicação</th>
					<th>Autor</th>
					<th>Preço PT</th>
					<th>Preço EN</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<c:forEach items="${listaLivros}" var="livro">
				<tr>
					<td><a href="${s:mvcUrl('LC#detalhesAdmin').arg(0, livro.codigo).build() }">${livro.codigo}</a></td>
					<td><a href="${s:mvcUrl('LC#detalhesAdmin').arg(0, livro.codigo).build() }">${livro.titulo}</a></td>
					<td>${livro.dataPublicacao}</td> 
					<td>${livro.autor}</td>
					<c:forEach items="${livro.preco}" var="preco">
						<td>${preco.valor}</td>
					</c:forEach>
					<td>
						<form:form action="${s:mvcUrl('LC#editar').arg(0, livro.codigo).build() }" method="post">
							<input type="image" src="${imagesPath}/editar.png" alt="Editar" title="Editar">
						</form:form>
					</td>					 
					<td>
						<form:form action="${s:mvcUrl('LC#excluir').arg(0, livro.codigo).build() }" method="post">
							<input type="image" src="${imagesPath}/excluir.png" alt="Excluir" title="Excluir"/>
						</form:form>
					</td> 
				</tr>
			</c:forEach>
		</table>	
	</div>
</tags:pageTemplate>