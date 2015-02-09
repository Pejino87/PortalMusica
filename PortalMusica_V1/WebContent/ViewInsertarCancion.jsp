<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="gft.curso.clasesjava.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%	
 	//ListaCanciones miLista = new ListaCanciones(1,"Lista 1");
	ConexOracle conn = new ConexOracle();
	Statement stmt = conn.establecerConexion();
	ResultSet rs;
	String idLista = (String) request.getParameter("SelecLista");
	String URL = (String) request.getParameter("txtURL"); 
	String titulo = (String) request.getParameter("txtTitulo");
	String album = (String) request.getParameter("txtAlbum");
	String genero = (String) request.getParameter("txtGenero");
	String cantante = (String) request.getParameter("txtCantante");
	String duracion = (String) request.getParameter("txtDuracion");
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
			/*int numEle = miLista.getLista().size(); 
			miLista.getLista().add(new Cancion((numEle+1),titulo,album,genero,cantante,duracion,URL));
			int numEleDespues = miLista.getLista().size();
			if((numEle+1)==numEleDespues){
				request.getRequestDispatcher("PrincipalEmpresa.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("Error.html").forward(request, response);
			}*/
			rs = conn.consultaQuery("SELECT Id_Cancion FROM Canciones WHERE titulo='" + titulo + "'");
			if(rs.next()){
				
			}
		%>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
	
</body>
</html>