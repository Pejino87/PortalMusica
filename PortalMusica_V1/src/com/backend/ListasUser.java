package com.backend;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.tienda.musica.ConexOracle;

public class ListasUser {
	
	private final static ListasUser instancia;
	
	ArrayList<ListaCanciones> lista = new ArrayList<ListaCanciones>();
	String cliente;
	
	public String getCliente() {
		return cliente;
	}

	static {
		instancia = new ListasUser();
	}
	
	public static synchronized ListasUser getInstancia() {
		return instancia;
	}
	
	public ArrayList<ListaCanciones> getLista() {
		return lista;
	}
	
	public void loadLista(String id_cliente) throws SQLException, NamingException {

		ListaCanciones l = null;
		lista.clear();
		ConexOracle conexion = new ConexOracle();
		
		ResultSet listas = conexion.consultaQuery(""
				+ "SELECT LC.id_lista id, LR.nombre nombre "
				+ "FROM listas_cliente LC,listas_reproduccion LR "
				+ "WHERE id_cliente ="+id_cliente+" AND LC.id_lista = LR.id_lista group by lc.id_lista, lr.nombre");	
		
		while (listas.next()){
			l = new ListaCanciones(listas.getInt("id"),listas.getString("nombre"));
			ListasUser.getInstancia().getLista().add(l);
		}
		
		ResultSet cliente = conexion.consultaQuery("SELECT id_user from login where id_login="+id_cliente+"");
		
		cliente.first();
		this.cliente = cliente.getString(1);
		
	}

}
