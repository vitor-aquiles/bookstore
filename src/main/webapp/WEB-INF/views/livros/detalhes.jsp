<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="br.com.bookstore.models.Idioma" %>
	
	
	<!-- Fazer onClick para tornar os campos editáveis -->
	
	
<c:url value="/" var="contextPath" />	
	
<tags:pageTemplate titulo="Detalhe">
	<div class="container" >
		<h1 class="mt-5 mb-4">Detalhes</h1>
		
		<div class="row">
		
			<div class="col-sm-3"> 
				<input type="image" value="" src="http://placehold.it/230x300" class="d-block mx-auto">
			</div> 
		
			<div class="col-sm-9">
				<form:form id="form"  action="${contextPath}carrinho/add" method="post">
					<input type="hidden" value="${livro.codigo}" name="codigo">
					<input type="hidden" id="idioma" name="idioma" value="PT">
					<div class="form-group row">
						<label class="col-sm-1 col-form-label">Versão:</label>
						 <!-- <div id="pt" class="col-sm-6 btn-group btn-group-toggle active" data-toggle="buttons">
							<label class="col-sm-3 btn btn-secondary" onclick="javascript:versaoCheck();">
								<input type="radio"  name="PT" autocomplete="off"/>
								PT
							</label>
							
							<label id="en" class="col-sm-3 btn btn-secondary" onclick="javascript:versaoCheck();">
								<input type="radio"  name="EN" autocomplete="off">
								EN
							</label>
						 </div>--> 
					<div class="col-sm-6">
						<div class="form-check form-check-inline mt-2">
							<input checked type="radio" class="form-check-input" id="pt" value="${Idioma.PT}" name="inlineMaterialRadiosExample" onclick="javascript:versaoCheck();">
							<label class="form-check-label">Português BR</label>
						</div>
						<div class="form-check form-check-inline mt-2"> 
							<input type="radio" class="form-check-input" id="en" value="${Idioma.EN}" name="inlineMaterialRadiosExample" onclick="javascript:versaoCheck();">
							<label class="form-check-label">Inglês USA</label>
						</div>
					</div>
					
					</div>
					<div class="form-group row">
						<label class="col-sm-1 col-form-label">Título:</label>
						<div class="col-sm-8">
							<input class="form-control" value="${livro.titulo}" readonly/>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-1 col-form-label">Páginas:</label>
						<c:set var="paginas" value="${livro.paginas}"></c:set>
							<div id="paginaPt" style="display: inline" class="col-sm-3">
								<input class="form-control" value="${paginas[0].quantidade}" readonly />
							</div>
							<div id="paginaEn" style="display: none" class="col-sm-3">
								<input class="form-control" value="${paginas[1].quantidade}" readonly />
							</div>
					</div>
					
					<div class="form-group row">	
						<label class="col-sm-1 col-form-label">Gênero:</label>
						<div class="col-sm-3">	
							<input class="form-control" value="${livro.genero}" readonly/>
						</div>
						<label class="col-sm-2 col-form-label">Publicação:</label>
						<div class="col-sm-3">	
							<input class="form-control" value="${livro.dataPublicacao}" readonly/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-1 col-form-label">Autor:</label>
						<div class="col-sm-8">	
							<input class="form-control" value="${livro.autor}" readonly/>
						</div>
					</div>
					
					<div class="form-group row">
						 <label class="col-sm-1 col-form-label">Preço:</label>
						<c:set var="precos" value="${livro.preco}"></c:set>
							<div id="precoPt" style="display: inline" class="col-sm-3">
								<input class="form-control" value="${precos[0].valor}" readonly />
							</div>
							<div id="precoEn" style="display: none" class="col-sm-3">
								<input class="form-control" value="${precos[1].valor}" readonly />
							</div>
					</div>
					
					<div class="form-group row float-right">
						<button type="submit" class="btn btn-primary">Comprar</button>
						
					</div>
				</form:form>
			</div>
		
		
		</div>
		
	</div>	
</tags:pageTemplate>