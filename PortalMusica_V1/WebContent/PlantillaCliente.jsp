<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.backend.*"%>
<%//COMENT PARA COMMIT %>
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
	<!-- fixed, bottom-aligned, full-width player -->

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
					<li><a
						href="http://srv43.clipconverter.cc/download/4pqabGlonWlpr6yq3JeWtGpkmmVoanBvmpnfe6WZ2HWjoa%2Bd2NfIqg%3D%3D/K-391%20-%20Dream%20Of%20Something%20Sweet%20ft.%20Cory%20Friesenhan%20%5BNCS%20Release%5D.mp3"><b>K-391</b>
							- Dream Of Something Sweet (Test descarga youtube)</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20LA%20%28Prod%20Chin%20Injetti%29.mp3"><b>SonReal</b>
							- LA (Prod. Chin Injetti)<span class="label">Explicit</span></a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20Already%20There%20Remix%20ft.%20Rich%20Kidd%2C%20Saukrates.mp3"><b>SonReal</b>
							- Already There Remix ft. Rich Kidd, Saukrates <span
							class="label">Explicit</span></a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/The%20Fugitives%20-%20Graffiti%20Sex.mp3"><b>The
								Fugitives</b> - Graffiti Sex</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/Adrian%20Glynn%20-%20Seven%20Or%20Eight%20Days.mp3"><b>Adrian
								Glynn</b> - Seven Or Eight Days</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/SonReal%20-%20I%20Tried.mp3"><b>SonReal</b>
							- I Tried</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/mpc/20060826%20-%20Armstrong.mp3">Armstrong
							Beat</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/mpc/20090119%20-%20Untitled%20Groove.mp3">Untitled
							Groove</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/birds-in-kauai-128kbps-aac-lc.mp4">Birds
							In Kaua'i (AAC)</a></li>
					<li><a
						href="http://freshly-ground.com/data/audio/sm2/20130320%20-%20Po%27ipu%20Beach%20Waves.ogg">Po'ipu
							Beach Waves (OGG)</a></li>
				</ul>
			</div>

		</div>

	</div>
</body>
</html>