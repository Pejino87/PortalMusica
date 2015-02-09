<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="gft.curso.clasesjava.*" %>
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
			<p></p>
			<form method="POST" name="nuevaCancion" action="./NuevaCancion">
				<button id="btnNuevaCancion">Nueva Cancion</button>
			</form>
			<form method="POST" name="EliminarCancion" action="./EliminarCancion">
				<button id="btnEliminarCancion">Eliminar Cancion</button>
			</form>
		</div>
		<div class='info'>
		<p></p>
			<form method="POST" name="InsertarCancion" action="./InsertarCancion">
				<p><select id="SelecLista" name="SelecLista">
					<% 	rs = conn.consultaQuery("SELECT Id_Lista FROM Listas_Reproduccion");
						String idLista;
						while(rs.next()){%> 
							<% idLista = rs.getString("Id_Lista"); %>
							<option value="<%= idLista %>">Lista <%= idLista %></option>
						<%}
					%>
				</select></p>
				<p><input type="text" name="txtURL" value="" placeholder="URL"></p>
				<p><input type="text" name="txtTitulo" value="" placeholder="Titulo"></p>
				<p><input type="text" name="txtAlbum" value="" placeholder="Album"></p>
				<p><input type="text" name="txtGenero" value="" placeholder="Genero"></p>
				<p><input type="text" name="txtCantante" value="" placeholder="Cantante"></p>
				<p><input type="text" name="txtDuracion" value="" placeholder="Duracion"></p>
				<button id="btnCargar">Cargar Cancion</button>
			</form>
		</div>
		<form method="POST" name="Volver" action="PrincipalEmpresa.jsp">
			<a id="btnVolver" href="PrincipalEmpresa.jsp">Volver</a>
		</form>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
	
</body>
</html>