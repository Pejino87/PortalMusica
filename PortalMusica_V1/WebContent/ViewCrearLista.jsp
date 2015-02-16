<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tienda.musica.*" %>
<%@ page import="com.backend.*"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
	HttpSession sesion = request.getSession();
	String idEmpresa = Integer.toString((Integer)session.getAttribute("ident"));
	ConexOracle conn = new ConexOracle();
	Statement stmt = conn.establecerConexion();
	ResultSet rs,rs2;
	String nombreLista = (String) request.getParameter("listaNueva");
	String nombre="";

	rs = conn.consultaQuery("SELECT L.Id_User as Nombre FROM Login L, Empresa E WHERE L.Id_Login=E.Id_Login and E.Id_Empresa="+idEmpresa);
	if(rs.next()){
		nombre = rs.getString("Nombre");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Crear Lista</title>
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
		<%
			rs = conn.consultaQuery("SELECT Id_Lista FROM Listas_Reproduccion WHERE Nombre = '"+nombreLista+"'");
			if(!rs.next()){
				conn.actualizarQuery("INSERT INTO Listas_Reproduccion (Id_Lista,Nombre)"+
											"VALUES(INCRELISTREPRO.nextval,'"+nombreLista+"')");
				rs = conn.consultaQuery("SELECT Id_Lista FROM Listas_Reproduccion WHERE Nombre = '"+nombreLista+"'");
				if(rs.next()){
					conn.actualizarQuery("INSERT INTO Listas_Empresa (Id_Empresa,Id_Lista,Id_Cancion,Fecha)"+
							"VALUES("+idEmpresa+","+rs.getString("Id_Lista")+",0,sysdate)");
				}
				
				conn.actualizarQuery("commit");
				response.sendRedirect("./PrincipalEmpresa");
			}
		%>
		<form method="POST" name="Volver" action="./PrincipalEmpresa">
			<a id="btnVolver" href="./PrincipalEmpresa">Volver</a>
		</form>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
</body>
</html>