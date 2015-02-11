<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tienda.musica.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%	
 	//ListaCanciones miLista = new ListaCanciones(1,"Lista 1");
	ConexOracle conn = new ConexOracle();
	Statement stmt = conn.establecerConexion();
	ResultSet rs,rs2;
	String listaSeleccionada = request.getParameter("SelecLista");
	String[] seleccionadas = request.getParameterValues("lstCancion");
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
		<form method="POST" name="EliminarSeleccion" action="./EliminarCancionEnLista">
		<% 	rs = conn.consultaQuery("SELECT LR.Id_Lista as Lista, LR.Nombre as Nombre FROM Listas_Reproduccion LR, Listas_Empresa LE"+
									" WHERE LR.Id_Lista=LE.Id_Lista and LE.Id_Empresa=1"+
									" GROUP BY  LR.Id_Lista, LR.Nombre");
			String idLista = "";
			if(rs.next()){
				idLista = rs.getString("Lista");%>
				<button id="btnFlitrarCanciones">Filtrar canciones</button>
				<%
				if(listaSeleccionada==null){%>
					<select id="SelecLista" name="SelecLista" selected="0">
					<option value="0">Selecciona lista</option>
				<%}else{%>
					<select id="SelecLista" name="SelecLista" selected="<%= listaSeleccionada %>">
				<%}
				%>
				<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
					<%while(rs.next()){
						 idLista = rs.getString("Lista");%>
						<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
					<%}%>
				</select>
			<%}
			idLista = request.getParameter("SelecLista");
			if(idLista==null){
				idLista="0";
			}
			
			%>
		</form>
		<form method="POST" name="EliminarSeleccion" action="./EliminarSeleccionEnLista">
		<div class='menuEliminar'>
			<%
			if(Integer.parseInt(idLista)>0){%>
				<ul class="listaCanciones">
				<% 	
					rs = conn.consultaQuery("SELECT can.Id_Cancion,can.Titulo,can.Album,can.Genero,can.Cantante,can.Duracion"+
											" FROM Canciones can, Listas_Empresa LE"+
											" WHERE can.Id_Cancion>1 and LE.Id_Cancion=can.Id_Cancion and LE.Id_Lista="+idLista);
					while(rs.next()){%>
						<li><a class="list-item"><%= rs.getString("Titulo") %> </a></li>
    					<li><a class="list-item"><%= rs.getString("Album") %></a></li>
    					<li><a class="list-item"><%= rs.getString("Genero") %></a></li>
    					<li><a class="list-item"><%= rs.getString("Cantante") %></a></li>
    					<li><a class="list-item"><%= rs.getString("Duracion") %></a></li>
    					<li><input class="list-item" type="checkbox" name="lstCancion" value="<%= rs.getString("Id_Cancion") %>"></li>
    					<li><input type="hidden" name="idLista" value="<%= listaSeleccionada %>"></li>
					<%}
				%>
			</ul>
			<%}
			%>
		</div>
		<button id="btnEliminarSeleccion">Eliminar Cancion En Lista</button>
		</form>
	</div>
		<form method="POST" name="Volver" action="./PrincipalEmpresa">
			<a id="btnVolver" href="./PrincipalEmpresa">Volver</a>
		</form>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
</body>
</html>