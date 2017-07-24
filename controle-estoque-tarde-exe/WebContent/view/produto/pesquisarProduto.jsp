<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de Produtos</title>

<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>
<body style="margin-left: 1%;">

	<c:import url="/view/comum/menu.jsp" />
	
	<hr>
	<h3>Listar Produto</h3>
	<hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div>

	<table border="1" style="width: 100%">
		<tr>
			<td>Código</td>
			<td>Descrição</td>
			<td>Preço de Custo</td>
			<td>Preço de Venda</td>
			<td>Garantia</td>
			<td>Quantidade</td>
			<td>Imagem</td>
			<td>Ações</td>
		</tr>
		
		<c:forEach var="produto" items="${listaProduto}">
			<tr>
				<td>${produto.codigo}</td>
				<td>${produto.descricao}</td>
				<td>${produto.precoCusto}</td>
				<td>${produto.precoVenda}</td>
				<td><fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" /></td>
				<td>${produto.quantidade}</td>
				<td>
					<c:choose>
						<c:when test="${produto.imagem != ''}">
							<img src="view/img/${produto.imagem}" style="width: 30%">
						</c:when>
						<c:otherwise>
							Imagem não carregada
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href="removerProduto?id=${produto.id}">Remover</a> &nbsp;
					<a href="exibirAlterarProduto?id=${produto.id}">Alterar</a>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	
</body>
</html>