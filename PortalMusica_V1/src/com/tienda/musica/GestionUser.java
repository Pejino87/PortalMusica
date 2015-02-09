package com.tienda.musica;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;



public class GestionUser {
	public boolean validaClave(String usu, String pwd) throws SQLException, NamingException {
		ResultSet rs = null;
		boolean tipoDev = false;
		System.out.println("entra en GestionUsuarios");
		try {
			
			//String sSQL1 = "INSERT INTO LOGIN (ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER) VALUES (3,'javi','1234','cliente')";
			//oStmt.executeUpdate(sSQL1);
			
			// Preparar una sentencia SQL y ejecutarla
			String sSQL = "SELECT ID_USER,ID_PASSWORD FROM LOGIN";
			ConexOracle sentencia = new ConexOracle();
			rs = sentencia.consultaQuery(sSQL);
						
			String nomUsu;
			String nomPwd;
			while (rs.next()) {
				 System.out.println("entra if rs");
				 nomUsu = rs.getString("ID_USER"); // get first column returned
				 nomPwd = rs.getString("ID_PASSWORD"); 
				 System.out.println("nomUsu : " + nomUsu);
				 System.out.println("nomPwd : " + nomPwd);
				 
				 if (usu.equals(nomUsu) && pwd.equals(nomPwd)) {
					System.out.println("true : "); 
					tipoDev = true;
				 } 
			 }
			 
			 

		} finally {
			ConexOracle sentencia = new ConexOracle();
			sentencia.finalizarConexion();
		}
		
		return tipoDev;

		
				
		/*
		// Preparar una sentencia SQL y ejecutarla
		String sSQL = "CREATE TABLE LOGIN (" +
		"USER VARCHAR(20) NOT NULL," +
		"PASSWORD VARCHAR(15) NOT NULL," +
		"PRIMARY KEY (USER))";
		
		create table LOGIN (
		ID_LOGIN number(4) constraint ID_LOGIN primary key,
		ID_USER varchar2(15) NOT NULL,
		ID_PASSWORD varchar2(15) NOT NULL,
		TIPO_USER varchar2(15) NOT NULL);
		
		oStmt.executeUpdate(sSQL);
		*/
	
		
		
		
		
	}
}
