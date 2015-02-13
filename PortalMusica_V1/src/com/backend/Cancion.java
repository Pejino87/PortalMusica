package com.backend;

public class Cancion {
	
	int id_cancion;
	String duracion;
	String titulo,album,genero,cantante,url;


	public Cancion(int id_cancion, String titulo, String album, String genero,
			String cantante, String string, String url) {
		super();
		this.id_cancion = id_cancion;
		this.titulo = titulo;
		this.album = album;
		this.genero = genero;
		this.cantante = cantante;
		this.duracion = string;
		this.url = url;
	}
	
	public int getId_cancion() {
		return id_cancion;
	}

	public void setId_cancion(int id_cancion) {
		this.id_cancion = id_cancion;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getCantante() {
		return cantante;
	}

	public void setCantante(String cantante) {
		this.cantante = cantante;
	}

	public String getDuracion() {
		return duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	

}
