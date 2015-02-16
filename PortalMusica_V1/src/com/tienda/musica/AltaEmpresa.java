package com.tienda.musica;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Servlet implementation class AltaEmpresa
 */
public class AltaEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaEmpresa() {
        super();
        // TODO Auto-generated constructor stub
    }
    
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
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// comprueba si la sesión es válida.
		/*
		HttpSession sesion = request.getSession();
		String cli = (String) sesion.getAttribute("rol");
		if (!cli.equals("empresa")) {
			System.out.println("no es cliente");
			sesion.invalidate();
			response.sendRedirect("index.jsp");
		}
		*/
		// recibe los parámetros de index.jsp
		String cNom = request.getParameter("cNom");
		String cRazon = request.getParameter("cRazon");
		String cFec = request.getParameter("cFec");
		String cDir = request.getParameter("cDir");
		String cTel1 = request.getParameter("cTel");
		String cEmail = request.getParameter("cEmail");
		String cUser = request.getParameter("cUser");
		String cPwd1 = request.getParameter("cPwd");
		int cTel = Integer.parseInt(cTel1);
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();
		String cFca = dateFormat.format(cal.getTime());
		
		// encriptación contraseña
		String cPwd = getStringMessageDigest(cPwd1,MD5);
		System.out.println("MD5 = " + cPwd );
		
		try {
			ConexOracle sentencia = new ConexOracle();
		// Preparar una sentencia SQL y ejecutarla
			
	    String sSQLlogin = "INSERT INTO LOGIN (ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER) VALUES " +
	    		"(INCRELOGIN.nextval, '" + cUser + "' , '" + cPwd + "' ,'empresa')";
		sentencia.actualizarQuery(sSQLlogin);
	    
		
		ResultSet id_login = sentencia.consultaQuery("Select max(id_login) from login");
		int login = 0;
		
		if(id_login.next()){
			login = (Integer)id_login.getInt(1);
		}
		else{
			System.out.println("Error al insertar cliente");
			sentencia.actualizarQuery("rollback");
		}
		
		String sSQL = "INSERT INTO EMPRESA (ID_EMPRESA,NOMBRE,RAZONSOCIAL,Fecha_Nacimiento,TELEFONO,DIRECCION,EMAIL,fecha_alta,id_login) VALUES " +
				"("+login+", '" + cNom + "'  , '" + cRazon + "' , '" + cFec + "'  , '" + cTel + "'  , '" + cDir + 
				"' , '" + cEmail + "' , '" + cFca + "'  , " + login + " )";
				
		sentencia.actualizarQuery(sSQL);
		
			response.sendRedirect("index.jsp");
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
