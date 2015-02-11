<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.servlet.http.HttpSession"%>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
 <link href="css/music.css" rel="stylesheet" type="text/css">
 <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 <link rel="stylesheet" href="css/style.css" />
 <script src="js/jquery-2.1.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/jsmusic.js"></script>
  <title>PORTAL MUSICA</title>
</head>
<body>
	<div id='header'>
		<h1>Imagen del logo del portal. Header</h1>
	</div>
	<div id='nav'>
		<p>nav nav nav nav nav nav</p>
	</div>

	<div id='main'>
		<div class='menu'>
			<% 
			/*
			HttpSession sesion = request.getSession();
			String cli = (String) sesion.getAttribute("rol");
			Integer idLog = (Integer) sesion.getAttribute("ident");
			
			if (cli != "cliente") {
				sesion.invalidate();
				response.sendRedirect("index.jsp");
			}
			*/
			Integer varIde = (Integer) request.getAttribute("obsIde"); 
			String varNom = (String) request.getAttribute("obsNom"); 
			String varApe = (String) request.getAttribute("obsApe"); 
			String varNif = (String) request.getAttribute("obsNif"); 
			String varDir = (String) request.getAttribute("obsDir"); 
			Integer varTel = (Integer) request.getAttribute("obsTel"); 
			String varEma = (String) request.getAttribute("obsEma"); 
			String varUsu = (String) request.getAttribute("obsUsu"); 
			String varPwd = (String) request.getAttribute("obsPwd"); 
			
			%>
			
			  <table   class="table table-striped"  >
			    <caption>CLIENTE</caption><br><br>
				  <tr>
					<td>
						<label for="cnombre">NOMBRE:</label><br>
					</td>
					<td>
						<input id="ponnombre" name="cNom" type="text" maxlength="30" size="30"
						value="<% out.print(varNom); %>" autofocus></input>
					</td>
				  </tr>		
				  <tr>
					<td>		
						<label for="cape">APELLIDOS:</label>
					</td>
					<td>	
						<input id="ponape" name="cApe" type="text"  maxlength="30" size="30" value="<% out.print(varApe); %>"></input>
					</td>
				  </tr>		
				  <tr>
					<td>		
						<label for="cnif">NIF:</label>
					</td>
					<td>	
						<input id="ponnif" name="cNif" type="text" maxlength="11" size="11" value="<% out.print(varNif); %>"></input>
					</td>
				  </tr>	
				  <tr>
					<td>		
						<label for="cdir">DIRECCION:</label>
					</td>
					<td>	
						<input id="pondire" name="cDir" type="text" maxlength="30" size="30" value="<% out.print(varDir); %>"></input>
					</td>
			      </tr>		
				  <tr>
					<td>		
						<label for="ctel">TELEFONO:</label>
					</td>
				    <td>	
						<input id="pontele" name="cTel" type="text" maxlength="11" size="11" value="<% out.print(varTel); %>"></input>
					</td>
				  </tr>	
				  <tr>
					<td>		
						<label for="cemail">EMAIL:</label>
					</td>
					<td>	
						<input id="poncorreo" name="cEmail" type="text" maxlength="30" size="30" value="<% out.print(varEma); %>"></input>
					</td>
				  </tr>	
				  <tr>
					<td>		
						<label for="cuser">USUARIO:</label>
					</td>
					<td>	
						<input id="ponusuCli" name="cUser" type="text" maxlength="11" size="11" value="<% out.print(varUsu); %>"></input>
					</td>
				  </tr>				
				  <tr>
					<td>		
						<label for="cpwd">CONTRASEÑA:</label>
					</td>
					<td>	
						<input id="poncontra" name="cPwd" type="password" maxlength="11" size="11" value="<% out.print(varPwd); %>"></input>
						</td>
				  </tr>	
				  
				  <a href="PerfilCliente?ident=<%=varIde%>">
								MODIFICAR
				  </a>
		  </table>
		
			
			
			
			
			
		</div>
		<div class='info'>
			<h2>Bienvenido !</h2>
		</div>
	</div>
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas
	</div>
	

</body>
</html>