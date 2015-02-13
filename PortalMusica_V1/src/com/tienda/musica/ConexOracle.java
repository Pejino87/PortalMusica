package com.tienda.musica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConexOracle {
	static DataSource miDS= null;
	static Context ic = null;
	Connection oCn =null;
	Statement oStmt = null;
	Statement state = null;
	ResultSet rs = null;

	static {
		//pedimos el contexto de nuestro servidor
		try {
			ic = new InitialContext();
		} catch (NamingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//pedimos el objeto en la ruta java:comp/env/jdbc/NOMBRE_DS
		try {
			miDS = (DataSource) ic.lookup("java:comp/env/jdbc/DataSourceLocalDream");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public Statement establecerConexion() throws SQLException  {
		if (oCn==null) {new Exception("La cagaste, Burlancaster");}
		System.out.println("entra establecerConexion");
			//cogemos la conexión
			oCn = miDS.getConnection();
					
						
			if (oCn != null) {
	            System.out.println("Connected with connection #2");
	        }
			// Obtener un objeto Statement a partir de la Conexión:
			oStmt = oCn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			return oStmt;
	}
	
	public ResultSet consultaQuery(String sSQL) throws SQLException, NamingException {
		System.out.println("entra en consultaQuery");
		state = establecerConexion();
		rs = state.executeQuery(sSQL);
		return rs;
	}
	
	public void actualizarQuery(String sSQL) throws SQLException, NamingException {
		System.out.println("entra en actualizarQuery");
		state = establecerConexion();
		state.executeUpdate(sSQL);
	}
	
	public void finalizarConexion() throws SQLException {
		if (oCn==null||oCn.isClosed()){new Exception("La cagaste, Burlancaster");}
		if (oStmt==null){new Exception("La cagaste, Burlancaster");}
		System.out.println("entra en finalizarConexion");
		oStmt.close(); // Cerramos el objeto Statement
		oCn.close(); // Si no hay más operaciones, es importante liberar la conexión con close()
		
	}
}
