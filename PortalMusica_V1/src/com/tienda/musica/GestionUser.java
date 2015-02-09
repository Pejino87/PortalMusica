package com.tienda.musica;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

import java.security.*;



public class GestionUser {
	
	public static String MD5 = "MD5";
    
    private static String toHexadecimal(byte[] digest){
        String hash = "";
        for(byte aux : digest) {
            int b = aux & 0xff;
            if (Integer.toHexString(b).length() == 1) hash += "0";
				hash += Integer.toHexString(b);
		}
        return hash;
    }
     
    public static String getStringMessageDigest(String message, String algorithm){
        byte[] digest = null;
        byte[] buffer = message.getBytes();
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
            messageDigest.reset();
        messageDigest.update(buffer);
            digest = messageDigest.digest();
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Error creando Digest");
        }
		return toHexadecimal(digest);
    }
	
	public boolean validaClave(String usu, String pwd) throws SQLException, NamingException {
		ResultSet rs = null;
		boolean tipoDev = false;
						
		try {
			
			//String sSQL1 = "INSERT INTO LOGIN (ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER) VALUES (3,'javi','1234','cliente')";
			//oStmt.executeUpdate(sSQL1);
			
			// Preparar una sentencia SQL y ejecutarla
			String sSQL = "SELECT ID_USER,ID_PASSWORD FROM LOGIN";
			ConexOracle sentencia = new ConexOracle();
			rs = sentencia.consultaQuery(sSQL);
			String usucontra = getStringMessageDigest(pwd,MD5);			
			String nomUsu;
			String nomPwd;
			while (rs.next()) {
				 System.out.println("entra if rs");
				 nomUsu = rs.getString("ID_USER"); // get first column returned
				 nomPwd = rs.getString("ID_PASSWORD"); 
				 				 
				 if (usu.equals(nomUsu) && usucontra.equals(nomPwd)) {
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
