<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.backend.*"%>
<%@ page import="com.tienda.musica.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	HttpSession sesion = request.getSession();
	String idEmpresa = Integer.toString((Integer)session.getAttribute("ident"));
	ConexOracle conn = new ConexOracle();
	Statement stmt = conn.establecerConexion();
	ResultSet rs;
	String nombre="";

	rs = conn.consultaQuery("SELECT L.Id_User as Nombre FROM Login L, Empresa E WHERE L.Id_Login=E.Id_Login and E.Id_Empresa="+idEmpresa);
	if(rs.next()){
		nombre = rs.getString("Nombre");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Eliminar Canci�n</title>
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
		<img src="image/logo-1.png">
		<h1>Sharebeats</h1>
	</div>
	<div id='nav'>
		<h3> Bienvenido <b><%=nombre %></b></h3> 
		<form action="PerfilEmpresa" method='POST'>
		<input type="image" src="image/profile.png" alt="Submit">
		</form>		
		<form action="InvalSesion" method='POST'>
		<input type="image" src="image/close-icon.png" alt="Submit">
		</form>
	</div>

	<div id='main'>
		<div class='menu'>
			<table id='tablaMenu'>
    			<tr>
    				<form method="POST" name="nuevaCancion" action="./NuevaCancion">
						<td>A�ada una nueva cancion</td>
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