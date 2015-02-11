package com.backend;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.tienda.musica.ConexOracle;

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
	
	public void loadLista(String id_lista,String id_cliente) throws SQLException, NamingException {

		lista.clear();
		Cancion c = null;
		ConexOracle conexion = new ConexOracle();
		ResultSet canciones = conexion.consultaQuery("select can.id_cancion id, can.titulo t, can.album a,can.genero g, can.cantante c, can.duracion d, can.url u from canciones can, listas_cliente client "
		+" where can.id_cancion = client.ID_CANCION AND client.ID_CLIENTE="+id_cliente+" AND client.id_lista="+id_lista);
		
		while(canciones.next()){
			c=new Cancion(canciones.getInt(1),canciones.getString(2),canciones.getString(3),canciones.getString(4),canciones.getString(5),canciones.getInt(6),canciones.getString(7));
			lista.add(c);
		}
		
	}
	
	public void unloadLista(){
		lista.clear();
	}

}
