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
		<form method="POST" name="EliminarSeleccion" action="./EliminarLista">
		<% 	
		if(listaSeleccionada==null){
			rs = conn.consultaQuery("SELECT LR.Id_Lista as Lista, LR.Nombre as Nombre FROM Listas_Reproduccion LR, Listas_Empresa LE"+
					" WHERE LR.Id_Lista=LE.Id_Lista and LE.Id_Empresa="+idEmpresa+
					" GROUP BY  LR.Id_Lista, LR.Nombre");

			String idLista = "";
			if(rs.next()){
			idLista = rs.getString("Lista");%>
			<button id="btnEliminarLista">Eliminar lista</button>
			<select id="SelecLista" name="SelecLista" selected="0">
				<option value="0">Selecciona lista</option>
				<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
				<%while(rs.next()){
					 idLista = rs.getString("Lista");%>
					<option value="<%= idLista %>"><%= rs.getString("Nombre") %></option>
				<%}%>
			</select>
			<%}else{%>
				<p>No hay listas creadas</p>
			<%}
		}else{
			conn.actualizarQuery("DELETE FROM Listas_Empresa"+
								" WHERE Id_Lista="+listaSeleccionada+" and Id_Empresa="+idEmpresa);
			System.out.println("Lista "+ listaSeleccionada+" eliminada");
			conn.actualizarQuery("commit");
		}
		%>
		</form>
		
	</div>
		<form method="POST" name="Volver" action="./PrincipalEmpresa">
			<a id="btnVolver" href="./PrincipalEmpresa">Volver</a>
		</form>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
</body>
</html>