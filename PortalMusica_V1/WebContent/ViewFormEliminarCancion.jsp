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
		<form method="POST" name="EliminarSeleccion" action="./EliminarSeleccion">
		<div class='menuEliminar'>
			<p></p>
				<ul class="listaCanciones">
					<% 	rs = conn.consultaQuery("SELECT Id_Cancion,Titulo,Album,Genero,Cantante,Duracion FROM Canciones "+
												"WHERE Id_Cancion>1");
						while(rs.next()){%>
							<li><a class="list-item"><%= rs.getString("Titulo") %> </a></li>
        					<li><a class="list-item"><%= rs.getString("Album") %></a></li>
        					<li><a class="list-item"><%= rs.getString("Genero") %></a></li>
        					<li><a class="list-item"><%= rs.getString("Cantante") %></a></li>
        					<li><a class="list-item"><%= rs.getString("Duracion") %></a></li>
        					<li><input class="list-item" type="checkbox" name="lstCancion" value="<%= rs.getString("Id_Cancion") %>"></li>
						<%}
					%>
    			</ul>
		</div>
		<button id="btnEliminarSeleccion">Eliminar Seleccion</button>
		<% 	rs = conn.consultaQuery("SELECT LR.Id_Lista as Lista, LR.Nombre as Nombre FROM Listas_Reproduccion LR, Listas_Empresa LE"+
									"WHERE LR.Id_Lista=LE.Id_Lista and LE.Id_Empresa=1"+
									"GROUP BY  LR.Id_Lista, LR.Nombre;");
			String idLista = "";
			if(rs.next()){
				idLista = rs.getString("Lista");%>
				<button id="btnEliminarSeleccion">Eliminar Cancion En Lista</button>
				<select id="SelecLista" name="SelecLista">
				<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
					<%while(rs.next()){
						 idLista = rs.getString("Id_Lista");%>
						<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
					<%}%>
				</select>
			<%}else{
				
			}
			%>
		</form>
	</div>
	<div id="btnsFormEliminar">
		<form method="POST" name="Volver" action="PrincipalEmpresa.jsp">
			<a id="btnVolver" href="PrincipalEmpresa.jsp">Volver</a>
		</form>
	</div>
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
	
</body>
</html>