<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Bem vindo ao curso de JSP</h1>
	<%
		out.print("Seu sucesso garantido");
	%>
	
	<form action="receber-nome.jsp">
	  <input type="text" id="nome"  name="nome">
	  <input type="submit" value="Enviar"/>
	</form>
</body>
</html>