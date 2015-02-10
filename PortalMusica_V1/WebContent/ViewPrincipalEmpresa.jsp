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
			<form method="POST" name="EliminarCancionEnLista" action="./EliminarCancionEnLista">
				<button id="btnEliminarCancion">Eliminar Cancion En Lista</button>
			</form>
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