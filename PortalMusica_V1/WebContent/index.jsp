<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
 <link href="css/music.css" rel="stylesheet" type="text/css">
 <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 <script src="js/jquery-2.1.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script language="javascript"> 
   		
   		function validaraltausu()
		{
   		//nombre
   			valorusu = document.getElementById("ponusu").value;
   			if( valorusu == null || valorusu.length == 0 || /^\s+$/.test(valorusu) ) {
   				alert('[ERROR] El campo debe tener un nombre usuario valido');
   			  return false;
   			}
   		//contraseña
   			valorpwd = document.getElementById("ponpwd").value;
   			if( valorpwd == null || valorpwd.length < 4 || /^\s+$/.test(valorpwd) ) {
   				alert('[ERROR] La contraseña debe tener un nombre valido y mínimo 4 carácteres');
   			  return false;
   			}
		}   
   
   		function validaraltacliente()
   		{	
   			//nombre
   			valornom = document.getElementById("ponnombre").value;
   			if( valornom == null || valornom.length == 0 || /^\s+$/.test(valornom) ) {
   				alert('[ERROR] El campo debe tener un nombre válido');
   			  return false;
   			}
   			//apellidos
   			valorape = document.getElementById("ponape").value;
   			if( valorape == null || valorape.length == 0 || /^\s+$/.test(valorape) ) {
   				alert('[ERROR] El campo debe tener un apellido válido');
   			  return false;
   			}
   						
   			//nif
   			valornif = document.getElementById("ponnif").value;
   			if( valornif == null || valornif.length != 9 || /^\s+$/.test(valornif) ) {
   				alert('[ERROR] El campo debe tener un nif válida');
   			  return false;
   			}
   			//dirección
   			valordire = document.getElementById("pondire").value;
   			if( valordire == null || valordire.length == 0 || /^\s+$/.test(valordire) ) {
   				alert('[ERROR] El campo debe tener una dirección válida');
   			  return false;
   			}
   			//teléfono
   			valortele = document.getElementById("pontele").value;
   			if(valortele == null || valortele.length != 9 || isNaN(valortele) ) {
   				alert('[ERROR] El teléfono debe ser válido');
   			  return false;
   			}
   			//email
   			if(!validarEmail(document.getElementById("poncorreo").value))	// validamos el correo valido
   		    { 
   			 alert("Ingrese un correo válido");
   			 return false;
   			}		
   			
   			//contraseña
   			valorcontra = document.getElementById("poncontra").value;
   			if( valorcontra == null || valorcontra.length < 4 || /^\s+$/.test(valorcontra) ) {
   				alert('[ERROR] La contraseña debe tener un nombre password válido y mínimo 4 carácteres');
   			  return false;
   			}
   			
   		}

   		function validarEmail(valor) {
   		  if (/(\w+)(\.?)(\w*)(\@{1})(\w+)(\.?)(\w*)(\.{1})(\w{2,3})/.test(valor)){
   			return true;
   		  } else {
   			return false;
   		  }
   		}

   	</script>
 <title>CORREOS</title>
</head>

<body class="clbody">

<div class="clbody">
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
	<button class="btn btn-primary" id="pulsaralta" data-toggle="modal" data-target="#myModal" >
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
										<input id="ponnombre" name="cUser" type="text" maxlength="11" size="11" ></input>
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
	<button class="btn btn-primary" id="pulsaralta" data-toggle="modal" data-target="#myModal2" >
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
					  	
							<form name="formenviar" method="POST" action="AltaEmpresa" onsubmit = "return validaraltacliente()">
								<table   class="table table-striped"  >
								  <caption>ALTA EMPRESA</caption><br><br>
								  
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
										<label for="crazon">RAZON SOCIAL:</label>
									</td>
									<td>	
										<input id="ponnombre" name="cRazon" type="text" maxlength="11" size="11" ></input>
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
										<input id="ponnombre" name="cUser" type="text" maxlength="11" size="11" ></input>
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
</div>

</body>
</html>