<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Produto</title>

<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>
<body style="margin-left: 1%;">

	<c:import url="/view/comum/menu.jsp" />

	<hr><h3>Incluir Produto</h3><hr>
	
	<div style="text-align: center; color: red;"> ${msg} </div>
	
	<form action="incluirProduto" method="post" enctype="multipart/form-data">
	
		<div class="form-group">
			<label for="inputCodigo">Código</label>
			<input type="text" id="inputCodigo" class="form-control" name="codigo" style="width: 200px;" maxlength="100" required="required" value="${produto.codigo}" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">Descrição</label>
			<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="500" required="required" value="${produto.descricao}" />
		</div>
		
		<p>
			Categoria: <br />
			<select name="categoriaProduto" class="form-control" style="width: 200px;">
				<option value=""> Selecione </option>
				<c:forEach items="${listaCategoriaProduto}" var="obj">
			<option value="${obj.id}"> ${obj.descricao} </option>
			</c:forEach>
			</select>
</p>
		
		<div class="form-group">
			<label for="precoCusto">Preço de Custo</label>
			<input type="text" id="precoCusto" class="form-control" name="precoCusto" style="width: 200px;" maxlength="100" required="required" value="${produto.precoCusto}" />
		</div>
		
		<div class="form-group">
			<label for="precoVenda">Preço de Venda</label>
			<input type="text" id="precoVenda" class="form-control" name="precoVenda" style="width: 200px;" maxlength="100" required="required" value="${produto.precoVenda}" />
		</div>
		
		<div class="form-group">
			<label for="garantia">Garantia</label>
			<input type="text" id="garantia" class="form-control" name="garantia" style="width: 200px;" maxlength="100" required="required" value="<fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" />" />
		</div>
		
		<div class="form-group">
			<label for="garantia">Quantidade em Estoque</label>
			<input type="text" id="quantidade" class="form-control" name="quantidade" style="width: 200px;" maxlength="100" required="required" value="${produto.quantidade}" />
		</div>
		
		<div class="form-group">
			<label for="garantia">Foto do Produto</label>
			<input type="file" name="file">
		</div>
		
		<br/><br/>
		
		<p> 
			<a href="listarProduto" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Inserir &nbsp; </button>
		</p>
	</form>

</body>
</html>