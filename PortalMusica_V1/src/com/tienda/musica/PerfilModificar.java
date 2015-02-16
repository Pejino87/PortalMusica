package com.tienda.musica;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.acciones.*;

import gft.curso.principalempresa.*;
/**
 * Servlet implementation class PerfilModificar
 */
public class PerfilModificar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfilModificar() {
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
		String cApe = request.getParameter("mApe");
		String cNif = request.getParameter("mNif");
		String cFec2 = request.getParameter("mFec");
		String cTel1 = request.getParameter("mTel");
		String cDir = request.getParameter("mDir");
		String cEmail = request.getParameter("mEmail");
		int cTel = Integer.parseInt(cTel1);
				
		HttpSession sesion = request.getSession();
		String cli = (String) sesion.getAttribute("rol");
		Integer idLog = (Integer) sesion.getAttribute("ident");
		
		String sAnyo =  cFec2.substring(0,4);
		String sMes =  cFec2.substring(5,7);
		String sDia =  cFec2.substring(8,10);
		String cFec = sDia + "/" + sMes + "/" + sAnyo;
		
				
		try {
			ConexOracle sentencia = new ConexOracle();
			// Preparar una sentencia SQL y ejecutarla
			if (cli.equals("cliente")) {
				String sSQL = "UPDATE CLIENTE SET NOMBRE='" + cNom + "',APELLIDOS='" + cApe + "',NIF='" + cNif
						+ "',Fecha_Nacimiento='" + cFec + "',TELEFONO='" + cTel + "' "	+ ",DIRECCION='" + cDir + "',EMAIL='" + cEmail 
						+ "' WHERE id_login='" + idLog + "' ";
				sentencia.actualizarQuery(sSQL);
				request.getRequestDispatcher("IniciaCliente").forward(request, response);
			}
			if (cli.equals("empresa")) {
				String sSQL = "UPDATE EMPRESA SET NOMBRE='" + cNom + "',NIF='" + cNif + "',Fecha_Nacimiento='" + cFec
						+ "',TELEFONO='" + cTel + "' "	+ ",DIRECCION='" + cDir + "',EMAIL='" + cEmail 
						+ "' WHERE id_login='" + idLog + "' ";
				sentencia.actualizarQuery(sSQL);
				request.getRequestDispatcher("PrincipalEmpresa").forward(request, response);
			}
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
