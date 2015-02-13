<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tienda.musica.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
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
<link rel="stylesheet" href="css/styleAlberto.css" />
<link rel="stylesheet" href="css/style.css" />
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
			<form method="POST" name="EliminarSeleccion" action="./EliminarSeleccion">
			<table id="listaCanciones">
				<% 	rs = conn.consultaQuery("SELECT Id_Cancion,Titulo,Album,Genero,Cantante,Duracion FROM Canciones "+
											"WHERE Id_Cancion>0");
					if(rs.next()){
						do{%>
						<tr>
							<td><a class="list-item"><%= rs.getString("Titulo") %> </a></td>
							<td><a class="list-item"><%= rs.getString("Album") %></a></td>
        					<td><a class="list-item"><%= rs.getString("Cantante") %></a></td>
        					<td><input class="list-item" type="checkbox" name="lstCancion" value="<%= rs.getString("Id_Cancion") %>"></td>
        				</tr>
						<%}while(rs.next());%>
						</table>
						<button id="btnEliminarSeleccion" class=".styled-button-3">Eliminar Seleccion</button>
					<%}else{%>
						<h4>" No hay canciones para eliminar!!!! "</h4>
					<%}
				%>
			</form>
		</div>
	</div>
</body>
</html>