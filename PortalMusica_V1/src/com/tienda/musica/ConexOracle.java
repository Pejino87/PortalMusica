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
	DataSource miDS= null;
	Connection oCn =null;
	Statement oStmt = null;
	Statement state = null;
	Context ic = null;
	ResultSet rs = null;
		
	public Statement establecerConexion() throws SQLException, NamingException {
		System.out.println("entra establecerConexion");
			//pedimos el contexto de nuestro servidor
			ic = new InitialContext();
			//pedimos el objeto en la ruta java:comp/env/jdbc/NOMBRE_DS
			miDS = (DataSource) ic.lookup("java:comp/env/jdbc/DataSourceLocalDream");
			//cogemos la conexión
			oCn = miDS.getConnection();
					
			/*
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("GestionUsuarios DESPUES DE CLASSFORNAME");
			String sURL = "jdbc:oracle:thin:@192.168.150.199:1521:orcl";
			oCn= DriverManager.getConnection(sURL, "curso06", "curso");
			*/
						
			if (oCn != null) {
	            System.out.println("Connected with connection #2");
	        }
			// Obtener un objeto Statement a partir de la Conexión:
			oStmt = oCn.createStatement();
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
		System.out.println("entra en finalizarConexion");
		/*rs.close();
		oStmt.close(); // Cerramos el objeto Statement
		oCn.close(); // Si no hay más operaciones, es importante liberar la conexión con close()
		*/
	}
}
