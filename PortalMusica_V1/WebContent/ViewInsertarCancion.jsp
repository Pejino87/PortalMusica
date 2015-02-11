<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.tienda.musica.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%	
 	//ListaCanciones miLista = new ListaCanciones(1,"Lista 1");
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
			rs2 = conn.consultaQuery("SELECT count(1) TotalElementos FROM Canciones");
			if(rs2.next()){
				totalEle = Integer.parseInt(rs2.getString("TotalElementos"));
				System.out.println("TotalEle--> " + totalEle);
			}
			
			rs = conn.consultaQuery("SELECT Id_Cancion FROM Canciones"+
								" WHERE titulo='" + titulo + "' and url='"+URL+"'");
			if(!rs.next()){
				conn.actualizarQuery("INSERT INTO Canciones(Id_Cancion,Titulo,Album,Genero,Cantante,Duracion,URL)" +
						"VALUES (INCRECANCIONES.nextval,'"+ titulo +"','"+ album +"','"+ genero +"','"+ cantante +"',"+ duracion +",'"+ URL +"')");
				conn.actualizarQuery("commit");
				rs3 = conn.consultaQuery("Select MAX(Id_Cancion) as Maximo FROM Canciones");
				if(rs.next()){
					conn.actualizarQuery("INSERT INTO Listas_Empresa(Id_Empresa,Id_Lista,Id_Cancion,Fecha)"+
							"VALUES(1," + idLista +","+ rs3.getString("Maximo") +",sysdate)");
				}else{
					System.out.println("Cancion no insertada en lista_empresa");
				}
				conn.actualizarQuery("commit");
			}else{
				rs2 = conn.consultaQuery("SELECT Id_Empresa,Id_Lista,Id_Cancion FROM Listas_Empresa"+
										" WHERE Id_Lista="+idLista);
				if(!rs2.next()){
					conn.actualizarQuery("INSERT INTO Listas_Empresa(Id_Empresa,Id_Lista,Id_Cancion,Fecha)"+
							"VALUES(1," + idLista +","+ rs.getString("Id_Cancion") +",sysdate)");
					conn.actualizarQuery("commit");
				}else{
					System.out.println("La cancion ya existe en la lista");%>
				<%}
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