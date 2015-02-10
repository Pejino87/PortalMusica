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
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="css/bar-ui.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="script/bar-ui.js"></script>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="script/soundmanager2.js"></script>
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
							out.print("<form name='id_lista' action='ModificaLista' method='POST'>");
							out.print("<input type='hidden' value='false' name='isNueva'>");
							out.print("<input type='hidden' value='"+ListasUser.getInstancia().getLista().get(i).getId_lista()+"' name='id_lista'>");
							out.print("<input type='submit' value='Modificar'>"); 
							out.print("</form>");
							out.print("</li>");
						}
					}
				out.print("<form name='Nueva Lista' action='ModificaLista' method='POST'>");
				out.print("<input type='hidden' value='true' name='isNueva'>");
				out.print("<input type='submit' value='Nueva Lista'>"); 
				out.print("</form>");
				%>
			</ul>
		</div>
		<div class='info'>
			<h3>Lista: </h3><% 
			out.print("<form name='Guardar Lista' action='CambiosLista' method='POST'>");
			out.print("<input type='text' name='titulo' value='"+ListaModificacion.getInstancia().getNombre()+"'>");
			out.print("<input type='hidden' value='false' name='isEliminar'>");
			out.print("<input type='hidden' value='"+request.getAttribute("id_lista")+"' name='id_lista'>");
			out.print("<input type='submit' value='Guardar Lista'>");
			out.print("</form>"); %>
			
			<%
				out.print("<form name='Borrar Lista' action='CambiosLista' method='POST'>");
				out.print("<input type='hidden' value='true' name='isEliminar'>");
				out.print("<input type='hidden' value='"+request.getAttribute("id_lista")+"' name='id_lista'>");
				out.print("<input type='submit' value='Eliminar Lista'>");
				out.print("</form>");
				

			%>
			<ul>
			<%
					if (ListaModificacion.getInstancia().getLista().size() == 0) {
						out.println("<li><b>No hay ninguna cancion en esa lista!</b></li>");
					} else {
						for (int i = 0; i < ListaModificacion.getInstancia().getLista().size(); i++) {
							out.print("<li>");
							out.print("<b>Titulo: "
									+ ListaModificacion.getInstancia().getLista().get(i).getTitulo() + "  </b>");
							out.print("Autor: " + ListaModificacion.getInstancia().getLista().get(i).getCantante());
							out.print("</li>");
						}

					}
			%>
				<button class="btn btn-primary" id="pulsaralta" data-toggle="modal" data-target="#myModal" >
			Nueva Cancion		
	</button>
			</ul>
		</div>
	</div>
	
	<!--  Ventana de añadir cancion -->
	

	<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content" >
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">NUEVA CANCION</h4>
			  </div>
			  <div class="modal-body">
			  
						<!--ALTA CLIENTE-->
					  	<p> Aqui va a ir esto</p>
					
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			  </div>
			</div>
		  </div>
		</div>
	
	
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>

</body>
</html>