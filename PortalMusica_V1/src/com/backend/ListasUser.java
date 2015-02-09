package com.backend;

import java.util.ArrayList;

public class ListasUser {
	
	private final static ListasUser instancia;
	
	ArrayList<ListaCanciones> lista = new ArrayList<ListaCanciones>();
	
	static {
		instancia = new ListasUser();
	}
	
	public static synchronized ListasUser getInstancia() {
		return instancia;
	}
	
	public ArrayList<ListaCanciones> getLista() {
		return lista;
	}

}
