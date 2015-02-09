package com.tienda.musica;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.security.*;
import java.security.NoSuchAlgorithmException;

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
		String cNom = request.getParameter("cNom");
		String cApe = request.getParameter("cApe");
		String cRazon = request.getParameter("cRazon");
		String cTel = request.getParameter("cTel");
		String cEmail = request.getParameter("cEmail");
		String cUser = request.getParameter("cUser");
		String cPwd = request.getParameter("cPwd");
		// Preparar una sentencia SQL y ejecutarla
		String sSQL = "INSERT INTO EMPRESA (ID_CLIENTE,NOMBRE,APELLIDOS,RAZONSOCIAL,TELEFONO,EMAIL,USUARIO,CONTRASENA) " +
         " VALUES (1,cNom,cApe,cRazon,cTel,cEmail,cUser,cPwd);";
		String sSQLlogin = "INSERT INTO LOGIN (ID_LOGIN,ID_USER,ID_PASSWORD,TIPO_USER) VALUES (6,cUser,cPwd,'empresa')";
		
		ConexOracle sentencia = new ConexOracle();
		try {
			sentencia.actualizarQuery(sSQL);
			sentencia.actualizarQuery(sSQLlogin);
			response.sendRedirect("index.jsp");
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
