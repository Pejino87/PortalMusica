<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
 <link href="css/music.css" rel="stylesheet" type="text/css">
 <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 <link rel="stylesheet" href="css/style.css" />
 <script src="js/jquery-2.1.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/jsmusic.js"></script>
 
 <title>CORREOS</title>
</head>

<body>

	<div id='header'>
		<h1>Imagen del logo del portal. Header</h1>
	</div>
	
	<img src="img/escenario.jpg" class="pantalla"><img>
	<div class="usupass"> 
		<form name="usupwd" method="POST" action="InicioSesion" onsubmit = "return validaraltausu()">
			<table>
				<tr>
					<td class="bordertd2">
						<label for="user" class="loginlabel" >Usuario</label><br>
						<input type="text" id="ponusu" class="logininput" name="usu" required maxlength="9"><br>
						<label for="pwd" class="loginlabel">Contraseña</label><br>
						<input type="password" id="ponpwd" class="logininput" name="pwd" required maxlength="9"><br>
						<label for="enviar"></label>
						<input type="submit" class="logininput" value="ENVIAR"  >
					</td>
			    </tr>
		    </table>
	    </form>
	</div>

  <div class="altaCli">
	<!-- Button trigger modal -->
	<button  id="pulsaralta" data-toggle="modal" data-target="#myModal" >
			ALTA CLIENTE		
	</button>
	<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content" >
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">ALTA CLIENTE</h4>
			  </div>
			  <div class="modal-body">
			  
						<!--ALTA CLIENTE-->
					  	
							<form name="formenviar" method="POST" action="AltaClient" onsubmit = "return validaraltacliente()">
								<table   class="table table-striped"  >
								  <caption>ALTA CLIENTE</caption><br><br>
								  
								  <tr>
									<td>
										<label for="cnombre">NOMBRE:</label><br>
									</td>
									<td>
										<input id="ponnombre" name="cNom" type="text" maxlength="30" size="30" autofocus></input>
									</td>
								  </tr>		
								  <tr>
									<td>		
										<label for="cape">APELLIDOS:</label>
									</td>
									<td>	
										<input id="ponape" name="cApe" type="text"  maxlength="30" size="30"></input>
									</td>
								  </tr>		
								  <tr>
									<td>		
										<label for="cnif">NIF:</label>
									</td>
									<td>	
										<input id="ponnif" name="cNif" type="text" maxlength="11" size="11" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cdir">DIRECCION:</label>
									</td>
									<td>	
										<input id="pondire" name="cDir" type="text" maxlength="30" size="30" ></input>
									</td>
								  </tr>		
								  
								  <tr>
									<td>		
										<label for="ctel">TELEFONO:</label>
									</td>
									<td>	
										<input id="pontele" name="cTel" type="text" maxlength="11" size="11" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cemail">EMAIL:</label>
									</td>
									<td>	
										<input id="poncorreo" name="cEmail" type="text" maxlength="30" size="30" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cuser">USUARIO:</label>
									</td>
									<td>	
										<input id="ponusuCli" name="cUser" type="text" maxlength="11" size="11" ></input>
									</td>
								  </tr>				
								  
								  <tr>
									<td>		
										<label for="cpwd">CONTRASEÑA:</label>
									</td>
									<td>	
										<input id="poncontra" name="cPwd" type="password" maxlength="11" size="11" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cpwd1">REPITA CONTRASEÑA:</label>
									</td>
									<td>	
										<input id="poncontra1" name="cPwd1" type="password" maxlength="11" size="11" ></input>
									</td>
								  </tr>						
								  
								  <tr>
									<td>
										<label for="altaCli"></label>
										<input type="submit" name="altaCli"  class="btn btn-primary" value="ENVIAR">
									</td>
								  </tr>
								</table>
							</form>	
					
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			  </div>
			</div>
		  </div>
		</div>
	
  </div>

  <div class="altaEmp">
	<!-- Button trigger modal -->
	<button id="pulsaralta" data-toggle="modal" data-target="#myModal2" >
			ALTA EMPRESA		
	</button>
	
	<!-- Modal -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content" >
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">ALTA EMPRESA</h4>
			  </div>
			  <div class="modal-body">
			  
						<!--ALTA CLIENTE-->
					  	
							<form name="formenviar" method="POST" action="AltaEmpresa" onsubmit = "return validaraltaempresa()">
								<table   class="table table-striped"  >
								  <caption>ALTA EMPRESA</caption><br><br>
								  
								  <tr>
									<td>
										<label for="cnombre">NOMBRE:</label><br>
									</td>
									<td>
										<input id="ponnombreE" name="cNom" type="text" maxlength="30" size="30" autofocus></input>
									</td>
								  </tr>		
								  <tr>
									<td>		
										<label for="crazon">RAZON SOCIAL:</label>
									</td>
									<td>	
										<input id="ponrazonE" name="cRazon" type="text" maxlength="11" size="11" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cdir">DIRECCION:</label>
									</td>
									<td>	
										<input id="pondireE" name="cDir" type="text" maxlength="30" size="30" ></input>
									</td>
								  </tr>		
								  
								  <tr>
									<td>		
										<label for="ctel">TELEFONO:</label>
									</td>
									<td>	
										<input id="ponteleE" name="cTel" type="text" maxlength="11" size="11" ></input>
									</td>
								  </tr>		
								  <tr>
									<td>		
										<label for="cemail">EMAIL:</label>
									</td>
									<td>	
										<input id="poncorreoE" name="cEmail" type="text" maxlength="30" size="30" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cuser">USUARIO:</label>
									</td>
									<td>	
										<input id="ponusuE" name="cUser" type="text" maxlength="11" size="11" ></input>
									</td>
								  </tr>		
								  <tr>
									<td>		
										<label for="cpwd">CONTRASEÑA:</label>
									</td>
									<td>	
										<input id="poncontraE" name="cPwd" type="password" maxlength="11" size="11" ></input>
									</td>
								  </tr>	
								  <tr>
									<td>		
										<label for="cpwdE1">REPITA CONTRASEÑA:</label>
									</td>
									<td>	
										<input id="poncontraE1" name="cPwdE1" type="password" maxlength="11" size="11" ></input>
									</td>
								  </tr>							
								  
								  <tr>
									<td>
										<label for="altaCli"></label>
										<input type="submit" name="altaCli"  class="btn btn-primary" value="ENVIAR">
									</td>
								  </tr>
								</table>
							</form>	
					
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			  </div>
			</div>
		  </div>
		</div>

  </div>


</body>
</html>