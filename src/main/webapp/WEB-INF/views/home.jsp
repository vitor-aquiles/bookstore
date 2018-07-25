<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
	
<tags:pageTemplate titulo="Home">

	<!-- Page Content -->
    <div class="container ">
    <security:authorize access="isAuthenticated()">
    	<security:authentication property="principal" var="usuario"/><h3 class="mt-5">Olá, ${usuario.nome}</h3>
	</security:authorize>
      <div class="row mt-5">
        
        <div class="col-lg-12">
		
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid mx-auto" src="http://placehold.it/900x350" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid mx-auto" src="http://placehold.it/900x350" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid mx-auto" src="http://placehold.it/900x350" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
 
          <div class="row">

				<c:forEach items="${listaLivros}" var="livro">

		            <div class="col-lg-3 col-md-6 mb-4">
		              <div class="card h-100">
		                <a href="${s:mvcUrl('LC#detalhes').arg(0, livro.codigo).build()}"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
		                <div class="card-body">
		                  <h4 class="card-title"> 
		                    <a href="${s:mvcUrl('LC#detalhes').arg(0, livro.codigo).build()}">${livro.titulo}</a>
		                  </h4>
		                  <p class="card-text">Autor: ${livro.autor}</p>
		                  <c:forEach items="${livro.preco}" var="preco">
		                  	<c:if test="${preco.idioma == idiomaPt}">
		                  		<h4>R$ ${preco.valor}</h4>
		                  	</c:if>
		                  </c:forEach>
		                </div>
		                <div class="card-footer">
		                  <!--<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>-->
		                  
		                  <form:form action="${s:mvcUrl('LC#detalhes').arg(0, livro.codigo).build()}" method="post"> 
		                  	<button class="btn btn-primary">Comprar</button>
		                  </form:form>
		                  <!-- 
		                  <form action="${s:mvcUrl('LC#detalhes').arg(0, livro.codigo).build()}" method="post">
		                  	<button type="submit" class="btn btn-primary">Comprar</button> 
		                  </form> -->
		                </div>
		              </div>
		            </div>
		         </c:forEach>

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
</tags:pageTemplate>