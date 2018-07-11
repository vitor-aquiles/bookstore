<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	
<tags:pageTemplate titulo="Detalhe">
<div class="container" >
		<h1 class="mt-5 mb-4">Detalhes</h1>
	
		<form action="#" method="post">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Versão:</label>
				<div class="col-sm-4">	
					<input type="radio" name="PT"/>
					<input type="radio" name="EN"> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Título:</label>
				<div class="col-sm-10">
					<input class="form-control" value="${livro.titulo}" readonly/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Páginas:</label>
				<c:if test="PT == true">
					<div class="col-sm-4">
						<input class="form-control" value="${paginas[idioma.PT].quantidade}" readonly/>
					</div>	
				</c:if>
				<c:if test="PT == false">
					<div class="col-sm-4">
						<input class="form-control" value="${paginas[idioma.EN].quantidade}" readonly/>
					</div>	
				</c:if>
			</div>
			
			<div class="form-group row">	
				<label class="col-sm-2 col-form-label">Gênero:</label>
				<div class="col-sm-4">	
					<input class="form-control" value="${livro.genero}" readonly/>
				</div>
				<label class="col-sm-2 col-form-label">Data Publicação:</label>
				<div class="col-sm-4">	
					<input class="form-control" value="${livro.dataPublicacao}" readonly/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Autor:</label>
				<div class="col-sm-10">	
					<input class="form-control" value="${livro.autor}" readonly/>
				</div>
			</div>
			
			<div class="form-group row">
				<c:forEach items="${livro.preco}" var="preco">
					<label class="col-sm-2 col-form-label">Preço ${preco.idioma}:</label>
					<div class="col-sm-4">
						<input class="form-control" value="${preco.valor}" readonly/>	
					</div>
				</c:forEach>
			</div>
		</form>
	</div>	
</tags:pageTemplate>