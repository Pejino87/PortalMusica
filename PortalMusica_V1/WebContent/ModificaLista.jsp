<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.backend.*"%>
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
			<ul>
				<%
					if (ListasUser.getInstancia().getLista().size() == 0) {
						out.println("<li><b>No has creado aun ninguna lista!</b></li>");
					} else {
						for (int i = 0; i < ListasUser.getInstancia().getLista().size(); i++) {
							out.print("<li>");
							out.print("<b>"
									+ ListasUser.getInstancia().getLista().get(i)
											.getNombre() + "  </b>");
							out.print("<button>Cargar</button>");
							out.print("<button>Modificar</button>");
							out.print("</li>");
						}
					}
				%>
			</ul>
		</div>
		<div class='info'>
			<ul>
				<li>Ejemplo de lista canciones cargada:</li>
				<li>Cancion 1: - Nombre - Autor - Etc <b>X</b></li>
				<li>Cancion 2: - Nombre - Autor - Etc <b>X</b></li>
				<li>Cancion 3: - Nombre - Autor - Etc <b>X</b></li>
				<li>Cancion 4: - Nombre - Autor - Etc <b>X</b></li>
				<li>Cancion 5: - Nombre - Autor - Etc <b>X</b></li>
			</ul>
		</div>
	</div>
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>

</body>
</html>