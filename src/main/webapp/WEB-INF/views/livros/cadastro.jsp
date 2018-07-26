<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
  
<tags:pageTemplate titulo="Cadastro">    
      
	<div class="container" >
		<h1 class="mt-5 mb-4">Cadastro</h1>
	
		<form:form action="${s:mvcUrl('LC#gravar').build()}" method="POST" modelAttribute="livro">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label font-weight-bold">Código:</label>
				<div class="col-sm-4">	
					<form:input path="codigo" class="form-control" onkeypress="return isIntNumber(event)" required="true"/>
					<div class="font-italic small"> 
						<form:errors path="codigo"/>
					</div> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label font-weight-bold">Título:</label>
				<div class="col-sm-10">	
					<form:input path="titulo" required="true" class="form-control"/>
					<div class="font-italic small">
						<form:errors path="titulo"/>
					</div> 
				</div>
			</div>
			<div class="form-group row">
				<c:forEach items="${idiomas}" var="idioma" varStatus="status">
					<label class="col-sm-2 col-form-label font-weight-bold">Páginas ${idioma}:</label>
					<div class="col-sm-4">	
						<form:input min="1" path="paginas[${status.index}].quantidade"  class="form-control" onkeypress="return isIntNumber(event)" required="true"/>
						<form:hidden value="${idioma}" path="paginas[${status.index}].idioma" class="form-control"/>
						<div class="font-italic small">
							<form:errors path="paginas[${status.index}].quantidade"/>
						</div> 
					</div>
				</c:forEach>
			</div>
			<div class="form-group row">	
				<label class="col-sm-2 col-form-label font-weight-bold">Gênero:</label>
				<div class="col-sm-4">	
					<form:input path="genero" class="form-control" required="true"/>
					<div class="font-italic small">
						<form:errors path="genero"/>
					</div> 
				</div>
				<label class="col-sm-2 col-form-label font-weight-bold">Data Publicação:</label>
				<div class="col-sm-4">	
					<form:input path="dataPublicacao" class="form-control" pattern="\d{2}\/\d{4}" required="true" placeholder="Ex: 05/2013"/>
					<div class="font-italic small">
						<form:errors path="dataPublicacao"/>
					</div> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label font-weight-bold">Autor:</label>
				<div class="col-sm-10">	
					<form:input path="autor" class="form-control" required="true"/>
					<div class="font-italic small">
						<form:errors path="autor"/>
					</div> 
				</div>
			</div>
			<div class="form-group row">
				<c:forEach items="${idiomas}" var="idioma" varStatus="status">
					<label class="col-sm-2 col-form-label font-weight-bold">Preço ${idioma}:</label>
					<div class="col-sm-4">	
						<form:input path="preco[${status.index}].valor" class="form-control" onkeypress="return isDecimalNumber(event)" pattern="^\d*(\.\d{0,2})?$" placeholder="Ex: 50, 89.90" required="true"/>
						<form:hidden value="${idioma}" path="preco[${status.index}].idioma" class="form-control"/>
						<div class="font-italic small">
							<form:errors path="preco[${status.index}].valor"/>
						</div> 
					</div>
				</c:forEach>
			</div>
			<div class="form-group row">
				<div class="col-sm-10 mb-4">	
					<button type="submit" class="btn btn-primary">Gravar</button>
				</div>
			</div>
		</form:form>
	</div>	
</tags:pageTemplate>