<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page"></jsp:useBean>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>

<title>Insert title here</title>


<link rel="stylesheet" href="resources/css/estilo.css">

</head>
<body>

	<div class="login-page">
		<div class="form">
			<form action="LoginServlet" method="post"  class="login-form">
				Login: <input type="text" id="login" name="login"> <br />
				Senha: <input type="password" id="senha" name="senha"> <br />
				<button type="submit" value="Logar">LOGAR</button>

			</form>
		</div>
	</div>
</body>
</html>