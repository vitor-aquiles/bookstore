<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 

<c:url value="/resources/images" var="imagesPath" />

<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="${s:mvcUrl('HC#livrosHome').build() }">
          <img src="${imagesPath}/bookstore-logo.png" width="135" height="50" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="${s:mvcUrl('HC#livrosHome').build() }">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <security:authorize access="hasRole('ROLE_ADMIN')">
	            <li class="nav-item">
	              <a class="nav-link" href="${s:mvcUrl('LC#listar').build() }">Livros</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${s:mvcUrl('LC#cadastro').build() }">Cadastro</a>
	            </li>
            </security:authorize>
          </ul>
          
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="${s:mvcUrl('CC#itens').build()}">Carrinho (${carrinho.quantidade})</a>
            </li>
            <security:authorize access="!isAuthenticated()">
	            <li class="nav-item">
	              <a class="nav-link" href="${s:mvcUrl('formLogin').build() }">Login</a>
	            </li>
            </security:authorize>
            <security:authorize access="isAuthenticated()">
            	<li class="nav-item">
              		<a class="nav-link" href='<c:url value="/logout"></c:url>'>Logout</a>
            	</li>
            </security:authorize>
          </ul>
          
          
        </div>
      </div>
    </nav>