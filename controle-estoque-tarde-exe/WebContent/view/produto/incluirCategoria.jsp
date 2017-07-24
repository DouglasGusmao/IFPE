<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Categoria</title>

<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<c:import url="/view/comum/menu.jsp" />

	<hr><h3>Incluir Categoria</h3><hr>
	
	<div style="text-align: center; color: red;"> ${msg} </div>
	
	<form action="incluirCategoria" method="post" enctype="multipart/form-data">
	
		<div class="form-group">
			<label for="inputCodigo">Código</label>
			<input type="text" id="inputCodigo" class="form-control" name="codigo" style="width: 200px;" maxlength="100" required="required" value="${produto.codigo}" />
		</div>
		
		<div class="form-group">
			<label for="inputDescricao">Descrição</label>
			<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="500" required="required" value="${produto.descricao}" />
		</div>
		
		<p>
		
		<a href="listarProduto" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
			<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
			<button type="submit" class="btn btn-primary"> &nbsp; Inserir &nbsp; </button>
		</p>
	</form>

</body>
</html>