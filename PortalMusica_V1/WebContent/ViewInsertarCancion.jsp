<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.backend.*"%>
<%@ page import="com.tienda.musica.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
	HttpSession sesion = request.getSession();
	String idEmpresa = Integer.toString((Integer)session.getAttribute("ident"));
	ConexOracle conn = new ConexOracle();
	Statement stmt = conn.establecerConexion();
	ResultSet rs,rs2,rs3;
	int totalEle = -1;
	String idLista = (String) request.getParameter("SelecLista");
	String URL = (String) request.getParameter("txtURL"); 
	String titulo = (String) request.getParameter("txtTitulo");
	String album = (String) request.getParameter("txtAlbum");
	String genero = (String) request.getParameter("txtGenero");
	String cantante = (String) request.getParameter("txtCantante");
	String duracion = (String) request.getParameter("txtDuracion");
	String nombre="";

	rs = conn.consultaQuery("SELECT L.Id_User as Nombre FROM Login L, Empresa E WHERE L.Id_Login=E.Id_Login and E.Id_Empresa="+idEmpresa);
	if(rs.next()){
		nombre = rs.getString("Nombre");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insertar Cancion</title>
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
			if(titulo.equals("") || album.equals("") || genero.equals("") || cantante.equals("") || duracion.equals("") || URL.equals("")){
				System.out.println("Algun campo está sin rellenar");
				response.sendRedirect("./PrincipalEmpresa");
			}else{
				System.out.println("V");
				rs = conn.consultaQuery("SELECT Id_Cancion FROM Canciones"+
									" WHERE titulo='" + titulo + "' and url='"+URL+"'");
				if(!rs.next()){
					conn.actualizarQuery("INSERT INTO Canciones(Id_Cancion,Titulo,Album,Genero,Cantante,Duracion,URL)" +
							"VALUES (INCRECANCIONES.nextval,'"+ titulo +"','"+ album +"','"+ genero +"','"+ cantante +"','"+ duracion +"','"+ URL +"')");

					rs2 = conn.consultaQuery("Select MAX(Id_Cancion) as Maximo FROM Canciones");
					if(rs2.next()){
						conn.actualizarQuery("INSERT INTO Listas_Empresa(Id_Empresa,Id_Lista,Id_Cancion,Fecha)"+
								"VALUES("+idEmpresa+"," + idLista +","+ rs2.getString("Maximo") +",sysdate)");
					}else{
						System.out.println("Cancion no insertada en lista_empresa");
					}
					conn.actualizarQuery("commit");
					response.sendRedirect("./PrincipalEmpresa");
				}else{
					rs2 = conn.consultaQuery("SELECT Id_Empresa,Id_Lista,Id_Cancion FROM Listas_Empresa"+
											" WHERE Id_Lista="+idLista+" and Id_Cancion="+rs.getString("Id_Cancion"));
					if(!rs2.next()){
						conn.actualizarQuery("INSERT INTO Listas_Empresa(Id_Empresa,Id_Lista,Id_Cancion,Fecha)"+
								"VALUES("+idEmpresa+"," + idLista +","+ rs.getString("Id_Cancion") +",sysdate)");
						conn.actualizarQuery("commit");
						response.sendRedirect("./PrincipalEmpresa");
					}else{
						System.out.println("La cancion ya existe en la lista");%>
					<%}
				}
			}
		%>
		<form method="POST" name="Volver" action="./PrincipalEmpresa">
			<h1>NO SE INSERTÓ LA CANCIÓN</h1>
			<a id="btnVolver" href="./PrincipalEmpresa">Volver</a>
		</form>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
	
</body>
</html>