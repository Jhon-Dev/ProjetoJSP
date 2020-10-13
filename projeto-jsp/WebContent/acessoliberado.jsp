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
	<center>
		<a href="index.jsp">Sair</a>
		
		<h3>BEM VINDO AO SISTEMA JSP</h3>

		<a href="salvarUsuario?acao=listartodos"><img alt="Cadastro"
			title="Cadastro" src="resources/img/cadastro.png" width="100"
			height="100"></a> <a href="salvarProduto?acao=listartodos"><img
			alt="Produto" title="Produtos" src="resources/img/Produto.png"
			width="100" height="100"></a>
	</center>
</body>
</html>