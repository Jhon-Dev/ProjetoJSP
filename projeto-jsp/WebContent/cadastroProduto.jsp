<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Produto</title>
<link rel="stylesheet" href="resources/css/cadastro.css">
</head>
<body>
	<center>
		<h1>Cadastro de Produto</h1>
		<h3 style="color: orange;">${msg}</h3>
	</center>

	<form action="salvarProduto" method="post" id="formProduto"
		onsubmit="return validarCampos() ? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>C�digo:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${produto.id}" class="field-long"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${produto.nome}"></td>
					</tr>

					<tr>
						<td>Quantidade:</td>
						<td><input type="text" id="quantidade" name="quantidade"
							value="${produto.quantidade}"></td>
					</tr>
					<tr>
						<td>Valor R$:</td>
						<td><input type="text" id="valor" name="valor"
							value="${produto.valor}"></td>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'"></td>
					</tr>
				</table>

			</li>
		</ul>
	</form>

	<div class="container">
		<table class="responsive-table">
			<caption>Produtos Cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Quantidade</th>
				<th>Valor</th>
				<th>Editar</th>
				<th>Salvar</th>


			</tr>

			<c:forEach items="${produtos}" var="produto">
				<tr>

					<td style="width: 150px"><c:out value="${produto.id}"></c:out></td>


					<td><c:out value="${produto.nome}"></c:out></td>
					<td><c:out value="${produto.quantidade}"></c:out></td>
					<td><c:out value="${produto.valor}"></c:out></td>



					<td><a href="salvarProduto?acao=delete&produto=${produto.id}"><img
							src="resources/img/Excluir.png" alt="Exluir" title="Exluir"
							width="20px" height="20px"></a></td>
					<td><a href="salvarProduto?acao=editar&produto=${produto.id}"><img
							src="resources/img/Editar.png" alt="Editar" title="Editar"
							width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("nome").value == '') {
				alert('Informe o Nome');
				return false;
			} else if (document.getElementById("quantidade").value == '') {
				alert('Informe o Quantidade');
				return false;
			} else if (document.getElementById("valor").value == '') {
				alert('Informe o Valor R$');
				return false;
			}
			return true;
		}
	</script>

</body>
</html>