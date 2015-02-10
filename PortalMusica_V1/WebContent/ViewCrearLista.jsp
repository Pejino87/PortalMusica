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
	String nombreLista = (String) request.getParameter("listaNueva");
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
		<%
			rs = conn.consultaQuery("SELECT Id_Lista FROM Listas_Reproduccion WHERE Nombre = '"+nombreLista+"'");
			if(!rs.next()){
				conn.actualizarQuery("INSERT INTO Listas_Reproduccion (Id_Lista,Nombre)"+
											"VALUES(INCRELISTREPRO.nextval,'"+nombreLista+"')");
				rs = conn.consultaQuery("SELECT Id_Lista FROM Listas_Reproduccion WHERE Nombre = '"+nombreLista+"'");
				if(rs.next()){
					conn.actualizarQuery("INSERT INTO Listas_Reproduccion (Id_Empresa,Id_Lista,Id_Cancion,Fecha)"+
							"VALUES(1,"+rs.getString("Id_Lista")+",1,sysdate)");
				}
				
				conn.actualizarQuery("commit");
			}
		%>
		<form method="POST" name="Volver" action="PrincipalEmpresa.jsp">
			<a id="btnVolver" href="PrincipalEmpresa.jsp">Volver</a>
		</form>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
</body>
</html>