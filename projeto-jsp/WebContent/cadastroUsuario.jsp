<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de usuário</title>

<link rel="stylesheet" href="resources/css/cadastro.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
	
</script>

</head>
<body>
<a href="acessoliberado.jsp"><img alt="Inicio" title="Inicio" src="resources/img/inicio.png" width="25" height="25"> </a>
<a href="index.jsp"><img alt="Sair" title="Sair" src="resources/img/Excluir.png" width="25" height="25"></a>

	<center>
		<h1>Cadastro de usuário</h1>
		<h3 style="color: green;">${msg}</h3>
	</center>

	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;"
		enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>ID:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" /></td>
						<td>CEP:</td>
						<td><input type="text" id="cep" name="cep" value="" maxlength="9"
							onblur="consultarCep()" value="${user.cep}" /></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login" maxlength="10"
							value="${user.login}" /></td>
						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua" maxlength="50"
							value="${user.rua}" /></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha" maxlength="10"
							value="${user.senha}" /></td>
						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro" maxlength="50"
							value="${user.bairro}" /></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="50"
							value="${user.nome}" /></td>
						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade" maxlength="50"
							value="${user.cidade}" /></td>
					</tr>
					<tr>

						<td>Estado:</td>
						<td><input type="text" id="estado" name="estado" maxlength="50"
							value="${user.estado}" /></td>
					</tr>
					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge" maxlength="30"
							value="${user.ibge}" /></td>
					</tr>
					<tr>
						<td>Foto:</td>
						<td><input type="file"  name="foto">
						
						
					</tr>

					<tr>
						<td>Curriculo:</td>
						<td><input type="file" id="curriculo" name="curriculo">
					</tr>



					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
					</tr>
				</table>

			</li>
		</ul>
	</form>

	<div class="container">
		<table class="responsive-table">
			<caption>Lista de Usuários</caption>
			<tr>
				<th>Id</th>
				<th>Login</th>
				<th>Foto</th>
				<th>Curriculo</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Delete</th>
				<th>Editar</th>

			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td style="width: 150px"><c:out value="${user.id}">
						</c:out></td>
					<td style="width: 150px"><c:out value="${user.login}">
						</c:out></td>

                    <c:if test="${user.fotoBase64Miniatura.isEmpty() == false}">
					<td><a href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"><img src='<c:out value="${user.fotoBase64Miniatura}" /> ' alt="Imagem" title="Imagem" width="32px" height="32px" /> </a></td>
					</c:if>
                    <c:if test="${user.fotoBase64Miniatura == null}">
                    <td><img alt="Imagem User" src="resources/img/userpadrao.png"  width="35px" height="35px" onclick="alert('Não possui Imagem')" ></td>
					</c:if>
					
					 <c:if test="${user.curriculoBase64.isEmpty() == false}">
					<td><a href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"> <img alt="Curriculo" src="resources/img/pdf.png" width="35px" height="35px"> </a></td>
					 </c:if>
					 <c:if test="${user.curriculoBase64 == null}">
                    <td><img alt="Curriculo" src="resources/img/pdf.png" width="35px" height="35px" onclick="alert('Não possui Curriculo')">  </td>
					</c:if>
					 
					<td><c:out value="${user.nome}"></c:out></td>
					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img alt="Telefones" title="Telefones" src="resources/img/telefone.png" width="23px" height="23px"></a></td>
					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img src="resources/img/Excluir.png" alt="excluir" title="Excluir" width="20px" height="20px"> </a></td>
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img alt="Editar" title="Editar" src="resources/img/Editar.png" width="20px" height="20px"></a></td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert('Informe o Login');
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert('Informe o Senha');
				return false;
			} else if (document.getElementById("nome").value == '') {
				alert('Informe o Nome');
				return false;
			} else if (document.getElementById("Telefone").value == '') {
				alert('Informe o Telefone');
				return false;
			}

			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {

							//Atualiza os campos com os valores da consulta.
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);

						} //end if.
						else {

							//Atualiza os campos com os valores da consulta.
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');

							//CEP pesquisado não foi encontrado.
							alert("CEP não encontrado.");
						}
					});

		}
	</script>
</body>
</html>