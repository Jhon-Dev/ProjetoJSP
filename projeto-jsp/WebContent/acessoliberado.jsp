<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>

<body>
<a href="index.jsp">Sair</a>

	<h3>Seja bem vindo ao sistema JSP</h3>

	<a href="salvarUsuario?acao=listartodos"><img alt="Cadastro"
		title="Cadastro" src="resources/img/cadastro.png" width="100"
		height="100"></a>

	<a href="salvarProduto?acao=listartodos"><img alt="Produto"
		title="Produtos" src="resources/img/Produto.png" width="100"
		height="100"></a>

</body>
</html>