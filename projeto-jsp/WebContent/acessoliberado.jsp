<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>BEM VINDO</title>

</head>

<body>
<a href="acessoliberado.jsp"><img alt="Inicio" title="Inicio" src="resources/img/inicio.png" width="25" height="25"></a>
<a href="index.jsp"><img alt="Sair" title="Sair" src="resources/img/Excluir.png" width="25" height="25"></a>

	<center style="padding-top: 5%">


		<h3>BEM VINDO AO SISTEMA JSP</h3>

		<table>

			<tr>
				<td><a href="salvarUsuario?acao=listartodos"><img alt="Cadastro"
			title="Cadastro" src="resources/img/cadastro.png" width="100"
			height="100"></a></td>
			
				<td><a href="salvarProduto?acao=listartodos"><img
			alt="Produto" title="Produtos" src="resources/img/Produto.png"
			width="100" height="100"></a></td>
			</tr>
			<tr>
			<td>Card Usuário</td>
			<td>Card Produto</td>
			</tr>

		</table>

		 
	</center>
</body>
</html>