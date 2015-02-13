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
<script type="text/javascript" src="script/soundmanager2.js"></script>
<script src="script/bar-ui.js"></script>
<link rel="stylesheet" href="css/bar-ui.css" />
<link rel="stylesheet" href="css/styleAlberto.css" />
</head>
<body>

<!-- HEADER -->
	<div id='header'>
		<img src="image/logo-1.png">
		<h1>Sharebeats</h1>
	</div>
<!-- FIN HEADER -->
	
<!-- NAV -->	
	<div id='nav'>
		<h3> Bienvenido <% out.print(ListasUser.getInstancia().getCliente()); %></h3> 
		<a href='perfilCliente.jsp'>Acceder a perfil</a>
		<a href='index.jsp'>Cerrar sesion</a>
	</div>
<!-- FIN NAV -->



<!-- MAIN -->
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



<!-- INFO  -->
		<div class='info'>
		<%Cita c = new Cita();
		 int n = c.getRandom();
		 out.print("<h4>\""+c.getCita(n)+"\"</h4>");
		 out.print("<p>"+c.getAutor(n)+"</p>");
		%>

		</div>
<!-- FIN INFO -->
	</div>
<!-- FIN MAIN -->

	
	
	
	<!-- FOOTER -->
	<div id='footer'>Aqui solo va la información del copyright y esas
		cosas</div>
	<!-- FIN FOOTER -->	



	<!-- A PARTIR DE AQUI, REPRODUCTOR DE MUSICA -->

	<div class="sm2-bar-ui full-width fixed">

		<div class="bd sm2-main-controls">

			<div class="sm2-inline-texture"></div>
			<div class="sm2-inline-gradient"></div>

			<div class="sm2-inline-element sm2-button-element">
				<div class="sm2-button-bd">
					<a href="#play" class="sm2-inline-button play-pause">Play /
						pause</a>
				</div>
			</div>

			<div class="sm2-inline-element sm2-inline-status">
				<div class="sm2-playlist">
					<div class="sm2-playlist-target">
						<!-- playlist <ul> + <li> markup will be injected here -->
						<!-- if you want default / non-JS content, you can put that here. -->
						<noscript>
							<p>JavaScript is required.</p>
						</noscript>
					</div>
				</div>

				<div class="sm2-progress">
					<div class="sm2-row">
						<div class="sm2-inline-time">0:00</div>
						<div class="sm2-progress-bd">
							<div class="sm2-progress-track">
								<div class="sm2-progress-bar"></div>
								<div class="sm2-progress-ball">
									<div class="icon-overlay"></div>
								</div>
							</div>
						</div>
						<div class="sm2-inline-duration">0:00</div>
					</div>
				</div>

			</div>

			<div class="sm2-inline-element sm2-button-element sm2-volume">
				<div class="sm2-button-bd">
					<span class="sm2-inline-button sm2-volume-control volume-shade"></span>
					<a href="#volume" class="sm2-inline-button sm2-volume-control">volume</a>
				</div>
			</div>

			<div class="sm2-inline-element sm2-button-element">
				<div class="sm2-button-bd">
					<a href="#prev" title="Previous" class="sm2-inline-button previous">&lt;
						previous</a>
				</div>
			</div>

			<div class="sm2-inline-element sm2-button-element">
				<div class="sm2-button-bd">
					<a href="#next" title="Next" class="sm2-inline-button next">&gt;
						next</a>
				</div>
			</div>

			<!-- unimplemented -->
			<!--
  <div class="sm2-inline-element sm2-button-element disabled">
   <div class="sm2-button-bd">
    <a href="#repeat" title="Repeat playlist" class="sm2-inline-button repeat">&infin; repeat</a>
   </div>
  </div>
  -->

			<div class="sm2-inline-element sm2-button-element sm2-menu">
				<div class="sm2-button-bd">
					<a href="#menu" class="sm2-inline-button menu">menu</a>
				</div>
			</div>

		</div>

		<div class="bd sm2-playlist-drawer sm2-element">

			<div class="sm2-inline-texture">
				<div class="sm2-box-shadow"></div>
			</div>

			<!-- playlist content is mirrored here -->

			<div class="sm2-playlist-wrapper">
				<ul class="sm2-playlist-bd" style="margin-bottom: 25px">
					<%
						if (ListaReproduccion.getInstancia().getLista().size() == 0) {
							out.println("<li><a href=''><b>Carga una lista para empezar a escuchar tu música</b></a></li>");
						} else {
							for (int i = 0; i < ListaReproduccion.getInstancia().getLista()
									.size(); i++) {
								out.print("<li>");
								out.print("<a href='"
										+ ListaReproduccion.getInstancia().getLista()
												.get(i).getUrl() + "'>");
								out.print("<b>"
										+ ListaReproduccion.getInstancia().getLista()
												.get(i).getCantante() + "</b>");
								out.print(" "
										+ ListaReproduccion.getInstancia().getLista()
												.get(i).getTitulo());
								out.print("</a>");
								out.print("</li>");
							}
						}
					%>
				</ul>
			</div>

		</div>

	</div>
</body>
</html>