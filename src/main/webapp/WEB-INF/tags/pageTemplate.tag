<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>




<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${titulo } - BookStore</title>

	<c:url value="/resources/css" var="cssPath" />
	<c:url value="/resources/images" var="imagesPath" />
	<c:url value="/resources/js" var="jsPath"/>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${cssPath}/bootstrap/bootstrap.min.css" />

    <link href="${cssPath}/logo-nav.css" rel="stylesheet">
    <link href="${cssPath}/sticky-footer.css" rel="stylesheet">
    <link href="${cssPath}/table-carrinho-itens.css" rel="stylesheet">
	
	<script src="${jsPath}/bootstrap/jquery-3.3.1.min.js"></script>
	<script src="${jsPath}/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="${jsPath}/bookstore-rel-compra.js"></script>
	<script src="${jsPath}/bookstore-rel-cadastro.js"></script>
	
</head>

<body class="${bodyClass} ">
	<%@ include file="/WEB-INF/views/cabecalho.jsp" %>
	
	<jsp:doBody />

	<%@ include file="/WEB-INF/views/rodape.jsp" %>

</body>
</html>