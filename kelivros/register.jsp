<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root","");
	
	if(request.getParameter("btn_register")!=null)
	{
		String firstname,lastname,email,password;
		
		firstname=request.getParameter("txt_firstname");
		lastname=request.getParameter("txt_lastname");
		email=request.getParameter("txt_email");
		password=request.getParameter("txt_password");
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login(firstname,lastname,email,password) values(?,?,?,?)");
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,email);
		pstmt.setString(4,password);
		
		pstmt.executeUpdate();
		
		request.setAttribute("successMsg","Cadastrado com sucesso...! por favor faça login");

		con.close();
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Registrar - Kelivros </title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript para validação do cadastro -->
	<script>	
	
		function validate()
		{
			var first_name= /^[a-z A-Z]+$/; 
			var last_name= /^[a-z A-Z]+$/; 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;r 
			
			var fname = document.getElementById("fname");
            var lname = document.getElementById("lname");
            var email = document.getElementById("email");
            var password = document.getElementById("password");
			
			if(!first_name.test(fname.value) || fname.value=='') 
            {
				alert("nsira seu nome apenas com letras do alfabeto....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value=='') 
            {
				alert("Insira seu sobrenome apenas com letras do alfabeto....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Insira um email valido....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Senha deve contar entre 6 e 12 digitos, permitindo: !@#$%&*()<>");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Register</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg"));
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>Nome</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="insira o nome">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Sobrenome</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="insira o sobrenome">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="insira o email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Senha</span>
                            <input type="password" name="txt_password" id="password" placeholder="insira uma senha">
                        </label>
                    </div>

					<input type="submit" name="btn_register" value="Cadastrar">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Já possui uma conta? <b> Entre aqui </b></a>

            </div>

        </form>

    </div>

</body>

</html>
