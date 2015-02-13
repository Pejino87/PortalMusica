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

import com.backend.*;

import gft.curso.principalempresa.*;

/**
 * Servlet implementation class ModiEmpresa
 */
public class ModiEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModiEmpresa() {
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
		String cNom = request.getParameter("mNom");
		String cNif = request.getParameter("mNif");
		String cFec = request.getParameter("mFec");
		String cTel1 = request.getParameter("mTel");
		String cDir = request.getParameter("mDir");
		String cEmail = request.getParameter("mEmail");
		int cTel = Integer.parseInt(cTel1);
		
		HttpSession sesion = request.getSession();
		String cli = (String) sesion.getAttribute("rol");
		Integer idLog = (Integer) sesion.getAttribute("ident");
				
		try {
			ConexOracle sentencia = new ConexOracle();
			// Preparar una sentencia SQL y ejecutarla
						
			String sSQL = "UPDATE EMPRESA SET NOMBRE='" + cNom + "',NIF='" + cNif + "',Fecha_Nacimiento='" + cFec
					+ "',TELEFONO='" + cTel + "' "	+ ",DIRECCION='" + cDir + "',EMAIL='" + cEmail 
					+ "' WHERE id_login='" + idLog + "' ";
			
			sentencia.actualizarQuery(sSQL);
		
			request.getRequestDispatcher("PrincipalEmpresa").forward(request, response);
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
