package com.backend;

import java.util.ArrayList;

public class ListaReproduccion {
	
	private final static ListaReproduccion instancia;
	ArrayList<Cancion> lista = new ArrayList<Cancion>();
	
	static {
		instancia = new ListaReproduccion();
	}
	
	public static synchronized ListaReproduccion getInstancia() {
		return instancia;
	}

	public ArrayList<Cancion> getLista() {
		return lista;
	}

}
