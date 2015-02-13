<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tienda.musica.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
	HttpSession sesion = request.getSession();
	String idEmpresa = Integer.toString((Integer)session.getAttribute("ident"));
	ConexOracle conn = new ConexOracle();
	Statement stmt = conn.establecerConexion();
	ResultSet rs;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Prueba de la barra de sonido abajo</title>
<meta name="robots" content="noindex" />
<meta name="viewport" content="width=500, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="script/soundmanager2.js"></script>
<script src="script/bar-ui.js"></script>
<link rel="stylesheet" href="css/bar-ui.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/styleAlberto.css" />
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
			<table id='tablaMenu'>
    			<tr>
    				<form method="POST" name="nuevaCancion" action="./NuevaCancion">
						<td>Añada una nueva cancion</td>
						<td><button id="btnNuevaCancion" class="styled-button-3">Nueva</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="EliminarCancion" action="./EliminarCancion">
						<td>Elimine una cancion de la base de datos:(</td>
						<td><button id="btnEliminarCancion" class="styled-button-3">Eliminar</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="EliminarCancionEnLista" action="./EliminarCancionEnLista">
						<td>Elimine una cancion de una lista :(</td>
						<td><button id="btnEliminarCancion" class="styled-button-3">Eliminar</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="EliminarLista" action="./EliminarLista">
						<td>Elimine una lista de reproduccion :(</td>
						<td><button id="btnEliminarLista" class="styled-button-3">Eliminar</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="CrearLista" action="./CrearLista">
						<td><input type="text" name="listaNueva" value="" placeholder="Nombre Lista"></td>
						<td><button id="btnCargar" class="styled-button-3">Crear</button></td>
					</form>
    			</tr>
			</table>
		</div>
		<div class='info'>
		<p></p>
					<% 	rs = conn.consultaQuery("SELECT LR.Id_Lista as Lista, LR.Nombre as Nombre FROM Listas_Reproduccion LR, Listas_Empresa LE"+
							" WHERE LR.Id_Lista=LE.Id_Lista and LE.Id_Empresa="+idEmpresa+
							" GROUP BY  LR.Id_Lista, LR.Nombre");
						String idLista;
						if(rs.next()){
							idLista = rs.getString("Lista");%>
						<form method="POST" name="InsertarCancion" action="./InsertarCancion">
							<table id='tablaInfo'>
							<tr>
							<td>
							<p><select id="SelecLista" name="SelecLista">
							<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
							<%while(rs.next()){
							 idLista = rs.getString("Lista");%>
							<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
							<%}%>
							</select></p>
							</td>
							</tr>
								<tr>
									<td>
										<input type="text" name="txtURL" value="" placeholder="URL">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="txtTitulo" value="" placeholder="Titulo">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="txtAlbum" value="" placeholder="Album">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="txtGenero" value="" placeholder="Genero">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="txtCantante" value="" placeholder="Cantante">
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="txtDuracion" value="" placeholder="Duracion">
									</td>
								</tr>
								<tr>
									<td>
										<button id="btnCargar" class="styled-button-3">Cargar Cancion</button>
									</td>
								</tr>
							</table>
						</form>
						<%}else{%>
							<h4>" Aún no has creado ninguna lista de reproducción. No esperes mas!!!! "</h4>
						<%}
					%>
			
		</div>
		<form method="POST" name="Volver" action="./PrincipalEmpresa">
			<a id="btnVolver" href="./PrincipalEmpresa">Volver</a>
		</form>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
</body>
</html>