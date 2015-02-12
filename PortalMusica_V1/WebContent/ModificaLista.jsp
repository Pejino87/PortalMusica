<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.backend.*"%>
<%
HttpSession sesion = request.getSession();
String miRol = (String)sesion.getAttribute("rol");

if(miRol==null || miRol.equals("empresa")){
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Prueba de la barra de sonido abajo</title>
<meta name="robots" content="noindex" />
<meta name="viewport" content="width=500, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="css/bar-ui.css" />
<link rel="stylesheet" href="css/styleAlberto.css" />
<script src="script/bar-ui.js"></script>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="script/soundmanager2.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>

<script>
	jQuery(function() {
		$("#cancion").autocomplete("list.jsp");
	});
</script>


</head>
<body>

	<div id='header'>
		<img src="image/logo-1.png">
		<h1>NombrePortal</h1>
	</div>
	<div id='nav'>
	</div>

	<div id='main'>
		<div class='menu'>
		<h3>Tus listas de musica:</h3>
			<ul>
				<%
					if (ListasUser.getInstancia().getLista().size() == 0) {
						out.println("<li><b>No has creado aun ninguna lista!</b></li>");
					} else {
						for (int i = 0; i < ListasUser.getInstancia().getLista().size(); i++) {
							out.print("<li>");
							out.print("<a><p>"
									+ ListasUser.getInstancia().getLista().get(i)
											.getNombre() + "");
							out.print("<form name='id_lista' action='ModificaLista' method='POST'>");
							out.print("<input type='hidden' value='false' name='isNueva'>");
							out.print("<input type='hidden' value='"
									+ ListasUser.getInstancia().getLista().get(i)
											.getId_lista() + "' name='id_lista'>");
							out.print("<input type='submit' class='styled-button-3' value='Modificar'>");
							out.print("<input type='hidden' value='"
									+ ListasUser.getInstancia().getLista().get(i)
											.getNombre() + "' name='nombre'>");
							out.print("</form>");
							

							out.print("<form name='id_lista' action='CargaLista' method='POST'>");
							out.print("<input type='hidden' value='"
									+ ListasUser.getInstancia().getLista().get(i)
											.getId_lista() + "' name='id_lista'>");
							out.print("<input type='submit' class='styled-button-3' value='Cargar'>");
							out.print("</form>");
							out.print("</p>");
							out.print("</a>");
							out.print("</li>");
						}
					}
					out.print("<li>");
					out.print("<a> <p>Crea una nueva lista</p>");
					out.print("<form name='Nueva Lista' action='ModificaLista' method='POST'>");
					out.print("<input type='hidden' value='true' name='isNueva'>");
					out.print("<input type='submit' class='styled-button-3' value='Nueva Lista'>");
					out.print("</form>");
					out.print("</a>");
					out.print("</li>");
				%>
			</ul>
		</div>
		
		<div class='info'>
			<h3>Lista:</h3>
			<%
				out.print("<form name='Guardar Lista' action='CambiosLista' method='POST'>");
				out.print("<input type='text' name='titulo' value='"
						+ ListaModificacion.getInstancia().getNombre() + "'>");
				out.print("<input type='hidden' value='false' name='isEliminar'>");
				out.print("<input type='hidden' value='"
						+ request.getAttribute("id_lista") + "' name='id_lista'>");
				out.print("<input type='submit' value='Guardar Lista'>");
				out.print("</form>");
			%>

			<%
				out.print("<form name='Borrar Lista' action='CambiosLista' method='POST'>");
				out.print("<input type='hidden' value='true' name='isEliminar'>");
				out.print("<input type='hidden' value='"
						+ request.getAttribute("id_lista") + "' name='id_lista'>");
				out.print("<input type='submit' value='Eliminar Lista'>");
				out.print("</form>");
			%>
			<ul>
				<%
					if (ListaModificacion.getInstancia().getLista().size() == 0) {
						out.println("<li><b>No hay ninguna cancion en esa lista!</b></li>");
					} else {
						for (int i = 0; i < ListaModificacion.getInstancia().getLista()
								.size(); i++) {
							out.print("<li>");
							out.print("<b>Titulo: "
									+ ListaModificacion.getInstancia().getLista()
											.get(i).getTitulo() + "  </b>");
							out.print("Autor: "
									+ ListaModificacion.getInstancia().getLista()
											.get(i).getCantante());
							out.print("</li>");
						}

					}
				%>

			<li>Busca una nueva cancion : 
				<form name='Add Cancion' action='AddCancion' method='POST'>
				<input type="text" id="cancion" name="cancion" class="input_text" /> 
				<%out.print("<input type='hidden' value='"
						+ request.getAttribute("id_lista") + "' name='id_lista'>"); %>
				<input type='submit' value='Añadir cancion'>
				</form>
			</li>
		</ul>

		</div>
	</div>

	<!--  Ventana de añadir cancion -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Nueva canción</h4>
				</div>
				<!--DENTRO DE LA VENTANA MODAL-->
				<div class="modal-body"></div>
				<!--FIN DENTRO DE LA VENTANA MODAL-->
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