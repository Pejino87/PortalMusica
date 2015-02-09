package com.backend;

import java.util.ArrayList;

public class ListaCanciones {
	
	int id_lista;
	ArrayList<Cancion> lista;
	String nombre;
	
	ListaCanciones(){
		this.lista = new ArrayList<Cancion>();
	}
	
	public ListaCanciones(int id_lista, String nombre) {
		super();
		this.id_lista = id_lista;
		this.nombre = nombre;
	}
	
	public int getId_lista() {
		return id_lista;
	}

	public void setId_lista(int id_lista) {
		this.id_lista = id_lista;
	}

	public ArrayList<Cancion> getLista() {
		return lista;
	}

	public void setLista(ArrayList<Cancion> lista) {
		this.lista = lista;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



}
