package com.tienda.musica;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

public class GestionUser {
	
	public static String MD5 = "MD5";
	ResultSet rs = null;
	String nomUsu;
	String nomPwd;
	
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
		boolean tipoDev = false;
		ConexOracle sentencia=null;
		try {
			String usucontra = getStringMessageDigest(pwd,MD5);
			
			String sSQL = "SELECT ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER FROM LOGIN";
			sentencia = new ConexOracle();
			rs = sentencia.consultaQuery(sSQL);

			while (rs.next()) {
				 nomUsu = rs.getString("ID_USER"); // get first column returned
				 nomPwd = rs.getString("ID_PASSWORD"); 
				 if (usu.equals(nomUsu) && usucontra.equals(nomPwd)) {
					tipoDev = true;
				 } 
			 }
		} finally {
			if (sentencia!=null)
			{sentencia.finalizarConexion();}
		}
		return tipoDev;
	}
		
	public String validaRol(String usu, String pwd) throws SQLException, NamingException {
		String tipoUsua = null;
		ConexOracle sentencia=null;
		try {
			String usucontra = getStringMessageDigest(pwd,MD5);
			String sSQL = "SELECT ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER FROM LOGIN";
			sentencia = new ConexOracle();
			rs = sentencia.consultaQuery(sSQL);

			while (rs.next()) {
				 nomUsu = rs.getString("ID_USER"); // get first column returned
				 nomPwd = rs.getString("ID_PASSWORD"); 
				 if (usu.equals(nomUsu) && usucontra.equals(nomPwd)) {
					tipoUsua = rs.getString("TIPO_USER"); 	
				 } 
			 }
		} finally {
			if (sentencia!=null)
			sentencia.finalizarConexion();
		}
		// devuelve si el tipo de usuario es cliente ó empresa.
		return tipoUsua;
	}
	
	public int validaId(String usu, String pwd) throws SQLException, NamingException {
		int tipoId = 0;
		ConexOracle sentencia=null;
		try {
			String usucontra = getStringMessageDigest(pwd,MD5);
			String sSQL = "SELECT ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER FROM LOGIN";
			sentencia = new ConexOracle();
			rs = sentencia.consultaQuery(sSQL);
			
			while (rs.next()) {
				 nomUsu = rs.getString("ID_USER"); // get first column returned
				 nomPwd = rs.getString("ID_PASSWORD"); 
				 if (usu.equals(nomUsu) && usucontra.equals(nomPwd)) {
					tipoId = rs.getInt("ID_LOGIN"); 	
				 } 
			 }
		} finally {
			if (sentencia!=null)
			sentencia.finalizarConexion();
		}
		// devuelve el idLogin del usuario.
		return tipoId;
	}
	
	public ResultSet tipoRS() throws SQLException, NamingException {
		// Preparar una sentencia SQL y ejecutarla
		String sSQL = "SELECT ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER FROM LOGIN";
		ConexOracle sentencia = new ConexOracle();
		rs = sentencia.consultaQuery(sSQL);
		return rs;
	}
	

}
