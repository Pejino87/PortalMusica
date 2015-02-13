<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	
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
<link rel="stylesheet" href="css/styleAlberto.css" />
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
			<table id='tablaMenu'>
    			<tr>
    				<form method="POST" name="nuevaCancion" action="./NuevaCancion">
						<td>Añada una nueva cancion</td>
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
		<p></p>
			<img id="imgNotaMusical" src="image/nota_musical.png">
		</div>
	</div>
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
	
</body>
</html>