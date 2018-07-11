<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<c:url value="/resources/images" var="imagesPath" />

<tags:pageTemplate titulo="Lista">
  	
	 <!-- Page Content -->
    <div class="container">
      <h1 class="mt-5 mb-4">Livros</h1>
    

	
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Código</th>
					<th>Título</th>
					<th>Data Publicação</th>
					<th>Autor</th>
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
					<td>
						<a href="${s:mvcUrl('LC#editar').arg(0, livro.codigo).build() }">
							<img alt="Editar" src="${imagesPath}/editar.png" title="Editar">
						</a>
					</td>
					<td>
						<a href="${s:mvcUrl('LC#excluir').arg(0, livro.codigo).build() }">
							<img alt="Excluir" src="${imagesPath}/excluir.png" title="Excluir">
						</a>
					</td>
					<!-- 
					<td>
						<form action="${s:mvcUrl('LC#excluir').arg(0, livro.codigo).build() }" method="post">
							<input type="image" src="${imagesPath}/excluir.png" alt="Excluir" title="Excluir"/>
						</form>
					</td> -->
				</tr>
			</c:forEach>
		</table>	
	</div>
</tags:pageTemplate>