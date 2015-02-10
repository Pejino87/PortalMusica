package com.backend;

import java.util.ArrayList;

public class ListaModificacion {
	
	private final static ListaModificacion instancia;
	ArrayList<Cancion> lista = new ArrayList<Cancion>();
	
	static {
		instancia = new ListaModificacion();
	}
	
	public static synchronized ListaModificacion getInstancia() {
		return instancia;
	}

	public ArrayList<Cancion> getLista() {
		return lista;
	}

}
