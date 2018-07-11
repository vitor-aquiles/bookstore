<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>



<tags:pageTemplate titulo="Login">

     
     <!-- Login Form-->
	<div class="container mt-5">
		<div id="formLogin" class="container">
			<form:form servletRelativeAction="${s:mvcUrl('formLogin').build()}" method="post" class="mx-auto p-3 col-md-6 border rounded bg-light shadow p-3 mb-5 ">
				<div class="form-group">
					<h1 class="text-center p-2">Login</h1>
				</div>
				<div class="form-group">
					<label>Usuário</label>
					<input type="text" name="username" class="form-control" />
					
				</div>
				<div class="form-group">
					<label>Senha</label>
					<input type="password" name="password" class="form-control" />
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="check">
					<label class="form-check-label">Lembrar-me</label>
					<label class="float-right">
						<a href="${s:mvcUrl('formCadastro').build()}" >Cadastrar-se</a>
						<!--<a href="#" onClick="$('#formLogin').hide(); $('#formCadastro').show()">Cadastrar-se</a>-->
					</label>
				</div>
				<div class="form-group mx-auto">
					<button type="submit" class="btn btn-primary mt-3">Logar</button>
				</div>
			</form:form>
		</div>
		
		<!--  <div id="formCadastro" class="container" style="display:none">
			<form:form action="${s:mvcUrl('formCadastro').build()}" method="post" modelAttribute="usuario" class="mx-auto p-3 col-md-6 border rounded bg-light shadow p-3 mb-5 ">
				<div class="form-group">
					<h1 class="text-center p-2">Cadastrar</h1>
				</div>
				<div class="form-group">
					<label>Email</label>
					<form:input path="email" type="text" class="form-control" placeholder="Insira um email"/>
					<form:errors path="email"/>
				</div>
				<div class="form-group">
					<label>Usuário</label>
					<form:input path="nome" type="text" class="form-control" placeholder="Insira um nome de usuário"/>
					<form:errors path="nome"/>
				</div>
				<div class="form-group">
					<label>Senha</label>
					<form:input path="senha" type="password" class="form-control" placeholder="Insira uma senha"/>
					<form:errors path="senha"/>
				</div>
				<div class="form-check">
					<label class="float-right">
						<a id="signinlink" href="#" onclick="$('#formCadastro').hide(); $('#formLogin').show()">Logar-se</a>
					</label>
				</div>
				<div class="form-group mx-auto">
					<button type="submit" class="btn btn-primary mt-3">Cadastrar</button>
				</div>
			</form:form>
		</div>-->

	</div>
</tags:pageTemplate> 