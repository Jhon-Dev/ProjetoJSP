<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de usuário</title>

<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>
	<a href="acessoliberado.jsp">Inicío</a>
	<a href="index.jsp">Sair</a>

	<center>
		<h1>Cadastro de Telefones</h1>
		<h3 style="color: green;">${msg}</h3>
	</center>

	<form action="salvarTelefones" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>User:</td>
						<td><input type="text" id="id" name="id" readonly="readonly" class="field-long"
							value="${userEscolhido.id}"></td>


						<td><input type="text" id="nome" name="nome" readonly="readonly"
							class="field-long" value="${userEscolhido.nome}"></td>
					</tr>
					<tr>
						<td>Número:</td>
						<td><input type="text" id="numero" name="numero"></td>
						
						<td>
						<select id="tipo" name="tipo" style=" width: 173px">
								<option>Casa</option>
								<option>Contato</option>
								<option>Celular</option>
								<option>Casa</option>
						</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							 <input type="submit" value="Salvar" style="width: 185px;"/>
						</td>
						<td>
							 <input type="submit" value="Voltar" onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'" style="width: 173px;"/>
						</td>
					</tr>
				</table>

			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">
			<caption>Usuários cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Número</th>
				<th>Tipo</th>
				<th>Excluir</th>
			</tr>
			<c:forEach items="${telefones}" var="fone">
				<tr>
					<td style="width: 150px"><c:out value="${fone.id}">
						</c:out></td>
					<td style="width: 150px"><c:out value="${fone.numero}">
						</c:out></td>
					<td ><c:out value="${fone.tipo}"></c:out></td>


					<td><a href="salvarTelefones?user=${fone.usuario}&acao=deleteFone&foneId=${fone.id}"><img
							src="resources/img/Excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px"> </a></td>
							


				</tr>

			</c:forEach>
		</table>
	</div>
</body>
</html>