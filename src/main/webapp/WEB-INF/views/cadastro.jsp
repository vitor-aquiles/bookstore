<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>



<tags:pageTemplate titulo="Cadastro">

     
     <!-- Login Form-->
	<div class="container mt-5">
		<div id="formCadastro" class="container">
			<form:form action="${s:mvcUrl('gravar').build()}" method="post" modelAttribute="usuario" class="mx-auto p-3 col-md-6 border rounded bg-light shadow p-3 mb-5 ">
				<div class="form-group">
					<h1 class="text-center p-2">Cadastrar</h1>
				</div>
				<div class="form-group">
					<label>Email</label>
					<form:input path="email" type="text" class="form-control" placeholder="Insira um email"/>
					<div class="font-italic small">
						<form:errors path="email"/>
					</div>
				</div>
				<div class="form-group">
					<label>Usuário</label>
					<form:input path="nome" type="text" class="form-control" placeholder="Insira um nome de usuário"/>
					<div class="font-italic small">
						<form:errors path="nome"/>
					</div>
				</div>
				<div class="form-group">
					<label>Senha</label>
					<form:input path="senha" type="password" class="form-control" placeholder="Insira uma senha"/>
					<div class="font-italic small">
						<form:errors path="senha"/>
					</div>
				</div>
				<div class="form-check">
					<label class="float-right">
						<a id="signinlink" href="${s:mvcUrl('formLogin').build()}" >Logar-se</a>
					</label>
				</div>
				<div class="form-group mx-auto">
					<button type="submit" class="btn btn-primary mt-3">Cadastrar</button>
				</div>
			</form:form>
		</div>
	</div>
</tags:pageTemplate> 