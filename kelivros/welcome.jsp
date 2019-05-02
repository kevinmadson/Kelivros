<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Bem-vindo <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">

</head>

<body>


    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ")
	{
		response.sendRedirect("index.jsp"); 
	}
	%>
	
	<br />
	<br />
	<h1 style="color:red;font-size:500%"> KeLivros</h1>
	<h2> Seja bem-vindo ao nosso painel de controle Sr.<%=session.getAttribute("login")%> !</h2>
	<br />
	
	<h2> Escolha a opção desejada: </h1>
	
	<h2><a href="http://localhost:8080/teste/autor.jsp">Painel do Autor</a></h2>
	<h2><a href="http://localhost:8080/teste/personagem.xhtml">Painel do Personagem</a></h2>

	<br />
	<h2> ou faça logout para acessar outra conta </h1>
	<br />
	<h2><a href="logout.jsp">Logout</a></h2>
    
	</center>
		
    </div>

</body>

</html>
