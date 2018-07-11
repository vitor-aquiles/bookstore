<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
  
<tags:pageTemplate titulo="Editar">    
      
	<div class="container" >
		<h1 class="mt-5 mb-4">Editar</h1>
	
			<form:form action="${s:mvcUrl('LC#atualizar').build()}" method="POST" modelAttribute="livro">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Código:</label>
				<div class="col-sm-4">	
					<form:input path="codigo" class="form-control"/>
					<form:errors path="codigo"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Título:</label>
				<div class="col-sm-10">	
					<form:input path="titulo" class="form-control"/>
					<form:errors path="titulo"/>
				</div>
			</div>
			
			<div class="form-group row">
				<c:forEach items="${livro.paginas}" var="paginas" varStatus="status">
					<label class="col-sm-2 col-form-label">Páginas ${paginas.idioma}:</label>
					<div class="col-sm-4">
						<form:input value="${paginas.quantidade}" path="paginas[${status.index}].quantidade" class="form-control"/>
						<form:errors path="paginas"/>
					</div>
				</c:forEach>
			</div>
			
			<div class="form-group row">	
				<label class="col-sm-2 col-form-label">Gênero:</label>
				<div class="col-sm-4">	
					<form:input path="genero" class="form-control"/>
					<form:errors path="genero"/>
				</div>
				<label class="col-sm-2 col-form-label">Data Publicação:</label>
				<div class="col-sm-4">	
					<form:input path="dataPublicacao" class="form-control"/>
					<form:errors path="dataPublicacao"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Autor:</label>
				<div class="col-sm-10">	
					<form:input path="autor" class="form-control"/>
					<form:errors path="autor"/>
				</div>
			</div>
			
			<div class="form-group row">
				<c:forEach items="${livro.preco}" var="preco" varStatus="status">
					<label class="col-sm-2 col-form-label">Preço ${preço.idioma}:</label>
					<div class="col-sm-4">
						<form:input value="${preco.valor}" path="preco[${status.index}].valor" class="form-control"/>
						<form:errors path="preco"/>
					</div>
				</c:forEach>
			</div>
			
			
			<div class="form-group row">
				<div class="col-sm-10 mb-4">	
					<button type="submit" class="btn btn-primary">Atualizar</button>
				</div>
			</div>
		</form:form>
	</div>	
</tags:pageTemplate>