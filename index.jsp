<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null)
{
	response.sendRedirect("welcome.jsp");
}
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root","");
	
	if(request.getParameter("btn_login")!=null)
	{
		String dbemail,dbpassword,dbname;
		
		String email,password;
		
		email=request.getParameter("txt_email");
		password=request.getParameter("txt_password");
		
		PreparedStatement pstmt=null;
		
		pstmt=con.prepareStatement("select * from login where email=? AND password=?");
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			dbemail=rs.getString("email");
			dbpassword=rs.getString("password");
			dbname=rs.getString("firstname");
			
			if(email.equals(dbemail) && password.equals(dbpassword))
			{
				session.setAttribute("login",dbname);
				response.sendRedirect("welcome.jsp");
			}
		}
		else
		{
			request.setAttribute("errorMsg","email ou senha invalida");
		}
		
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

	<title>Kelivros - Login</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<script>
		
		function validate()
		{
			var email = document.myform.txt_email;
			var password = document.myform.txt_password;
				
			if (email.value == null || email.value == "")
			{
				window.alert("insira um email ?");
				email.style.background = '#f08080';
				email.focus();
				return false;
			}
			if (password.value == null || password.value == "") 
			{
				window.alert("insira uma senha?"); 
				password.style.background = '#f08080'; 
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>

<body>

    <div class="main-content">

        <form class="form-register" method="post" name="myform" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>KeLivros - Login</h1>
                    </div>
					
					<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg"));
					}
					%>
					</p>
				   
				   </br>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="insira um email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Senha</span>
                            <input type="password" name="txt_password" id="password" placeholder="insira uma senha">
                        </label>
                    </div>

					<input type="submit" name="btn_login" value="Login">
                    
                </div>

				<a href="register.jsp" class="form-log-in-with-existing">Não possui uma conta? <b> Registre-se </b></a>

            </div>

        </form>

    </div>

</body>

</html>
