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
 * Servlet implementation class PerfilEliminar
 */
public class PerfilEliminar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfilEliminar() {
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
		String cEliCli = request.getParameter("cEliCli");
		String cEliEmp = request.getParameter("cEliEmp");
		
		HttpSession sesion = request.getSession();
		String cli = (String) sesion.getAttribute("rol");
		Integer idLog = (Integer) sesion.getAttribute("ident");
				
		try {
			ConexOracle sentencia = new ConexOracle();
			// Preparar una sentencia SQL y ejecutarla
			if (cli.equals("cliente")) {
				System.out.println("Cliente-->"+idLog);
				String sSQL = "DELETE FROM CLIENTE WHERE id_login=" + idLog;
				String sSQLLOGIN = "DELETE FROM LOGIN WHERE id_login=" + idLog;
				sentencia.actualizarQuery(sSQL);
				sentencia.actualizarQuery(sSQLLOGIN);
				request.getRequestDispatcher("InvalSesion").forward(request, response);
			}
			if (cli.equals("empresa")) {
				String sSQLLista = "DELETE FROM Listas_Reproduccion WHERE Id_Lista in(SELECT Id_Lista FROM"
						+ " Listas_Empresa WHERE Id_Empresa="+idLog+")";
				String sSQL1 = "DELETE FROM EMPRESA WHERE id_login=" + idLog;
				String sSQLLOGIN1 = "DELETE FROM LOGIN WHERE id_login=" + idLog;
				sentencia.actualizarQuery(sSQLLista);
				sentencia.actualizarQuery(sSQL1);
				sentencia.actualizarQuery(sSQLLOGIN1);
				request.getRequestDispatcher("InvalSesion").forward(request, response);
			}
			
			
			
		
			
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
