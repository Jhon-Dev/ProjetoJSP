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

<title>Login</title>

<link rel="stylesheet" href="resources/css/style.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	charset="utf-8"></script>
</head>
<body>


	<form action="LoginServlet" method="post" class="login-form">
		<h1>Login</h1>

		<div class="txtb">
			<input type="text" id="login" name="login"> <span
				data-placeholder="login"></span>
		</div>

		<div class="txtb">
			<input type="password" id="senha" name="senha"> <span
				data-placeholder="senha"></span>
		</div>

		<input type="submit" class="logbtn" value="Logar">

		<div class="bottom-text">
			Don't have account? <a href="#">Sign up</a>
		</div>

	</form>

	<script type="text/javascript">
		$(".txtb input").on("focus", function() {
			$(this).addClass("focus");
		});

		$(".txtb input").on("blur", function() {
			if ($(this).val() == "")
				$(this).removeClass("focus");
		});
	</script>
</body>
</html>