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
			<table align="center">
    			<tr>
    				<form method="POST" name="nuevaCancion" action="./NuevaCancion">
						<td align="left">Añada una nueva cancion</td>
						<td align="left"><button id="btnNuevaCancion" class="styled-button-3">Nueva</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="EliminarCancion" action="./EliminarCancion">
						<td align="left">Elimine una cancion de la base de datos:(</td>
						<td align="left"><button id="btnEliminarCancion" class="styled-button-3">Eliminar</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="EliminarCancionEnLista" action="./EliminarCancionEnLista">
						<td align="left">Elimine una cancion de una lista :(</td>
						<td align="left"><button id="btnEliminarCancion" class="styled-button-3">Eliminar</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="EliminarLista" action="./EliminarLista">
						<td align="left">Elimine una lista de reproduccion :(</td>
						<td align="left"><button id="btnEliminarLista" class="styled-button-3">Eliminar</button></td>
					</form>
    			</tr>
    			<tr>
    				<form method="POST" name="CrearLista" action="./CrearLista">
						<td align="left"><input type="text" name="listaNueva" value="" placeholder="Nombre Lista"></td>
						<td align="left"><button id="btnCargar" class="styled-button-3">Crear</button></td>
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
							<p><select id="SelecLista" name="SelecLista">
							<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
							<%while(rs.next()){
							 idLista = rs.getString("Lista");%>
							<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
							<%}%>
							</select></p>
							<p><input type="text" name="txtURL" value="" placeholder="URL"></p>
							<p><input type="text" name="txtTitulo" value="" placeholder="Titulo"></p>
							<p><input type="text" name="txtAlbum" value="" placeholder="Album"></p>
							<p><input type="text" name="txtGenero" value="" placeholder="Genero"></p>
							<p><input type="text" name="txtCantante" value="" placeholder="Cantante"></p>
							<p><input type="text" name="txtDuracion" value="" placeholder="Duracion"></p>
							<button id="btnCargar" class="styled-button-3">Cargar Cancion</button>
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